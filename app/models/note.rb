class Note < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :user, inverse_of: :notes
  belongs_to :contact, inverse_of: :notes

  validates :user, presence: true

  scope :unassociated, ->() {
    where(contact: nil)
  }

end
