class FreelancersController < ApplicationController

  def create
    @freelancer = Freelancer.new(freelancer_params)

    if @freelancer.save
      @freelancer.set_confirmation_token
      FreelancerMailer.registration_confirmation(@freelancer).deliver_now
      @freelancer.create_request
      flash[:notice] = "Merci ! Un email de confirmation vous a été envoyé pour valider votre inscription"
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
     @freelancer.request.status_true
     redirect_to confirmation_url
   else
     flash[:alert] = "Désolé, ce client n'existe pas"
     redirect_to root_url
   end
 end
 # reconfirmer ts les 3 mois
 def stay_active
    @freelancers = Freelancer.stay_registered
    if !@freelancers.empty?
      @freelancers.each do |freelancer|
        request = Request.confirmed.find(freelancer.request.id)
        index = Request.confirmed.find_index(request)
        rank = index + 1
        freelancer.set_confirmation_token
        freelancer.request.status_false
        FreelancerMailer.reconfirm_registration(freelancer, rank).deliver_now
      end
    end
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
