Mango release 0.6.0 (May 29, 2011)
==================================

Copyright (c) 2010 Ryan Sobol. Licensed under the MIT license.  Please see the {file:LICENSE} for more information.

  * **Demo Application** : [http://mango-fireworks.heroku.com/](http://mango-fireworks.heroku.com/)
  * **Source Code**: [https://github.com/ryansobol/mango](https://github.com/ryansobol/mango)
  * **Documentation**: [http://rubydoc.info/github/ryansobol/mango/master/frames](http://rubydoc.info/github/ryansobol/mango/master/frames)
  * **Issue Tracker**: [https://github.com/ryansobol/mango/issues](https://github.com/ryansobol/mango/issues)
  * **Wiki**: [http://wiki.github.com/ryansobol/mango](http://wiki.github.com/ryansobol/mango)

SYNOPSIS
--------

**Mango is a dynamic, database-free, and open source website framework that is designed to make life easier for small teams of designers, developers, and content writers.**

FEATURES
--------

### Easy to install

Mango installs as a [RubyGem](https://rubygems.org/gems/mango) and contains all the necessary components to get a basic website up-and-running in seconds.

### Easy to write

Mango integrates with the writing tools you're already familiar with -- the file system and your favorite text editor.

Working with a text editor you already know *saves time*.  And writing and revising content in a file *is often easier* then using the clunky administrator interface of a CMS (e.g. WordPress).  Plus, files *match perfectly* with version control systems, like [Git](http://git-scm.com/), for powerful revision history.  Bonus!

Mango supports the following *easy to write* content formats:

  * [Markdown](http://daringfireball.net/projects/markdown/basics)
  * [Haml](http://haml-lang.com/tutorial.html)
  * [ERB](http://ruby-doc.org/stdlib/libdoc/erb/rdoc/classes/ERB.html)
  * [Liquid](https://github.com/tobi/liquid/wiki)

Don't see your favorite content format?  [Patches are welcomed](https://github.com/ryansobol/mango/issues)

### Easy to theme

Mango separates a website's theme from it's content.  This makes it *easy to change* the look-and-feel of a single page or an entire website.  Mango also supports powerful template languages that make it *easy to have uniformity*  with major sections (i.e. headers, footers, navigation, sidebars, etc.) across multiple pages.  In addition to the standard browser formats -- HTML, CSS, and JavaScript --  Mango also supports the following template engines:

  * [Haml](http://haml-lang.com/)
  * [ERB](http://ruby-doc.org/stdlib/libdoc/erb/rdoc/classes/ERB.html)
  * [Liquid](https://github.com/tobi/liquid/wiki)
  * [Scss](http://sass-lang.com/) and [Sass](http://sass-lang.com/)
  * [CoffeeScript](http://jashkenas.github.com/coffee-script/)

Don't see your favorite template engine?  [Patches are welcomed](https://github.com/ryansobol/mango/issues)

### Easy to publish

Mango applications are dead-simple to publish.  Mango was designed to support a wide variety of publishing tools like:

  * Single target, drag-and-drop secure FTP uploading
  * Multiple target, automated deploying with [Capistrano](https://github.com/capistrano/capistrano)
  * Cutting-edge cloud deploying with [Git](http://git-scm.com/) and [Heroku](http://heroku.com/)

### Easy to collaborate

With a strong separation of writing, theming and publishing, Mango applications are *designed to be shared* with content writers, web designers, and web developers.  But the beauty of Mango is that its simple, file-based approach *appeals to both veterans and newcomers*.  In addition, Mango has an emphasis on *accurate documentation*.  Mango understands that getting up and running quickly is critical for domain-specific experts.

### Easy to maintain

Mango is a database-less web framework.  With no database to install, configure, or manage, the maintenance needed to keep your website in working order is *drastically reduced*.  And because Mango is distributed as a RubyGem and respects [Semantic Versioning](http://semver.org/), *upgrading is painless and backwards-compatible* between patch releases.

### Easy to scale

Mango application's are *built for speed*.  With minimal server side scripting and zero database queries, Mango is *lightening fast* and the user experience is snappy.

### Easy on the wallet

Mango is *free* and open source software.

REQUIREMENTS
------------

**Mango respects [Semantic Versioning](http://semver.org/).**

### Required dependencies

  * [Ruby](http://www.ruby-lang.org/) ~> 1.9.2 ([RVM](http://rvm.beginrescueend.com/) recommended)
  * [RubyGems](https://rubygems.org/) >= 1.3.7 (bundled with Ruby)
  * [Bundler](http://gembundler.com/) ~> 1.0.7
  * [Rack](http://rack.rubyforge.org/) ~> 1.2.2
  * [Sinatra](http://www.sinatrarb.com/) ~> 1.2.6
  * [Haml](http://haml-lang.com/) ~> 3.1.1
  * [Sass](http://sass-lang.com/) ~> 3.1.1
  * [BlueCloth](http://deveiate.org/projects/BlueCloth) ~> 2.1.0
  * [Liquid](http://www.liquidmarkup.org/) ~> 2.2.2
  * [CoffeeScript](http://jashkenas.github.com/coffee-script/) ~> 2.2.0
  * [Thor](https://github.com/wycats/thor) ~> 0.14.6

### Optional development dependencies

  * [Rake](http://rake.rubyforge.org/) ~> 0.8.7 (bundled with Ruby)
  * [Rack::Test](https://github.com/brynary/rack-test) ~> 0.6.0
  * [RSpec](http://rspec.info/) ~> 2.6.0
  * [YARD](http://yardoc.org/) ~> 0.7.1
  * [YARD::Sinatra](https://github.com/rkh/yard-sinatra) ~> 0.5.1
  * [BlueCloth](http://deveiate.org/projects/BlueCloth) ~> 2.1.0

INSTALLING
----------

### Ensuring Ruby 1.9.2 is installed and active

I highly recommend [RVM](http://rvm.beginrescueend.com/) by Wayne E. Seguin.  It trivializes managing multiple versions of Ruby on one machine.

    $ ruby -v
    ruby 1.9.2p0 (2010-08-18 revision 29036) [x86_64-darwin10.4.0]

**TIP:** The revision and arch-type may differ on your machine.

### Installing the Mango gem

Mango, and all its necessary components, are packaged as RubyGems for easy distribution.

    $ gem install mango

**TIP:** If you're not using [RVM](http://rvm.beginrescueend.com/), you *may* want to prepend the `gem` command with `sudo`.

### Upgrading a Mango application

Simply edit the gem version in your application's `Gemfile` and re-install with [Bundler](http://gembundler.com/).

    $ cd /path/to/your/app
    $ cat Gemfile
    # encoding: UTF-8
    source "http://rubygems.org"
    gem "mango", "~> 0.6.0"
    $ bundle install

**TIP:** If you're working in the insolation of an [RVM gemset](http://rvm.beginrescueend.com/gemsets/basics/), type `gem clean` to uninstall outdated gems.

GETTING STARTED
---------------

### Generating a Mango application

With Mango installed, the `mango` command will generate a new application.

    $ mango create /path/to/your/app

### Starting the application

Mango applications are compatible with any [Rack supported web-server](http://rack.rubyforge.org/doc/).  The `rackup` command will start a web-server (default: WEBrick) listening at `http://0.0.0.0:9292`.

    $ cd /path/to/your/app
    $ rackup
    [2010-10-30 15:39:41] INFO  WEBrick 1.3.1
    [2010-10-30 15:39:41] INFO  ruby 1.9.2 (2010-08-18) [x86_64-darwin10.4.0]
    [2010-10-30 15:39:41] INFO  WEBrick::HTTPServer#start: pid=27513 port=9292

**TIP:** Type `Control + C` to quit `rackup`.

### Using an alternative web-server

If you prefer an alternative web-server (e.g. `thin`), simply install the gem and use the `-s SERVER` option to specify the web-server.

    $ cd /path/to/your/app
    $ gem install thin
    $ rackup -s thin
    >> Thin web server (v1.2.7 codename No Hup)
    >> Maximum connections set to 1024
    >> Listening on 0.0.0.0:9292, CTRL+C to stop

**TIP:** To see a list of all the `rackup` command-line options, use the `--help` option.

### Generated application structure

Now that the newly generated Mango application is running, here's how the application is structured.

    $ tree /path/to/your/app
    /path/to/your/app
    ├── Gemfile
    ├── README.md
    ├── config.ru
    ├── content
    │   └── index.erb
    └── themes
        └── default
            ├── javascripts
            │   └── timer.coffee
            ├── public
            │   ├── favicon.ico
            │   ├── images
            │   │   └── particles.gif
            │   ├── javascripts
            │   │   └── fireworks.js
            │   ├── robots.txt
            │   └── stylesheets
            │       ├── fireworks.css
            │       └── reset.css
            ├── stylesheets
            │   └── screen.sass
            └── views
                ├── 404.haml
                ├── layout.haml
                └── page.haml

**TIP:** The [tree](http://mama.indstate.edu/users/ice/tree/) command is awesome!

### Under the hood

  * First, Mango tries to route an HTTP request to a static file found in `themes/default/public/`.
  * If no static file is found, Mango tries to route the request to a template file.
    * For routes ending in `.js`, Mango searches for a stylesheet template in `themes/javascripts/`.
    * For routes ending in `.css`, Mango searches for a stylesheet template in `themes/stylesheets/`.
    * For all other routes, Mango searches for a content page in `content/` and wraps it within a view template in `themes/default/views`.
  * If no static or template file is found, Mango routes unknown HTTP requests to a customizable 404 page found in either `themes/default/public` or `themes/default/views`.

WRITING
-------

Coming soon.  [Patches are welcomed](https://github.com/ryansobol/mango/issues#issue/2).

THEMING
-------

Coming soon.  [Patches are welcomed](https://github.com/ryansobol/mango/issues#issue/3).

PUBLISHING
----------

### Deploying to a single target with secure FTP uploads

Coming soon.  [Patches are welcomed](https://github.com/ryansobol/mango/issues#issue/4).

### Deploying to multiple targets with Capistrano

Coming soon.  [Patches are welcomed](https://github.com/ryansobol/mango/issues#issue/5).

### Deploying to the cloud with Heroku

Heroku (pronounced her-OH-koo) is a cloud platform for Ruby-powered web applications.  Heroku lets app developers spend 100% of their time on their application code, not managing servers, deployment, ongoing operations, or scaling.  And best of all, Mango applications can leverage this power with their *free* [Blossom tier](http://heroku.com/pricing).

If you haven't done so already, prepare your Mango application with Git.  Just initialize a new Git repository, add the project directory, and commit.

    $ cd /path/to/your/app
    $ git init
    $ git add .
    $ git commit -m "First commit"

Next, [get started with Heroku](http://docs.heroku.com/heroku-command#installation) by signing up for an account, installing the `heroku` gem, and adding your ssh public key to their network.

    $ gem install heroku
    $ heroku keys:add

Then [create a heroku app](http://docs.heroku.com/creating-apps) that targets the "Badius Bamboo" plus "Matz Ruby Implementation" 1.9.2 [platform stack](http://docs.heroku.com/stack).

    $ heroku create APP_NAME --stack bamboo-mri-1.9.2

Finally, [deploy](http://docs.heroku.com/git) the heroku app.  If you've followed these instructions carefully, deployment is trivial.

    $ git push heroku master

Now, bask in the glory of your *live application* in the cloud.

    $ heroku open

**TIP:** Like the entire the platform, the `heroku` command-line tool has [great documentation](http://docs.heroku.com/heroku-command).

PHILOSOPHY
----------

### Painless collaboration

Mango is designed to make life easier for small, integrated teams.  They prefer tools that allow for shared access to the same resources and for processes that provide instantaneous feedback.

### Harness the power of the Ruby toolbox

The Ruby on Rails revolution has arrived.  The world's next-generation web applications are built with powerful tools from the Ruby eco-system.  Mango is designed to harness this power, but delivered in a smaller package to meet the needs of simpler websites.

CONTRIBUTING
------------

**Thank you for taking the time to help improve Mango.**

### Reporting Issues

Is Mango not behaving like you expect it should?  Please forgive me.  Submit a report over at the [Issue Tracker](https://github.com/ryansobol/mango/issues) and I'll get that sorted out.

**TIP:** You can read through existing issues and vote for the ones you'd like to see resolved first.

### Submitting Patches

Is Mango not behaving like you need?  Patches are always welcomed and appreciated.  [Report your issue](https://github.com/ryansobol/mango/issues) to make sure we're not duplicating any work and go to town.  Alternatively, you can lend a hand on [existing issues](https://github.com/ryansobol/mango/issues).

Once you've been assigned an issue, the process for contributing your work back to the source is straight-forward.

  * Fork the project.
  * Make your feature addition or bug fix **with specifications**.  It's important that your hard work isn't unintentionally broken in a future version.
  * Please do not casually alter files in the project root. (e.g. `LICENSE`, `README.mdown`, `mango.gemspec`, etc.)
  * Commit and publish your change-set.
  * Send a pull request.  **Remember, all specs must pass.**

**TIP:** Take a moment to get a feel for the style of coding, specifications, and in-line documentation.

Mango has a plethora of documentation to bring a Rubyist of any level up to speed.  Once the development dependencies are met (please see the REQUIREMENTS section), fire up the documentation web server.

    $ yard server

Then point your browser to `http://0.0.0.0:8808`

CREDITS
-------

Thanks to all of my friends and family for their invaluable support!
