class WelcomeController < ApplicationController
  def index
    @index = true
  end

  def register
    Registration.create(email: params[:email])
    redirect_to :root, notice: "Thanks for your interest! We'll email you when the service goes live."
  end

  def show
    @tracks = current_user.soundcloud_client.get("/me/tracks")
    raise
    @me     = current_user.soundcloud_client.get("/me")
  end

  def update
    current_user.soundcloud_client.put("/me", :user => {:description => params[:description]})
    redirect_to :action => :show
  end
end
