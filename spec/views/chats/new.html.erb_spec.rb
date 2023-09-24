require 'rails_helper'

RSpec.describe "chats/new", type: :view do
  before(:each) do
    assign(:chat, Chat.new(
      user: nil,
      chat_content: "MyText"
    ))
  end

  it "renders new chat form" do
    render

    assert_select "form[action=?][method=?]", chats_path, "post" do

      assert_select "input[name=?]", "chat[user_id]"

      assert_select "textarea[name=?]", "chat[chat_content]"
    end
  end
end
