# frozen_string_literal: true

module TentacleSama
  module Bot
    module DiscordEvents
      module StartUp
        extend Discordrb::EventContainer
        ready do |event|
          event.bot.watching = "for holes to plow."
        end
      end
    end
  end
end
