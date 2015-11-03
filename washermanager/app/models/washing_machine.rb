class WashingMachine < ActiveRecord::Base
  enum state: [:idle, :run, :dry]
end
