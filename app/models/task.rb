class Task < ApplicationRecord
  belongs_to :tag
  validates :name, presence: true, uniqueness: true
end
