class DinosaursController < ApplicationController
  before_action :set_dinosaurs, only: [:show, :edit, :update, :destroy]
  before_action :tagged, only: [:show]

  def index
    @dinos = Dinosaur.all
    map_geocode
  end

  def show
    @dino = Dinosaur.find(params[:dinosaur_id])
    tagged
    map_geocode
  end

private

  def set_dinosaurs
    @dinosaur = Dinosaur.find(params[:id])
  end

  def dinosaur_params
    params.require(:dinosaur).permit(:name, tag_list: [])
  end

  def map_geocode
    @markers = @dinos.map do |dino|
      {
        lat: dino.latitude,
        lng: dino.longitude,
        info_window: render_to_string(partial: "info_window", locals: { dino: dino })
      }
    end
  end

  def tagged
    if params[:tag].present?
      @dinos = Dinosaur.tagged_with(params[:tag])
    else
      @dinos = Dinosaur.all
    end
  end
end
