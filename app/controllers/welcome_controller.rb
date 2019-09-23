class WelcomeController < ApplicationController
  before_action :filter
  after_action :filter
  around_action :filter

  def index
  	# binding.pry
    render json: {status: "Okay"}
  end

  


  private
    def filter
    end
end