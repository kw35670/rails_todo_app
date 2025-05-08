class Task < ApplicationRecord
  belongs_to :team, optional: true

  validates :name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :status, presence: true

  enum :status, [:not_started, :in_progress, :completed]

  after_initialize :set_default_status, if: :new_record?

  def display_name
    if name.length > 10
      name[0..8] + "..."
    else
      name
    end
  end

  private

  def set_default_status
    self.status ||= :not_started
  end
end