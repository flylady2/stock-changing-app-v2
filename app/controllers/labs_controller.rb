class LabsController < ApplicationController

  get '/labs' do
    #binding.pry
    if logged_in?

      erb :'/labs/index'
    else
      redirect '/login'
    end
  end
end
