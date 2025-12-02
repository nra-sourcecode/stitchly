class Project < ApplicationRecord
  belongs_to :user
  has_many :project_yarns
  has_many :tasks
  has_many :yarns, through: :project_yarns
end
