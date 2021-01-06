class FreelancersController < ApplicationController

  def create
    @freelancer = Freelancer.new(freelancer_params)
    if @freelancer.save
      redirect_to root_path, notice: "Merci pour votre inscription, un email de confirmation vous a été envoyé"
    else
      flash.now[:alert] = "Votre inscription n'a pas été enregistrée"
      render root_path
    end
  end

  private
  def freelancer_params
    params.require(:freelancer).permit(:name, :email, :phone_number, :biography)
  end
end
