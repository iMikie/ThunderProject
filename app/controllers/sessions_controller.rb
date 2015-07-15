class SessionsController < ApplicationController
  # skip_before_filter :verify_authenticity_token, if: :json_request?

  # GET /login
  def login
    puts "*" * 50
    puts params.inspect

  end

  def create
    username = params[:username]
    puts "*" * 50
    puts params.inspect
    puts params[:username]
    user = User.where(username: (params[:username])).first

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      respond_to do |format|
        format.html { redirect_to '/welcome' }
        format.json { render json: ':message : "go card welcome"' }
      end
    else
      # If user's login doesn't work, send them back to the login form.
      respond_to do |format|
        format.html { redirect_to '/login' }
        format.json { render json: ':message : "login error"' }
      end # Save the user id inside the browser cookie. This is how we keep the user
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to '/login' }
      format.json {render json:  'So long for now' }
    end

  end
end
# get '/session_viewer' do
#   session.inspect
# end
#
# get '/users' do
#
# end
#
# get '/users/new' do
#   @render_club_photo = true
#   session[:user_id] = nil
#   erb :signup
# end
#
# get '/users/:id' do #get specific user
# end
#
# get '/users/:id/edit' do #send form for editing user
# end
#
# put '/users/:id' do #update a user's record
#
# end
#
# delete '/users/:id' do #delete a user's record
#
# end
#
#
#
#
# post '/users' do
#   @render_club_photo = true
#   if params[:password] == params[:verify_password]
#     new_user = User.new(
#         username: params[:username],
#         email: params[:email],
#         phone_number: params[:phone_number],
#         password: params[:password])
#     new_user.password = params[:password]
#     if new_user.save
#       session[:user_id] = new_user.id
#       @songs = Song.all
#       erb :song_search
#
#     else
#       @signup_errors = new_user.errors.messages
#       erb :signup
#     end
#   else
#     @error = "Your passwords don't match."
#     erb :signup
#   end
# end
#
#
# get '/users/index' do
#   erb :show_sots
#
# end

