class Request < ApplicationRecord
  belongs_to :freelancer


scope :unconfirmed, -> { order('created_at asc').joins(:freelancers).where(freelancers: {email_confirmed: false}) }
scope :confirmed, -> { where(status: true).order('created_at asc').joins(:freelancers).where(freelancers: {email_confirmed: true}) }
scope :accepted, -> { where(accepted: true)}
scope :expired, -> { where(status: false).order('created_at asc').joins(:freelancers).where(freelancers: {email_confirmed: true}) }

  def accept!
    self.accepted = true
    self.save
  end

  def status_true
    self.status = true
    self.save
  end

end
