class Project < ApplicationRecord
  belongs_to :user
  has_many :project_yarns
  has_many :tasks
  has_many :yarns, through: :project_yarns
  has_one_attached :pattern
  has_many_attached :images

  # def percentage
  #   done_tasks = self.tasks.where(done: true)
  #   return 0 if done_tasks.empty?
  #   percentage = self.tasks / done_tasks * 100
  # end

end
