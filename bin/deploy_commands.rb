#! /usr/bin/ruby

require 'discordrb'
require 'tentacle_sama'
require 'tentacle_sama/config'
token = TentacleSama::Configs::BotConfig.config.bot.token
bot = Discordrb::Bot.new(token: token)
# bot.register_application_command...
bot.register_application_command(:grope, 'Grope a user.', server_id: 626522675224772658) do |cmd|
  cmd.user('target', "Person to be groped/fondled, (If empty(an empty string -> '') will grope the runner)", required: false)
  cmd.string('with', "The things to grope with, if not given will result in a random tentacle based object")
end
