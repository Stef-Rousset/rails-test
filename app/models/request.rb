class Request < ApplicationRecord
  belongs_to :freelancer

scope :ordered, -> { order('created_at asc') }
scope :unconfirmed, -> { ordered.joins(:freelancer).where(freelancers: {email_confirmed: false}) }
scope :confirmed, -> { ordered.where(status: true).joins(:freelancer).where(freelancers: {email_confirmed: true}) }
scope :accepted, -> { where(accepted: true) }
scope :expired, -> { ordered.where(status: false).where.not(accepted: true).joins(:freelancer).where(freelancers: {email_confirmed: true}) }


  # def self.accepted
  #   self.where(accepted: true)
  # end

  def accept!
    self.accepted = true
    self.status = false # pr sortir de la liste d'attente
    self.save!
  end

  def status_true
    self.status = true
    self.save!
  end

  def status_false
    self.status = false
    self.save!
  end

end
