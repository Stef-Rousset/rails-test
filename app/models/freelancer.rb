class Freelancer < ApplicationRecord

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :biography, presence: true, length: { in: 6..1000 }

end

