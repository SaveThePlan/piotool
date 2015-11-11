class Note < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :user, inverse_of: :notes
  belongs_to :contact, inverse_of: :notes

  validates :user, presence: true

  scope :unassociated, ->() {
    where(contact: nil)
  }

  scope :search, ->(text) do
    where("LOWER(notes.content) LIKE :search", search: "%#{text.downcase}%")
  end
end
