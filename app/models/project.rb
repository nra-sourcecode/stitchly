class Project < ApplicationRecord
  belongs_to :user
  has_many :project_yarns
  has_many :tasks
  has_many :yarns, through: :project_yarns
  has_one_attached :pattern
  has_many_attached :images
  validates :title, presence: :true
  validates :designer, presence: :true
  validates :category, presence: true
  validates :product_size, presence: :true
  validates :difficulty, presence: :true
  validates :status, presence: :true
  validates :needle_size, presence: :true

end
