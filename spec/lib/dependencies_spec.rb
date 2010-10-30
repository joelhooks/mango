# encoding: UTF-8
require "spec_helper"

describe Mango::Dependencies do

  #################################################################################################

  describe "class constant and variable defaults" do
    it "supports ruby 1.9.1 or 1.9.2" do
      Mango::Dependencies::SUPPORTED_RUBY_VERSIONS.should == ["1.9.1", "1.9.2"]
    end

    it "development gem names and versions should be correct" do
      expected = {
        :"rack-test"    => "0.5.6",
        :rspec          => "2.0.1",
        :yard           => "0.6.1",
        :"yard-sinatra" => "0.5.1",
        :bluecloth      => "2.0.9"
      }

      Mango::Dependencies::DEVELOPMENT_GEMS.should == expected
    end

    it "file name to gem name look-up table should be correct" do
      expected = {
        :"rack/test"            => :"rack-test",
        :"rspec/core/rake_task" => :rspec,
        :"yard/sinatra"         => :"yard-sinatra"
      }
      Mango::Dependencies::FILE_NAME_TO_GEM_NAME.should == expected
    end

    it "warnings cache should be empty" do
      Mango::Dependencies.class_variable_get(:@@warnings_cache).should be_empty
    end
  end

  #################################################################################################

  describe ".check_ruby_version (private)" do
    before(:each) do
      $stderr = StringIO.new
    end

    after(:each) do
      $stderr = STDERR
    end

    def expected_message(version)
      @expected_message = <<-ERROR
This library supports Ruby 1.9.1 or 1.9.2, but you're using #{version}.
Please visit http://www.ruby-lang.org/ or http://rvm.beginrescueend.com/ for installation instructions.
      ERROR
    end

    it "aborts for ruby 1.8.6" do
      version = "1.8.6"
      lambda {
        Mango::Dependencies.send(:check_ruby_version, version)
      }.should raise_exception(SystemExit, expected_message(version))
    end

    it "aborts for ruby 1.8.7" do
      version = "1.8.7"
      lambda {
        Mango::Dependencies.send(:check_ruby_version, version)
      }.should raise_exception(SystemExit, expected_message(version))
    end

    it "aborts for ruby 1.9.0" do
      version = "1.9.0"
      lambda {
        Mango::Dependencies.send(:check_ruby_version, version)
      }.should raise_exception(SystemExit, expected_message(version))
    end

    it "doesn't abort for ruby 1.9.1" do
      version = "1.9.1"
      lambda {
        Mango::Dependencies.send(:check_ruby_version, version)
      }.should_not raise_exception(SystemExit, expected_message(version))
    end

    it "doesn't abort for ruby 1.9.2" do
      version = "1.9.2"
      lambda {
        Mango::Dependencies.send(:check_ruby_version, version)
      }.should_not raise_exception(SystemExit, expected_message(version))
    end
  end

  #################################################################################################

  describe ".destroy_warnings" do
    it "empties the warnings cache" do
      Mango::Dependencies.class_variable_get(:@@warnings_cache).should be_empty

      Mango::Dependencies.create_warning_for(LoadError.new("no such file to load -- yard"))
      Mango::Dependencies.class_variable_get(:@@warnings_cache).should_not be_empty

      Mango::Dependencies.destroy_warnings
      Mango::Dependencies.class_variable_get(:@@warnings_cache).should be_empty
    end
  end

  #################################################################################################

  describe ".create_warning_for" do
    after(:each) do
      Mango::Dependencies.destroy_warnings
    end

    it "creates and caches and cache one warning from a known development gem dependency" do
      Mango::Dependencies.create_warning_for(LoadError.new("no such file to load -- yard"))
      Mango::Dependencies.class_variable_get(:@@warnings_cache).should ==  ["yard --version '0.6.1'"]
    end

    it "creates and caches and cache warnings from all known development gem dependencies" do
      Mango::Dependencies::DEVELOPMENT_GEMS.each_key do |file_name|
        gem_name = if Mango::Dependencies::FILE_NAME_TO_GEM_NAME.has_key?(file_name)
          Mango::Dependencies::FILE_NAME_TO_GEM_NAME[file_name]
        else
          file_name
        end
        load_error = LoadError.new("no such file to load -- #{gem_name}")
        Mango::Dependencies.create_warning_for(load_error)
      end

      expected = [
        "rack-test --version '0.5.6'",
        "rspec --version '2.0.1'",
        "yard --version '0.6.1'",
        "yard-sinatra --version '0.5.1'",
        "bluecloth --version '2.0.9'"
      ]
      Mango::Dependencies.class_variable_get(:@@warnings_cache).should == expected
    end

    it "raises a RuntimeError when creating a warning from an unknown development gem dependency" do
      lambda {
        Mango::Dependencies.create_warning_for(LoadError.new("no such file to load -- _fakegem"))
      }.should raise_exception(RuntimeError, "Cannot create a dependency warning for unknown development gem -- _fakegem")
    end
  end

  #################################################################################################

  describe ".render_warnings" do
    before(:each) do
      $stdout = StringIO.new
    end

    after(:each) do
      $stdout = STDOUT
    end

    it "displays a warning message to the user on the standard output channel" do
      Mango::Dependencies.create_warning_for(LoadError.new("no such file to load -- rspec/core/rake_task"))
      Mango::Dependencies.create_warning_for(LoadError.new("no such file to load -- yard"))
      Mango::Dependencies.create_warning_for(LoadError.new("no such file to load -- bluecloth"))
      Mango::Dependencies.render_warnings
      $stdout.string.should == <<-MESSAGE

The following development gem dependencies could not be found. Without them, some available development features are missing:
rspec --version '2.0.1'
yard --version '0.6.1'
bluecloth --version '2.0.9'
      MESSAGE
    end

    it "doesn't display a warning message to the user if there are no warnings in the cache" do
      Mango::Dependencies.destroy_warnings
      Mango::Dependencies.render_warnings
      $stdout.string.should be_empty
    end
  end

  #################################################################################################

  describe ".warn_at_exit" do
    it "ensures Kernel#at_exit is invoked with a block" do
      Mango::Dependencies.should_receive(:at_exit)
      # TODO how to specify that #at_exit receives a block?
      # maybe i can intercept the block, execute it and test the output?
      Mango::Dependencies.warn_at_exit
    end
  end
end