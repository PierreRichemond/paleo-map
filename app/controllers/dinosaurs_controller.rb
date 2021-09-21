class DinosaursController < ApplicationController
  def index
    @dinos = Dinosaur.all
  end
end
