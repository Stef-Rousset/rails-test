class Freelancer < ApplicationRecord
  has_one :request, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :phone_number, presence: true
  validates :biography, presence: true, length: { in: 6..1000 }

end

