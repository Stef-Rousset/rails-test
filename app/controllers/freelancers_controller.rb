class FreelancersController < ApplicationController

  def create
    @freelancer = Freelancer.new(freelancer_params)
    if @freelancer.save!
      flash[:notice] = "Merci pour votre inscription, un email de confirmation vous a été envoyé"
      redirect_to root_path
    else
      flash.now[:alert] = "Votre inscription n'a pas été enregistrée"
      render :home
    end
  end

  private
  def freelancer_params
    params.require(:freelancer).permit(:name, :email, :phone_number, :biography)
  end
end
