class Favorite < ActiveRecord::Base

  include PermitsAttributes

  belongs_to :user, inverse_of: :favorites

  validates :title, presence: true
  validates :url, presence: true
  validates :user, presence: true

  before_validation do
    if !self.url.blank? && !self.url.start_with?('http')
      self.url = 'http://' + self.url
    end
  end

  scope :search, ->(text) do
    where("LOWER(favorites.title) LIKE :search" +
            " OR LOWER(favorites.content) LIKE :search" +
            " OR LOWER(favorites.url) LIKE :search", search: "%#{text.downcase}%")
  end
end
