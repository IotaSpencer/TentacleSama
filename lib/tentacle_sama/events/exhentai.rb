module TentacleSama
  module Bot
    module DiscordEvents
      module ExHentai
        extend Discordrb::EventContainer
        message(contains: 'https://exhentai.org/', private: false) do |message|
          case message.content
          when /https\:\/\/exhentai.org\/g\/(.*)/
            message.channel.send(<<~HERE.strip)
              Here's that from e-hentai.org
              https://e-hentai.org/g/#{$1}
            HERE
          when /https\:\/\/exhentai.org\/s\/(.*)/
            message.channel.send(<<~HERE.strip)
              Here's that from e-hentai.org
              https://e-hentai.org/s/#{$1}
            HERE
          else
          end
        end
      end
    end
  end
end
