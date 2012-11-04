class Event < ActiveRecord::Base
  attr_accessible  :name, :user_id, :date_end
  validates :name, :date_end, :presence => true
end
