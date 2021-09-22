class DinosaursController < ApplicationController
  def index
    @dinos = Dinosaur.all

    @markers = @dinos.map do |dino|
      {
        lat: dino.latitude,
        lng: dino.longitude,
        info_window: render_to_string(partial: "info_window", locals: { dino: dino })
      }
    end
  end
end
