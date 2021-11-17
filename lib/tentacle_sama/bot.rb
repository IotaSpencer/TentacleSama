require 'discordrb'
module TentacleSama
  module Bot
    attr_reader :bot
    prefix_proc = proc do |message|
      # Extract the first word and the rest of the message,
      # and ignore the message if it doesn't start with "!":
      match = /^\$(\w+)(.*)/.match(message.content)
      if match
        first = match[1]
        rest = match[2]
        # Return the modified string with the first word lowercase:
        "#{first.downcase}#{rest}"
      end
    end
    @bot = Discordrb::Commands::CommandBot.new(
      token: TentacleSama::Configs::BotConfig.config.bot.token,
      prefix: prefix_proc,
      fancy_log: true,
      log_mode: :normal,
      advanced_functionality: true,
      compress_mode: :stream,
      intents: :all
    )
    # Discord commands
    module DiscordCommands
      ;
    end

    Dir['lib/tentacle_sama/commands/*.rb'].each do |file|
      load file

      @bot.debug "Loaded Command file: #{file}"
    end
    DiscordCommands.constants.each do |file|
      @bot.debug "Included Command file #{file}"
      @bot.include! DiscordCommands.const_get file
    end

    # Discord events
    module DiscordEvents
      ;
    end

    Dir['lib/tentacle_sama/events/*.rb'].each do |file|
      load file
      @bot.debug "Loaded Event file: #{file}"
    end
    DiscordEvents.constants.each do |file|
      @bot.include! DiscordEvents.const_get file
      @bot.debug "Included Event file #{file}"
    end

    module_function

    def self.start(bg = true)
      @bot.run(bg)
      @bot.join
    rescue Interrupt # Restart
      @botbot.debug ""
      @bot.stop
      @bot.run(bg)
    rescue
    end

    def self.bot
      @bot
    end
  end
end
