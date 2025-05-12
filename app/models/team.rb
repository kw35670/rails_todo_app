class Team < ApplicationRecord
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users
  has_many :tasks, dependent: :destroy

  def display_name
    if name.length > 5
      name[0..4] + "..."
    else
      name
    end
  end
end
