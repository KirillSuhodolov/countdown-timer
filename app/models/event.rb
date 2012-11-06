class Event < ActiveRecord::Base
  attr_accessible  :name, :user_id, :datejs
  validates :name, :datejs, :presence => true
end
