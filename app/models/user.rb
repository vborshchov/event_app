class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_many :events
  has_many :categories
  has_many :subscriptions
  has_many :subscribers, :through => :subscriptions
  has_and_belongs_to_many :events
end
