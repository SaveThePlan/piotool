class Contact < ActiveRecord::Base

  include PermitsAttributes

  validates :name, presence: true

end
