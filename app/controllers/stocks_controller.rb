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
      #binding.pry
      @stock = Stock.new(params)
      binding.pry
      #@stock.stock_box.id = current_user.id  #need to fix this after I build form
      #@stock.save
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
