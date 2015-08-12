class Task < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :due_date_cannot_be_in_the_past
  belongs_to :list


  def start_date_cannot_be_in_the_past
     if (start_date < Date.today)
       errors.add(:start_date, "can't be in the past")
     end
   end

  def due_date_cannot_be_in_the_past
    if (due_date < Date.today)
      errors.add(:due_date, "can't be in the past")
    end
  end

  def update_status
    if complete?
      update(status: 'incomplete')
    else
      update(status: 'complete')
    end
  end

  def complete?
    status == 'complete'
  end

  def the_past?
    true if self.start_date.present? && self.start_date <= Date.today
  end
end
