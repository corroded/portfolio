require 'haml'

module Config
  #
  # Create and configure a ruby-slippers instance
  #
  $app = RubySlippers::Engine::App.new do
    #log_file = File.expand_path("../log/slippers.log", __FILE__)
    #log = File.new(log_file, "a+")
    #$stdout.reopen(log)
    #$stderr.reopen(log)

    #
    # Add your settings here
    # set [:setting], [value]
    #
    set :author,      "eumir"                              # blog author
    set :title,       "deadcanvas"                        # site title
    set :root,        "index"                                   # page to load on /
    set :date,        lambda {|now| now.strftime("%Y/%m/%d") }    # date format for articles
    # set :markdown,  :smart                                    # use markdown + smart-mode
    set :disqus,      "deadcanvas"                                     # disqus id, or false
    set :summary,     :max => 300, :delim => /~/                # length of article summary and delimiter
    set :ext,         'md'                                     # file extension for articles
    # set :cache,      28800                                    # cache duration, in seconds
    set :tag_separator, ', '                                    # tag separator for articles
    set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
    # set this to your local port. I use shotgun, so 9393.
    set :url, "http://localhost:3000" if ENV['RACK_ENV'] == 'development'

    # to use haml, add the gem to your Gemfile and bundle, then uncomment this
    # and redo your templates using haml
    set :to_html, lambda { |path, page, binding|
      ::Haml::Engine.new(File.read("#{path}/#{page}.html.haml"),
      :attr_wrapper => '"',
      :filename => path ).render(binding)
    }
  end

end

