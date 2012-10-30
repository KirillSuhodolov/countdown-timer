class Event < ActiveRecord::Base
  attr_accessible :datetime_end, :name, :user_id
end
