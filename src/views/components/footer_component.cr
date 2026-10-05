require "ecr"

struct FooterComponent
  getter phone : String
  getter developer_name : String

  def initialize(
    @phone : String = "(73) 99834-4769",
    @developer_name : String = "Vinicius Freire"
  )
  end

  ECR.def_to_s "src/views/components/footer.ecr"
end
