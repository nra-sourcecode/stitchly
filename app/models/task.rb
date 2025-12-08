class Task < ApplicationRecord
  belongs_to :project
  validates :comment, presence: :true, length: { minimum: 3}
  validates :title, presence: :true
end
