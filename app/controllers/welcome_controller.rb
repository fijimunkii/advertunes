class WelcomeController < ApplicationController
  def index
  end

  def register
    Registration.create(email: params[:email])
    redirect_to :root
  end
end
