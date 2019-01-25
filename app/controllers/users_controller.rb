class UsersController < ApplicationController

  get '/login' do #render the login form

    erb :'/users/login'
  end

  post '/login' do
    #receives login form
    #finds the user
    #binding.pry
    @user = User.find_by(email: params[:email])
    #binding.pry
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id   #logins user in (creates a session)
      redirect "users/#{@user.id}"
    else
      #invalid credentials message
      #redirect to login page
    end

  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do

    #binding.pry
    #create new user and persist them to the db
    user = User.new(params)
    if user.name != "" && user.email != "" && user.password != ""
      user.save
      redirect "/users/#{user.id}"
    end
    #binding.pry
    #if params
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'users/show'
  end


end
