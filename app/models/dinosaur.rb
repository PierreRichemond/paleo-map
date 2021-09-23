class Dinosaur < ApplicationRecord
  TAGS = ["Tyrannosaurus", "Diplodocus", "Ankylosaurus", "Dilophosaurus", "Gorgosaurus" ]

  has_one_attached :photo
  acts_as_taggable_on :tags # or whatever you would like to call your tag list.

end
