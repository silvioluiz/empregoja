class Company < ApplicationRecord
  has_many :jobs
  validates :name, :mail, :location, :phone, presence: true

  def premium?
    jobs.count >= 5
  end
end
