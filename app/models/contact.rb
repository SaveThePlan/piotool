class Contact < ActiveRecord::Base

  include PermitsAttributes

  validates :user, presence: true
  validates :name, presence: true

  belongs_to :user, inverse_of: :contacts

end
