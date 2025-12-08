class Yarn < ApplicationRecord
  has_many :project_yarns
  has_many :projects, through: :project_yarns
  validates :material, presence: :true
end
