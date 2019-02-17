class UsersController < ApplicationController

  get '/login' do #render the login form
    erb :'/users/login'
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id   #logins user in (creates a session)
      redirect "users/#{@user.id}"
    else
      flash[:message] = "Email or password is incorrect. Please try again."
      redirect '/login'
    end
  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/users' do
    user = User.new(params)
    #binding.pry
    if user.name != "" && user.email != "" && user.password != nil
      user.save
      session[:user_id] = user.id #logging new user in
      redirect "/users/#{user.id}"
    else
      flash[:message] = "You must have a valid name, email and password. Please try again."
      redirect '/signup' #need to add a failure message
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    if @user == current_user
      erb :'users/show'
    else
      flash[:message] = "You are not authorized to view another user's page."
      redirect '/'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end



end
