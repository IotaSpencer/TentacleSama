# frozen_string_literal: true
require 'tentacle_sama/exceptions'
module TentacleSama
  module Bot
    module Helpers
      module_function

      def self.check_for_owner(event)
        # IotaSpencer's ID
        user_id = 234093061045616642
        if event.user.id == TentacleSama::Configs::BotConfig.config.bot.owner.to_i
          true
        else
          false
        end
      end
    end
  end
end
