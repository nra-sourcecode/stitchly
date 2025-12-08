class Task < ApplicationRecord
  belongs_to :project
    has_many_attached :images

  validates :comment, presence: :true, length: { minimum: 3}
  validates :title, presence: :true
end
