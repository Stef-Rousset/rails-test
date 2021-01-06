class PagesController < ApplicationController

  def home
    @freelancer = Freelancer.new
  end
end
