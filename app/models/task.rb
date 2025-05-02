class Task < ApplicationRecord
  enum :status, [:not_started, :in_progress, :completed]
end