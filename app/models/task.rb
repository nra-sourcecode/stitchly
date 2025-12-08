class Task < ApplicationRecord
  belongs_to :project
  validates :comment, presence: :true, length: { minimum: 3}
end
