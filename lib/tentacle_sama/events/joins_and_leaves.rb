module TentacleSama
  module Bot
    module DiscordEvents
      module JoinsAndLeaves
        SDB = TentacleSama::Configs::ServerDB.db
        extend Discordrb::EventContainer
        member_join do |event|
          user = event.user
          event.bot.channel(SDB.servers[event.server.id.to_s].audit_channel).send_embed do |embed|
            embed.title       = "A member joined!"
            embed.color       = '48f800'
            embed.description = "**#{event.user.mention}** joined!"
            embed.thumbnail   = Discordrb::Webhooks::EmbedThumbnail.new(url: event.user.avatar_url)
            embed.footer      = Discordrb::Webhooks::EmbedFooter.new(text: DateTime.now, icon_url: nil)
          end
        end
        member_leave do |event|
          user = event.user
          event.bot.channel(SDB.servers[event.server.id.to_s].audit_channel).send_embed do |embed|
            embed.title       = "A member left."
            embed.color       = 'ff0000'
            embed.description = "**#{event.user.mention}** left."
            embed.thumbnail   = Discordrb::Webhooks::EmbedThumbnail.new(url: event.user.avatar_url)
            embed.footer      = Discordrb::Webhooks::EmbedFooter.new(text: DateTime.now, icon_url: nil)
          end
        end
      end
    end
  end
end
