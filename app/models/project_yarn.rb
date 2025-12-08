class ProjectYarn < ApplicationRecord
  belongs_to :yarn
  belongs_to :project
  validates :amount, presence: :true
end
