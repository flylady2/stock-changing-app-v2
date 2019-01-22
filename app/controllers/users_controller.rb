class UsersController < ApplicationController

  get '/login' do #render the login form

    erb :'/users/login'
  end

  post '/login' do
    #receives login form
    #finds the user

    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.idea   #logins user in (creates a session)
      redirect "users/#{@user.id}"

  end

  get '/signup' do

  end

end
