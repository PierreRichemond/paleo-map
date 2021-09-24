class Dinosaur < ApplicationRecord
  TAGS = ["Dromaeosaurus", "Oviraptoridae", "Sinraptor", "Larus", "Velociraptor", "Struthio", "Megalosaurus", "Albertosaurus", "Ichthyornis", "Allosaurus", "Gigantosaurus", "Ornithopsis", "Brontosaurus", "Titanosaurus", "Tyrannosaurus", "Morosaurus", "Draconyx", "Triceratops", "Psittacosaurus", "Styracosaurus", "Hadrosaurinae", "Nodosaurus", "Camptosaurus", "Tithonian", "Pachycephalosaurus", "Iguanodon", "Stegosaurus", "Diplodocus", "Ankylosaurus", "Dilophosaurus", "Gorgosaurus" ]

  has_one_attached :photo
  acts_as_taggable_on :tags # or whatever you would like to call your tag list.
end
