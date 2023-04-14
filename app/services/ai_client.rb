class AiClient
  MODEL = 'gpt-3.5-turbo' # can retrieve and choose model?

  def initialize(chat)
    @chat = chat
    @input = sanitize_input(chat)
    @client = OpenAI::Client.new
  end

  def call
    response = @client.chat( parameters: params)

    @chat.add_message(role: 'assistant', content: response.dig("choices", 0, "message", "content")) if response.ok?
    # handle error
  end

  private

  def sanitize_input(chat)
    chat.messages.map do |message|
      {
        'role': message.role,
        'content': message.content
      }
    end
  end

  def params
    {
      model: MODEL, # Required.
      messages: @input, # Required.
      temperature: 0.7,
    }
  end
end

