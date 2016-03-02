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

    # if !params[:landmark][:name].empty?
    #   @figure.landmarks << Landmark.create(params[:landmark])
    # end

    # if !params[:title][:name].empty?
    #   @figure.titles << Title.create(params[:title])
    # end

    # @new_landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
    # @figure.landmarks << @new_landmark
    # @new_title = Title.find_or_create_by(name: params[:title][:name])
    # @figure.titles << @new_title
    # @figure.save

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end

