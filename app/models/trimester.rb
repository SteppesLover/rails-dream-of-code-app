class Trimester < ApplicationRecord
  has_many :courses

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :application_deadline, presence: true

    def trimester_name
    "#{term} #{year}"
  end
end
