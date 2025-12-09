class Project < ApplicationRecord
  belongs_to :user
  has_many :project_yarns
  has_many :tasks
  has_many :yarns, through: :project_yarns
  has_one_attached :pattern
  has_many_attached :images
  accepts_nested_attributes_for :tasks
  validates :title, presence: :true
  validates :designer, presence: :true
  validates :category, presence: true
  validates :product_size, presence: :true
  validates :difficulty, presence: :true
  validates :status, presence: :true
  validates :needle_size, presence: :true

  # def percentage
  #   done_tasks = self.tasks.where(done: true)
  #   return 0 if done_tasks.empty?
  #   percentage = self.tasks / done_tasks * 100
  # end

  def project_complete?
    if self.tasks.where(state: true).length == self.tasks.length
      self.status = "finished"
      self.save
    end
  end
end
