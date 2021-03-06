require 'tentacle_sama/exceptions/not_owner_error'
module TentacleSama
  module Bot
    module DiscordCommands
      module Owner
        extend Discordrb::Commands::CommandContainer
        command(:shutdown, help_available: false, aliases: [:k]) do |event|
          if event.user.id == TentacleSama::Configs::BotConfig.config.bot.owner.to_i
            event.respond ":skull:"
          else
            raise TentacleSama::Execeptions::NotOwnerError.new(event)
          end
          exec('clear')
          exit
        rescue
          event.respond ":negative_squared_cross_mark: | An error occurred"
        end

        # command(:restart, help_available: false, aliases: [:r]) do |event|
        #   begin
        #     if event.user.id == AgeBot::Configs::BotConfig.config.bot.owner
        #       event.respond ":white_check_mark:"
        #     else
        #       raise AgeBot::Exceptions::NotOwnerError
        #     end
        #     sleep 1
        #     exec('ruby gitcord.rb')
        #   rescue AgeBot::Exceptions::NotOwnerError.new(event)
        #     event.respond "No can do, you're not my owner."
        #   rescue
        #     event.respond ":negative_squared_cross_mark: | An error occurred"
        #   end
        # end

        command(:clear, help_available: false, min_args: 1, aliases: [:c]) do |event, count|
          if event.user.id == TentacleSama::Configs::BotConfig.config.bot.owner
            c = count.to_i
            return "1:100" if c > 100
            event.channel.prune c, true
            puts "Deleted Messages"
          else
            raise TentacleSama::Execeptions::NotOwnerError.new(event)
          end
        end
        command(:eval) do |event, *code|
          if event.user.id == TentacleSama::Configs::BotConfig.config.bot.owner.to_i
            eval code.join(' ')
          else
            raise TentacleSama::Execeptions::NotOwnerError.new(event)
          end
        end
      end
    end
  end
end
