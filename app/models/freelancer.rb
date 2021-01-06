class Freelancer < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :biography, presence: true

end
