require "uri"

struct Contact
  getter number : String
  getter message : String

  def initialize(@number : String, @message : String)
  end

  def whatsapp_url : String
    encoded_message = URI.encode_www_form(@message)
    "https://wa.me/#{@number}?text=#{encoded_message}"
  end

  def self.default : Contact
    new(
      number: "5573998344769",
      message: "Olá, vim pelo site, gostaria de saber mais sobre o transfer..."
    )
  end
end
