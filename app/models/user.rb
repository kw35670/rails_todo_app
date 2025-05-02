class User < ApplicationRecord
  default_scope { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.current)
  end

  def deleted?
    deleted_at.present?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, length: { maximum: 255 }
  validates :password, length: { minimum: 8 }, allow_blank: true

  has_many :team_users
  has_many :teams, through: :team_users
  has_many :tasks
end
