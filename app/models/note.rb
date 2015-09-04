class Note < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :user, inverse_of: :notes
  belongs_to :contact, inverse_of: :notes

  validates :user, presence: true
  validates :kind, presence: true

  scope :unassociated, ->() {
    where(contact: nil)
  }

  scope :offers, ->() {
    by_kind(:offer)
  }

  scope :desires, ->() {
    by_kind(:desire)
  }

  scope :personals, ->() {
    by_kind(:personal)
  }

  scope :by_kind, ->(search_kind) {
    where(kind: search_kind)
  }

end
