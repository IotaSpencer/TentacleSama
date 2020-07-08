module TentacleSama
  module Bot
    module DiscordEvents
      module JoinsAndLeaves
        extend Discordrb::EventContainer
        member_join do |event|
          user = event.user
          event.bot.channel()
        end
      end
    end
  end
end
