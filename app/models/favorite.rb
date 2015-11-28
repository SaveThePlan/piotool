class Favorite < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :user, inverse_of: :favorites

  validates :title, presence: true
  validates :url, presence: true
  validates :user, presence: true
end
