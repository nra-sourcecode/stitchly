class Project < ApplicationRecord
  belongs_to :user
  has_many :project_yarns
  has_many :tasks
end
