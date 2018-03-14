class SubTask < ApplicationRecord
  validates :task_id, presence: true

  belongs_to :task
end
