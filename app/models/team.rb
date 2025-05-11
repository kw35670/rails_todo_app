class Team < ApplicationRecord
  has_many :team_users
  has_many :users, through: :team_users
  has_many :tasks

  def display_name
    if name.length > 5
      name[0..4] + "..."
    else
      name
    end
  end
end
