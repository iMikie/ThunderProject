class WelcomeController < ApplicationController
  def index
    @render_club_photo = true
  #now render index.html.erb
    respond_to do |format|
        format.html { render :index }
        format.json { return_msg= {message: "Welcome"}; render json: return_msg }
      end
  end
end
