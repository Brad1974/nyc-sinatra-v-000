class FiguresController < ApplicationController


  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures' do
   @figure = Figure.all
   erb :'figures/index'
  end  

  get '/figures/:id' do
    @figure=Figure.find(params[:id])
    erb :'figures/show'
  end
  
  get '/figures/:id/edit' do
    @figure=Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures' do
    @figure=Figure.create(params[:figure])
    @figure.save
    redirect to '/figures'
  end

  patch '/figures/:id'do
    params.to_s
    @figure=Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end

