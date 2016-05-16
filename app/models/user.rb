class User < ActiveRecord::Base
  has_many :events
  has_many :categories
  has_many :subscriptions
  has_many :subscribers, :through => :subscriptions
end
