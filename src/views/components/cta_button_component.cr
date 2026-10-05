require "ecr"

struct CtaButtonComponent
  getter contact : Contact
  getter label : String
  getter note : String

  def initialize(
    @contact : Contact = Contact.default,
    @label : String = "Fazer Orçamento",
    @note : String = "Você será encaminhado para o WhatsApp"
  )
  end

  ECR.def_to_s "src/views/components/cta_button.ecr"
end
