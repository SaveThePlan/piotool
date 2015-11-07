class Contact < ActiveRecord::Base

  include PermitsAttributes

  validates :user, presence: true
  validates :name, presence: true

  belongs_to :user, inverse_of: :contacts
  has_many :notes, inverse_of: :contact, dependent: :destroy

  scope :search, ->(text, search_in = [:name, :first_name, :email, :activity]) do
    where(search_in.map{|field| "LOWER(contacts.#{field}) LIKE :search"}.join(" OR "), search: "%#{text.downcase}%")
  end
end
