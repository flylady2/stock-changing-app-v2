class UsersController < ApplicationController

  get '/login' do #render the login form

    erb :'/users/login'
  end

  post '/login' do
    #receives login form
    #finds the user
    #logins user in (creates a session)
  end

  get '/signup' do

  end

end
