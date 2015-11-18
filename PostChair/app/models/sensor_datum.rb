class SensorData < ActiveRecord::Base
  #Associations
  belongs_to :user_id

  #Validations
  validates :user_id_id, presence: true, numericality: { only_integer: true }
  #The number 5 is arbitrary and pased on the amount of sensors our design currently implements (4)
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 5 }
  validates :time, presence: true
  validates_datetime :time
  validates :measurement, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  
  #Scopes
  scope :all, -> { order("measurement ASC") }
  scope :for_user, lambda { |user_id| where("user_id_id = ?", project_id) }
  #Value for recent is arbitrary, I set it to the past day
  scope :recent, -> { where("time > ? and time < ?", 1.day.ago, Time.now) }

private

  def self.find_last_position
    position_ids = [1,2,3,4]
    while position_ids.length > 0 do
       
    end
  end

  def validate_user_id
    errors.add(:user_id, "is not an employee in our system") unless User.exists?(self.user_id_id)
  end

end


