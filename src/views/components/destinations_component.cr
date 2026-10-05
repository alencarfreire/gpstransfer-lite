require "ecr"

struct DestinationComponent
  getter destinations : Array(Destination)

  def initialize(@destinations : Array(Destination) = Destination.all)
  end

  ECR.def_to_s "src/views/components/destination.ecr"
end
