class Task < ActiveRecord::Base
  # before_save :validate_start_date
  validates :title, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :due_date_cannot_be_in_the_past
  belongs_to :list


  def start_date_cannot_be_in_the_past
     if start_date < Date.today
       errors.add(:start_date, "can't be in the past")
     end
   end

  def due_date_cannot_be_in_the_past
    if due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end
end
