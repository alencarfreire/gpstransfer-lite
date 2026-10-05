require "ecr"

struct HeaderComponent
  getter brand_name : String
  getter contact : Contact

  def initialize(
    @brand_name : String = "GPS Transfer",
    @contact : Contact = Contact.default
  )
  end

  ECR.def_to_s "src/views/components/header.ecr"
end
