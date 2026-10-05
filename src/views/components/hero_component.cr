require "ecr"

struct HeroComponent
  getter title : String
  getter subtitle : String
  getter image_path : String

  def initialize(
    @title : String = "Seu transfer exclusivo em Porto Seguro",
    @subtitle : String = "Evite surpresas, faça sua reserva e o seu transfer privativo.",
    @image_path : String = "/images/image-hero.webp",
  )
  end

  ECR.def_to_s "src/views/components/hero.ecr"
end
