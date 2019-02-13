class StocksController < ApplicationController

  get '/stocks' do
    if logged_in?
      @stocks = current_user.stocks
      erb :'stocks/index'
    end
  end

  get '/stocks/new' do
    if logged_in?
      erb :'stocks/new'
    else
      flash[:message] = "You must be logged in to create a new stock."
      redirect '/login'
    end
  end

  post '/stocks' do
    if !logged_in?
      redirect '/login'
    end
    if params[:name] != "" && params[:"box_name"] != ""
      @stock = Stock.new(params)
      stock_box = StockBox.find_by(name: params["box_name"])
      if stock_box
        @stock.stock_box_id = stock_box.id
        @stock.save
        redirect "stocks/#{@stock.id}"
      end
    else
      flash[:message] = "Something went wrong. Please try again."
      redirect 'stocks/new'
    end
  end

  get '/stocks/:id' do
    if logged_in?
      @stock = Stock.find(params[:id])
      erb :'/stocks/show'
    else
      flash[:message] = "You must be logged in to see a stock."
      redirect '/login'
    end
  end

  get '/stocks/:id/edit' do
    @stock = Stock.find(params[:id])
    @stock_box = StockBox.find(@stock.stock_box_id)
    if logged_in?
      if @stock_box.user == current_user
        erb :'/stocks/edit'
      else
        flash[:message] = "You are not authorized to edit this stock."
        redirect "/stocks/#{@stock.id}"
      end
    end
   end

   patch '/stocks/:id' do
      @stock = Stock.find(params[:id])
      @stock_box = StockBox.find(@stock.stock_box_id)
      if logged_in?
        if @stock_box.user == current_user
           @stock.update({name: params[:name], box_name: params[:box_name]})
           redirect "/stocks/#{@stock.id}"
        else
         flash[:message] = "You are not authorized to update this stock."
         redirect "/stocks/#{@stock.id}"
        end
      end
   end

   delete '/stocks/:id' do
     @stock = Stock.find(params[:id])
     @stock_box = StockBox.find(@stock.stock_box_id)
     if logged_in?
       if @stock_box.user == current_user
         @stock.destroy
         redirect '/stocks'
       else
         flash[:message] = "You are not authorized to delete this stock."
         redirect "/stocks/#{@stock.id}"
       end
     else
       redirect '/login'
     end
   end


end
