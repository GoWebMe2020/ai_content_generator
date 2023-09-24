class Chat < ApplicationRecord
  belongs_to :user

  attr_accessor :generate_response

  def generate_response(message)
    messages = [
      { "role" => "system", "content" => message }
    ]

    response_raw = client.chat(
      parameters:{
        model: "gpt-3.5-turbo",
        messages: messages,
        temperature: 0.7,
        max_tokens: 500,
        top_p: 1,
        frequency_penalty: 0.0,
        presence_penalty: 0.6,
      }
    )

    return response_raw["choices"][0]["message"]["content"]
  end

  def client
    OpenAI::Client.new
  end
end
