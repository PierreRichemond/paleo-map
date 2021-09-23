class Dinosaur < ApplicationRecord

  has_one_attached :photo
  acts_as_taggable_on :tags # or whatever you would like to call your tag list.
  TAGS = [ "Tyrannosaurus", "Diplodocus", "Ankylosaurus", "Dilophosaurus", "Gorgosaurus" ]
end
