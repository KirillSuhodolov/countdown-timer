class Event < ActiveRecord::Base
  attr_accessible  :name, :user_id, :date_end
end
