class WashingMachine < ActiveRecord::Base
   after_update :send_notification_after_change

    def send_notification_after_change
    end

end
