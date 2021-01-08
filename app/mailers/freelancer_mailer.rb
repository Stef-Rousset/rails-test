class FreelancerMailer < ApplicationMailer

  def registration_confirmation(freelancer)
    @freelancer = freelancer # Instance variable => available in view
    mail(to: @freelancer.email, subject: 'Confirmer votre inscription') # render a view in `app/views/freelancer_mailer`!
 end

 def reconfirm_registration(freelancer)
  @freelancer = freelancer # Instance variable => available in view
  mail(to: @freelancer.email, subject: "Reconfirmez votre inscription sur la liste d'attente") # render a view in `app/views/freelancer_mailer`!
 end

end
