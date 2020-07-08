require 'tty-config'
require 'recursive-open-struct'
module TentacleSama
  module Configs
    class BotConfig
      @config          = TTY::Config.new
      @config.filename = 'config'
      @config.extname  = '.yml'
      @config.prepend_path Pathname.new(Dir.home).join('.tentacle_sama')

      def self.config
        RecursiveOpenStruct.new @config.read, recurse_over_arrays: true
      end
    end

    class ServerDB
        @config          = TTY::Config.new
        @config.filename = 'serverdb'
        @config.extname  = '.yml'
        @config.prepend_path Pathname.new(Dir.home).join('.tentacle_sama')

      def self.db
        RecursiveOpenStruct.new @config.read, recurse_over_arrays: true
      end
    end
  end
end