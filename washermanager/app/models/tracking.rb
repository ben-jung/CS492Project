class Tracking < ActiveRecord::Base
  validates_uniqueness_of :machine_id, scope: :APNS_token
end
