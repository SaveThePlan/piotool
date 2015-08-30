class User < ActiveRecord::Base

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include PermitsAttributes

  has_many :contacts, inverse_of: :user, dependent: :destroy

end
