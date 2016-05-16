class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :users

  alias_attribute :creator, :user
  alias_attribute :subscribers, :users

  validates_presence_of :user, :category
end
