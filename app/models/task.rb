class Task < ApplicationRecord
  belongs_to :team

  validates :name, presence: true, length: { minimum: 1 }
  validates :status, presence: true

  enum :status, [:not_started, :in_progress, :completed]
end