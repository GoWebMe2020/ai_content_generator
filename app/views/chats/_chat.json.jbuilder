json.extract! chat, :id, :user_id, :chat_content, :created_at, :updated_at
json.url chat_url(chat, format: :json)
