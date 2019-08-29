class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params['landmark'])
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end 

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    erb :'/landmarks/edit'
  end

  patch '/landmarks' do
    @landmark = Landmark.find(params['landmark']['id'])
    if !params['landmark']['name'].empty?
      @landmark.name = params['landmark']['name']
    end
    if !params['landmark']['year_completed'].empty?
      @landmark.year_completed = params['landmark']['year_completed']
    end
    @landmark.save
    binding.pry

    redirect to "/landmarks/#{@landmark.id}"
  end
end
