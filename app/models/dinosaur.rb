class Dinosaur < ApplicationRecord
  has_one_attached :photo
  acts_as_taggable_on :tags

  dino_list = ["Dromaeosaurus", "Carnotaurus", "Oviraptor", "Sinraptor", "Velociraptor", "Megalosaurus", "Albertosaurus", "Ichthyornis", "Allosaurus", "Giganotosaurus", "Brachiosaurus", "Tyrannosaurus", "Camarasaurus", "Triceratops", "Psittacosaurus", "Styracosaurus", "Magnapaulia", "Nodosaurus", "Camptosaurus", "Pachycephalosaurus", "Iguanodon", "Stegosaurus", "Diplodocus", "Ankylosaurus", "Dilophosaurus", "Parasaur", "Spinosaurus" ]
  TAGS = dino_list.sort
end
