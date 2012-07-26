module Shelob
  LIBDIR = File.dirname(__FILE__) + '/shelob'
end

require 'fileutils'
require 'tmpdir'
require 'smeagol'

require 'shelob/cli'
require 'shelob/console'
require 'shelob/generator'
require 'shelob/server'

