require 'rails_helper'

RSpec.describe User, type: :model do
  context "ensuring that users are valid" do
    it "is valid with valid attributes" do
      user = User.create(email: "test@example.com", password: "password123")
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user = User.create(password: "password123")
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user = User.create(password: "test@example.com")
      expect(user).to_not be_valid
    end
  end

  context "will validatet the uniqueness of emails" do
    it "will not allow two of the same email" do
      user1 = User.create(email: "test@example.com", password: "password123")
      user2 = User.create(email: "test@example.com", password: "password123")
      expect(user2).to_not be_valid
    end
  end
end
