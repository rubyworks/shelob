module Shelob

  # Shelob::CLI module is a function module that provides
  # all command line interfaces.
  #
  module CLI

    extend self

    #
    # Initialize Gollum wiki for customized use with Deagol.
    #
    def init(argv)
      parser.banner = "usage: shelob-init [OPTIONS] [WIKI-URI]"

      # TODO: support more settings options for creating setup

      Console.init(*parse(argv))
    end

    # Convert to static site.
    #
    # Update wiki repo and update/clone static site repo, if designated
    # by settings.
    #
    # Returns nothing.
    def spin(argv)
      options[:update] = true
      options[:build]  = true

      parser.banner = "usage: shelob-spin [OPTIONS]"

      parser.on('-U' '--no-update', 'skip repo update') do
        options[:update] = false
      end

      parser.on('-B' '--no-build', 'skip static build') do
        options[:build] = false
      end

      parser.on('-d', '--dir DIR', 'alternate site directory') do |dir|
        dir = nil if %w{false nil ~}.include?(dir)  # TODO: better approach? 
        options[:dir] = dir
      end

      Console.spin(*parse(argv))
    end

    # Preview website.
    #
    #   TODO: Build if not already built.
    #
    # Returns nothing.
    def preview(argv)
      parser.banner = "Usage: shelob-preview [OPTIONS]"

      #parser.on('-b', '--build', 'perform build before preview') do
      #  build = true
      #end

      lineno = 1
      parser.on("-e", "--eval LINE", "evaluate a LINE of code") { |line|
        eval line, TOPLEVEL_BINDING, "-e", lineno
        lineno += 1
      }

      parser.on("-d", "--debug", "set debugging flags (set $DEBUG to true)") {
        options[:debug] = true
      }

      parser.on("-w", "--warn", "turn warnings on for your script") {
        options[:warn] = true
      }

      parser.on("-I", "--include PATH",
              "specify $LOAD_PATH (may be used more than once)") { |path|
        (options[:include] ||= []).concat(path.split(":"))
      }

      parser.on("-r", "--require LIBRARY",
              "require the library, before executing your script") { |library|
        options[:require] = library
      }

      parser.on("-s", "--server SERVER", "serve using SERVER (thin/puma/webrick/mongrel)") { |s|
        options[:server] = s
      }

      parser.on("-o", "--host HOST", "listen on HOST (default: 0.0.0.0)") { |host|
        options[:Host] = host
      }

      parser.on("-p", "--port PORT", "use PORT (default: 9292)") { |port|
        options[:Port] = port
      }

      parser.on("-O", "--option NAME[=VALUE]", "pass VALUE to the server as option NAME. If no VALUE, sets it to true. Run '#{$0} -s SERVER -h' to get a list of options for SERVER") { |name|
        name, value = name.split('=', 2)
        value = true if value.nil?
        options[name.to_sym] = value
      }

      parser.on("-E", "--env ENVIRONMENT", "use ENVIRONMENT for defaults (default: development)") { |e|
        options[:environment] = e
      }

      parser.on("-D", "--daemonize", "run daemonized in the background") { |d|
        options[:daemonize] = d ? true : false
      }

      parser.on("-P", "--pid FILE", "file to store PID (default: rack.pid)") { |f|
        options[:pid] = ::File.expand_path(f)
      }

      #parser.on_tail("-h", "-?", "--help", "Show this message") do
      #  puts parser
      #  #puts handler_parser(options)
      #  exit
      #end

      #parser.parse!(argv)
      #rack_parser = ::Rack::Server::Options.new(options)
      #rack_options = rack_parser.parse!(argv)
      #@options = rack_options.merge(smeagol_options)

      $stderr.puts "Starting static preview..."

      Console.preview(*parse(argv))
    end

    #
    # TODO: Implement deploy
    #
    def deploy(argv)

      Console.deploy(*parse(argv))
    end

  private

    #
    # Parsed command line options.
    #
    # @return [Hash]
    #
    def options
      @options ||= {}
    end

    #
    # Read command line options into `options` hash.
    #
    # @return [Array] Arguments and options.
    #
    def parse(argv)
      begin
        parser.parse!(argv)
      rescue ::OptionParser::InvalidOption
        puts "smeagol: #{$!.message}"
        puts "smeagol: try 'smeagol --help' for more information"
        exit 1
      end
      return *(argv + [options])
    end

    #
    # Create and cache option parser.
    #
    # @return [OptionParser]
    #
    def parser
      @parser ||= (
        parser = ::OptionParser.new
        parser.on_tail('--debug', 'Turn on $DEBUG mode.') do
          $DEBUG = true
        end
        parser.on_tail('-v', '--version', 'Display current version.') do
          puts "Deagol #{Deagol::VERSION}"
          exit 0
        end
        parser.on_tail('-h', '-?', '--help', 'Display this help screen.') do
          puts parser
          exit 0
        end
        parser
      )
    end

  end

end
