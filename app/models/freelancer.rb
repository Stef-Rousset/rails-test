require 'date'

class Freelancer < ApplicationRecord
  has_one :request, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :phone_number, presence: true
  validates :biography, presence: true, length: { in: 6..1000 }

  def set_confirmation_token
     if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
        self.save!
    end
  end

  def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
    self.save!
  end

  def self.stay_registered
    # if (Date.today - self.created_at.to_date) % 90 == 0
    if Date.today - 1.day == self.created_at.to_date
      # self.stay_active
      # pas possible d'appeler un method de controller dans le model, à la place retourner
      # de la data qui sera récupérée par le controller
      return self
    end
  end
end

