class Task < ActiveRecord::Base
  belongs_to :user
  validates :item, :due_date, presence: true
  after_initialize :set_default

  def set_default
    self.complete = false
  end
end
