class StockBoxesController < ApplicationController



  get '/stock_boxes/new' do

    if logged_in?
      erb :'stock_boxes/new'
    else
      redirect '/login'
    end
  end

end
