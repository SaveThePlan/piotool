class ContactNote < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :contact, inverse_of: :contact_notes
  belongs_to :note, inverse_of: :contact_notes

  validates :contact, presence: true
  validates :note, presence: true

end
