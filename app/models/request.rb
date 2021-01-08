class Request < ApplicationRecord
  belongs_to :freelancer


scope :unconfirmed, -> { order('created_at asc').joins(:freelancer).where(freelancers: {email_confirmed: false}) }
scope :confirmed, -> { where(status: true).order('created_at asc').joins(:freelancer).where(freelancers: {email_confirmed: true}) }
scope :accepted, -> { where(accepted: true) }
scope :expired, -> { where(status: false).where.not(accepted: true).order('created_at asc').joins(:freelancer).where(freelancers: {email_confirmed: true}) }


  # def self.accepted
  #   self.where(accepted: true)
  # end

  def accept!
    self.accepted = true
    self.status = false # pr sortir de la liste d'attente
    self.save
  end

  def status_true
    self.status = true
    self.save
  end

  def status_false
    self.status = false
    self.save
  end

end
