class Contact < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :user, inverse_of: :contacts
  has_many :contact_notes, inverse_of: :contact, dependent: :destroy
  has_many :notes, through: :contact_notes

  validates :user, presence: true
  validates :name, presence: true

end
