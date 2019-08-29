class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do
    @landmarks = Landmark.all 
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    if !params['landmark']['name'].empty? && !Landmark.find_by_name(params['landmark']['name'])
      @landmark = Landmark.create(params['landmark'])
      @figure.landmarks << @landmark
    elsif Landmark.find_by_name(params['landmark']['name'])
      @landmark = Landmark.find_by_name(params['landmark']['name'])
      @figure.landmarks << @landmark
    end
    if !params['title']['name'].empty? && !Title.find_by_name(params['title']['name'])
      @title = Title.create(params['title'])
      @figure.titles << @title
    elsif Title.find_by_name(params['title']['name'])
      @title = Title.find_by_name(params['title']['name'])
      @figure.titles << @title
    end
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @landmarks = Landmark.all
    @titles = Title.all
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures' do
    # binding.pry
    @figure = Figure.find(params['figure']['id'])
    if !params['figure']['name'].empty?
      @figure.name = params['figure']['name']
    end
    # binding.pry
    if !params['landmark']['name'].empty?
      @landmark = Landmark.find_or_create_by(name: params['landmark']['name'])
      @figure.landmarks << @landmark
    end
    # binding.pry
    if !params['title']['name'].empty?
      @title = Title.find_or_create_by(name: params['title']['name'])
      @figure.titles << @title
    end
    @figure.save
    # binding.pry
    redirect to "/figures/#{@figure.id}"
  end

end
