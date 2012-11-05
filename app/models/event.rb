class Event < ActiveRecord::Base
  attr_accessible  :name, :user_id, :date_end, :datejs
  validates :name, :datejs, :presence => true
end
