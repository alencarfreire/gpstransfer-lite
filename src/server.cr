require "kemal"

# Carregamento automático de todos os modelos e componentes
require "./models/**"
require "./views/components/**"

get "/" do
  render "src/views/index.ecr", "src/views/layouts/layout.ecr"
end

Kemal.run
