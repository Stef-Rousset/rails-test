class FreelancersController < ApplicationController

  def create
    @freelancer = Freelancer.new(freelancer_params)
    if @freelancer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def freelancer_params
    params.require(:freelancer).permit(:name, :email, :phone_number, :biography)
  end
end
