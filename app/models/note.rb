class Note < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :user, inverse_of: :notes
  has_many :contact_notes, inverse_of: :note, dependent: :destroy
  has_many :contacts, through: :contact_notes

  validates :user, presence: true
  validates :title, presence: true
end
