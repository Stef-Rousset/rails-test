class PagesController < ApplicationController

  def home
    @freelancer = Freelancer.new
  end

  def confirmation
  end

end
