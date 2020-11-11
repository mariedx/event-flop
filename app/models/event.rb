class Event < ApplicationRecord

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :event_admin, class_name: "User"

  validates :start_date, presence: true, inclusion: { in: (Date.today..Date.today+5.years) }
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 1 }, if: :multiple_of_five?
  validates :title, presence: true, length: { in: 5..40 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, :inclusion => 1..1000
  validates :location, presence: true

  has_one_attached :picture

  def multiple_of_five?
    errors.add(:duration, "La durée doit être un multiple de 5") unless duration % 5 == 0
  end

end