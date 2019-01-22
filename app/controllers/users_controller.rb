class UsersController < ApplicationController

  get '/login' do #render the login form

    erb :'/users/login'
  end

  post '/login' do
    #receives login form
    #finds the user
    #binding.pry
    @user = User.find_by(email: params[:email])
    binding.pry
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id   #logins user in (creates a session)
      redirect "users/#{@user.id}"
    else
      #invalid credentials message
      #redirect to login page
    end

  end

  get '/signup' do

  end

  get 'users/:id' do
    "user's show page"
  end


end
