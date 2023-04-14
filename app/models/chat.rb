class Chat < ApplicationRecord
  has_many :messages

  def add_message(role: 'user', content:)
    messages.create!({role: role, content: content})
  end

  def name
    "Chat started at #{created_at}"
  end
end
