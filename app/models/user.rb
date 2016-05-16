class User < ActiveRecord::Base
  # has_many :events
  has_many :categories
  has_and_belongs_to_many :events
end
