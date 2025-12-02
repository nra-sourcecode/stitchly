class Yarn < ApplicationRecord
  has_many :project_yarns
  has_many :projects, through: :project_yarns
end
