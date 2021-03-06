# encoding: UTF-8

# Extentions to the core `String` class
#
class String
  # Convert a file name to a Sinatra-compliant template name
  #
  # @example
  #   "blog.haml".templatize  #=> :blog
  #
  # @return [Symbol] A Sinatra-compliant template name
  #
  def templatize
    File.basename(self, '.*').to_sym
  end
end
