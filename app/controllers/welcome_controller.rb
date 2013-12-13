class WelcomeController < ApplicationController
  def index
  end

  def register
    Registration.create(email: params[:email])
    redirect_to :root, notice: "Thanks for your interest! We'll email you when the service goes live."
  end
end
