class Profile < ApplicationRecord
  belongs_to :user
  validates :username, presence: true, uniqueness: true
  validates :nickname, presence: true
  validates :bio, length: { maximum: 500 }
  validates :user, uniqueness: true
  has_many :payment_links, dependent: :destroy
end
