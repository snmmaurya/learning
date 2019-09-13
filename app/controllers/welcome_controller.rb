class WelcomeController < ApplicationController
  before_action :filter
  after_action :filter
  around_action :filter

  def index
    
  end


  private
    def filter
      binding.pry
    end
end