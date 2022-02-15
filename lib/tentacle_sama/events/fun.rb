require 'discordrb/container'
module TentacleSama
  module Bot
    module DiscordEvents
      module StartUp
        extend Discordrb::EventContainer
        application_command(:grope) do |event|
          puts event.options
          target = event.bot.user(event.options[:target.to_s])
          event.respond(content: <<~GROPE)
          _gropes_ #{target.mention}
          GROPE
        end
      end
    end
  end
end
