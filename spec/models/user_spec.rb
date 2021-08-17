# require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it "nameとemailとパスワードがある場合は有効" do
    @user = User.new(
      name: "tarou",
      email: "testman@example.com",
      password: "password",
    )
    # @user.save
    expect(@user).to be_valid
  end

  it "nameがない場合は無効" do
    @user = User.new(
      name: nil,
      email: "testman@example.com",
      password: "password",
    )

    expect(@user).not_to be_valid
  end

  it "emailがない場合は無効" do
    @user = User.new(
      name: "tarou",
      email: nil,
      password: "password",
    )

    expect(@user).not_to be_valid
  end

  it "passwordがない場合は無効" do
    @user = User.new(
      name: "tarou",
      email: "testman@example.com",
      password: nil,
    )

    expect(@user).not_to be_valid
  end
end
