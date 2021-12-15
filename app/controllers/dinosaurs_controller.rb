class DinosaursController < ApplicationController
  before_action :set_dinosaurs, only: [:show, :edit, :update, :destroy]

  def index
    @dinos = if params[:tag].present?
               Dinosaur.tagged_with(params[:tag])
             else
               Dinosaur.all.sample(800)
             end
    map_geocode
    @dino = Dinosaur.tagged_with(params[:tag]).find { |d| d.photo.present? }
    @count = Dinosaur.tagged_with(params[:tag]).all.count
    @tag = params[:tag]

    respond_to do |format|
      format.html
      format.json do
        render json: { image: Rails.application.routes.url_helpers.rails_blob_url(@dino.photo, only_path: true),
                      json_markers: @markers,
                      tag: @tag }
      end
    end
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
end
