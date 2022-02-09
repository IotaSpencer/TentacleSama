require 'tentacle_sama/exceptions/not_owner_error'
require 'tentacle_sama/helpers'
module TentacleSama
  module Bot
    module DiscordCommands
      module Tests
        extend Discordrb::Commands::CommandContainer
        # hlprs = TentacleSama::Bot::Helpers
        # command(:restart, help_available: false, aliases: [:k]) do |event|
        #   hlprs.ch
        # rescue
        #   event.respond ":negative_squared_cross_mark: | An error occurred"
        # end
      end
    end
  end
end
