class LabsController < ApplicationController

  get '/labs' do
    #binding.pry
    if logged_in?

      erb :'/labs/index'
    else
      redirect '/login'
    end
  end

  get '/labs/stock_list' do
    if logged_in?
      @stocks = Stock.all
      erb :'/labs/stock_list'
    else
      redirect '/login'
    end
  end
end
