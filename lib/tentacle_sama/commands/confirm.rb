require 'tentacle_sama/exceptions/not_owner_error'
require 'tentacle_sama/helpers'
module TentacleSama
  module Bot
    module DiscordCommands
      # Confirm the age using a command
      module ConfirmAge
        HELPERS = TentacleSama::Bot::Helpers
        extend Discordrb::Commands::CommandContainer
        command(:confirm, help_available: false, min_args: 2) do |event, *args|
          user         = args[0]
          user_name    = user.split('#')[0]
          user_discrim = user.split('#')[1]
          message_id   = args[1]
          puts TentacleSama::Bot.bot.find_user(user_name, user_discrim)
          event.channel.delete_message(message_id)
        end
        command(:reject, help_available: false, min_args: 1) do |event, message_id|
          user = event.author
          if HELPERS.can_confirm? user
            channel = event.channel
            begin
              channel.delete_message(message_id)
            rescue Discordrb::Errors::UnknownMessage
            end
          end
        end
      end
    end
  end
