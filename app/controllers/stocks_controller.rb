class StocksController < ApplicationController

  get '/stocks' do
    #binding.pry
    if logged_in?
      @stocks = current_user.stocks
      erb :'stocks/index'
    end
  end

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
    if params[:name] != "" && params[:"box_name"] != ""
      @stock = Stock.new(params)
      #binding.pry
      stock_box = StockBox.find_by(name: params["box_name"])
      if stock_box
        @stock.stock_box_id = stock_box.id
      #binding.pry
        @stock.save
      #binding.pry
        redirect "stocks/#{@stock.id}"
      end
    else
      redirect 'stocks/new'
      #add failure message
    end
  end

  get '/stocks/:id' do
    @stock = Stock.find(params[:id])
    #binding.pry
    erb :'/stocks/show'

  end

  get '/stocks/:id/edit' do
    #binding.pry
    @stock = Stock.find(params[:id])
    binding.pry
    if logged_in?
      if @stock.user == current_user
        erb :'/stocks/edit'
      end
    end
   end

   patch '/stocks/:id' do
      @stock = Stock.find(params[:id])
      if logged_in?
        if @stock.user == current_user
           @stock.update({name: params[:name], date_changed: params[:date_changed], date_due: params[:date_due]})
           redirect '/stocks/:id'
         end
       end
   end

   delete '/stocks/:id' do
     @stock = Stock.find(params[:id])
     if logged_in?
       if @stock.user == current_user
         @stock.destroy
         redirect '/stocks'
       else
         #need to put in flash message
       end
     else
       redirect '/login'
     end
   end


end
