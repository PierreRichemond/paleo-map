class DinosaursController < ApplicationController
  before_action :set_children, only: [:show, :edit, :update, :destroy]
  before_action :activity_tagged, only: [:show]

  def index
    @dinos = Dinosaur.all
  end

  def show
    @dino = Dinosaur.find(params[:dinosaur_id])
    map_geocode
  end

private

  def set_dinosaur
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:name, tag_list: [])
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

  def dino_tagged
    if params[:tag].present?
      @dinos = Dinosaur.tagged_with(params[:tag])
    # else
    #   @restaurants = Dinosaur.all
    end
  end
end
