class FreelancersController < ApplicationController

  def create
    @freelancer = Freelancer.new(freelancer_params)

    if @freelancer.save
      @freelancer.set_confirmation_token
      @freelancer.save
      FreelancerMailer.registration_confirmation(@freelancer).deliver_now
      @freelancer.create_request
      flash[:notice] = "Merci pour votre inscription, un email de confirmation vous a été envoyé"
      redirect_to root_path
    else
      flash.now[:alert] = "Votre inscription n'a pas été enregistrée"
      render 'pages/home'
    end
  end

  def confirm_email
    @freelancer = Freelancer.find_by_confirm_token(params[:token])
   if @freelancer
     @freelancer.validate_email
     @freelancer.save
     @freelancer.request.status_true
     redirect_to confirmation_url
   else
     flash[:alert] = "Désolé, ce client n'existe pas"
     redirect_to root_url
   end
 end
 # reconfirmer ts les 3 mois
 def stay_active
    @freelancer.request.status_false
    @freelancer.set_confirmation_token
    @freelancer.save
    FreelancerMailer.reconfirm_registration(@freelancer).deliver_now
 end

 def reconfirm_status
  @freelancer = Freelancer.find_by_confirm_token(params[:token])
  if @freelancer
    @freelancer.request.status_true
    redirect_to confirmation_url
  end
 end


  private

  def freelancer_params
    params.require(:freelancer).permit(:name, :email, :phone_number, :biography)
  end

end
