class Contact < ActiveRecord::Base

  include PermitsAttributes

  validates :user, presence: true
  validates :name, presence: true

  belongs_to :user, inverse_of: :contacts
  has_many :notes, inverse_of: :contact, dependent: :destroy

end
