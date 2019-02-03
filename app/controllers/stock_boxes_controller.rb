class StockBoxesController < ApplicationController



  get '/stock_boxes/new' do

    if logged_in?
      erb :'stock_boxes/new'
    else
      redirect '/login'
    end
  end

  post '/stock_boxes' do
    if !logged_in?
      redirect '/login'
    end
    if params[:name] != ""
      #binding.pry
      @stock_box = StockBox.new(params)
      @stock_box.user_id = current_user.id
      @stock_box.save
      redirect "stock_boxes/#{@stock_box.id}"
    else
      redirect 'stock_boxes/new'
      #add failure message
    end
  end

  get "/stock_boxes/:id" do
    @stock_box = StockBox.find(params[:id])
    @stocks = Stock.all
    erb :'/stock_boxes/show'

  end

end
