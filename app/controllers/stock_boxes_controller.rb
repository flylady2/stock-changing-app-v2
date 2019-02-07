class StockBoxesController < ApplicationController


  get '/stock_boxes' do

    if logged_in?
      @stock_boxes = current_user.stock_boxes
      erb :'stock_boxes/index'
    end
  end

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
    @stocks = @stock_box.stocks
    erb :'/stock_boxes/show'
  end

   get "/stock_boxes/:id/edit" do
     #binding.pry
     @stock_box = StockBox.find(params[:id])
     @stocks = @stock_box.stocks
      if logged_in?
        if @stock_box.user == current_user
          erb :'/stock_boxes/edit'
        end
      end
    end

    patch '/stock_boxes/:id' do
       @stock_box = StockBox.find(params[:id])
       if logged_in?
         if @stock_box.user == current_user
            @stock_box.update({name: params[:name], date_changed: params[:date_changed], date_due: params[:date_due]})
            redirect '/stock_boxes/:id'
          end
        end
    end

    delete '/stock_boxes/:id' do
      @stock_box = StockBox.find(params[:id])
      if logged_in?
        if @stock_box.user == current_user
          @stock_box.destroy
          redirect '/stock_boxes'
        else
          #need to put in flash message
        end
      else
        redirect '/login'
      end  
    end

end
