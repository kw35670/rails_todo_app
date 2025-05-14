class Task < ApplicationRecord
  belongs_to :team, optional: true
  belongs_to :user, optional: true

  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :status, presence: true

  enum :status, { not_started: 0, in_progress: 1, completed: 2 }

  after_initialize :set_default_status, if: :new_record?

  scope :for_team, ->(team_id) { where(team_id: team_id) }
  scope :for_user_teams, ->(user) { where(team_id: user.teams.pluck(:id)) }

  private

  def set_default_status
    self.status ||= :not_started
  end
end
