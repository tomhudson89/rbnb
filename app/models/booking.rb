class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_many :reviews

  def total_days
    (end_date - start_date).to_i
  end

  def stay_cost
    days = total_days
    (days * self.flat.price_per_night)
  end
end
