class StocksController < ApplicationController



  get '/stocks/new' do

    if logged_in?
      erb :'stocks/new'
    else
      redirect '/login'
    end
  end

  post '/stocks' do
    if !logged_in?
      redirect '/login'
    end
    if params[:name] != ""
      @stock = Stock.new(params)
      #binding.pry
      stock_box = StockBox.find_by(name: params["box_name"])
      @stock.stock_box_id = stock_box.id
      #binding.pry
      @stock.save
      #binding.pry
      redirect "stocks/#{@stock.id}"
    else
      redirect 'stocks/new'
      #add failure message
    end
  end

  get "/stocks/:id" do
    @stock = Stock.find(params[:id])
    erb :'/stocks/show'

  end

end
