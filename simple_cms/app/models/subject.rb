class Subject < ApplicationRecord
  validates :name, :position, :visible, presence: true
end
