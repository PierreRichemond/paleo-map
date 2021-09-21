class DinosaursController < ApplicationController
  def index
    @dinos = Dinosaur.all

    @markers = @dinos.map do |dino|
      {
        lat: dino.latitude,
        lng: dino.longitude
      }
    end
  end
end
