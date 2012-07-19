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
    # Spin static site files and synch them to the site path.
    #
    def spin(options={})
      static_path options[:dir]

      if options[:update]
        update options
      end

      generator = Generator.new(wiki)

      remove_static_build

      generator.build(static_build_path)

      if settings.sync_script
        cmd = settings.sync_script % [build_path, static_path]
        $stderr.puts cmd
        system cmd
      end
    end

    # Remove static build directory.
    #
    def remove_static_build
      if File.exist?(static_build_path)
        FileUtils.rm_r(static_build_path)
      end
    end

    # Full path to build directory.
    #
    # Returns String to build path.
    def static_build_path
      if settings.sync_script
        tmpdir
      else
        static_path
      end
    end

    # Full path to static site directory.
    #
    # Returns String of static path.
    def static_path(dir=nil)
      @static_path = dir if dir
      (@static_path || settings.static_path).chomp('/')
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
      StaticServer.run(options)
    end

    #  D E P L O Y

    # TODO
    def deploy(options={})
      
    end

  end

end
