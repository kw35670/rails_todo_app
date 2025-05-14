class Team < ApplicationRecord
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 50 }

  before_create :generate_invite_token

  def display_name
    if name.length > 5
      "#{name[0..4]}..."
    else
      name
    end
  end

  private

  def generate_invite_token
    self.invite_token = SecureRandom.urlsafe_base64(16)
  end
end
