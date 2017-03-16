class Task < ActiveRecord::Base
  belongs_to :user
  validates :item, :due_date, presence: true
end
