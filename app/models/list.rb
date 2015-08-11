class List < ActiveRecord::Base
  validates :title, presence: true
  has_many :tasks, dependent: :destroy

  def incomplete_tasks
    tasks.where(status: 'incomplete')
  end

  def complete_tasks
    tasks.where(status: 'complete')
  end
end
