module Shelob

  #
  module Console

    extend self

    #  I N I T

    #
    # Presently this just calls `Smeagol::Console.init()`.
    #
    def init(*args)
      Smeagol::Console.init(*args)
    end

    #  S P I N

    #
    # Spin static site files and sync them to the site path.
    #
    def spin(options={})
      site_path options[:dir]

      if options[:update]
        update options
      end

      generator = Generator.new(wiki)

      remove_old_build

      generator.build(build_path)

      if settings.site_sync
        cmd = settings.site_sync % [build_path, site_path]
        $stderr.puts cmd
        system cmd
      end
    end

    # Remove static build directory.
    #
    def remove_old_build
      if File.exist?(build_path)
        FileUtils.rm_r(build_path)
      end
    end

    # Full path to build directory.
    #
    # Returns String to build path.
    def build_path
      if settings.site_sync
        tmpdir
      else
        site_path
      end
    end

    # Full path to site directory.
    #
    # Returns String of static path.
    def site_path(dir=nil)
      @site_path = dir if dir
      dir = @site_path || settings.site_path
      dir.chomp('/')
    end

    # TODO: Maybe add a random number to be safe.
    #
    # Return String path to system temprorary directory.
    def tmpdir(base=nil)
      if base
        ::File.join(Dir.tmpdir, 'shelob', base)
      else
        ::File.join(Dir.tmpdir, 'shelob', Time.now.year.to_s)
      end
    end

    #  P R E V I E W

    #
    # Preview a generated build directory. This is useful to 
    # ensure the static build went as expected.
    #
    # TODO: Would be happy to use thin if it supported fixed "static" adapter.
    #
    def preview(options={})
      #build_dir = options[:build_dir] || settings.build_dir
      #system "thin start -A file -c #{build_dir}"
      Server.run(options)
    end

    #  D E P L O Y

    # TODO
    def deploy(options={})
      
    end

    #
    # Update wiki.
    #
    def update(options={})
      dir  = File.expand_path(wiki_dir)
      repo = Smeagol::Repository.new(:path=>dir)
      out  = repo.update
      out  = out[1] if Array === out
      report out
    end

  private

    #
    # Current wiki directory.
    #
    # Returns wiki directory. [String]
    #
    def wiki_dir
      @wiki_dir || Dir.pwd
    end

    #
    # Get and cache Wiki object.
    #
    # Returns wiki. [Wiki]
    #
    def wiki
      @wiki ||= Smeagol::Wiki.new(wiki_dir)
    end

    #
    # Local wiki settings.
    #
    # Returns wiki settings. [Settings]
    #
    def settings
      @settings ||= Smeagol::Settings.load(wiki_dir)
    end

    #
    # Print to $stderr unless $QUIET.
    #
    def report(msg)
      $stderr.puts msg unless $QUIET
    end

  end

end
