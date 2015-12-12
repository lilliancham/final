class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :signups, :dependent => :destroy
  has_many :signup_events, :through => :signups, :source => :event

  validates :name, :presence => true, :uniqueness => true

end
