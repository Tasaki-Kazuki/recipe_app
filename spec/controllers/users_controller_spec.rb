require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      @user = User.new(
        id: "1",
        name: "tarou",
        email: "testman@example.com",
        password: "password",
      )
      @user.save

      # {:id => 100}
      get :show, params: { id: 1 } # テストを実行するときに確実にユーザID100のユーザが存在することを保証する必要がある
      expect(response).to have_http_status(:success)
    end

    it "returns 404 NotFound" do
      expect {
        get :show, params: { id: 100 }
      }.to raise_error(ActiveRecord::RecordNotFound) # https://qiita.com/mah666hhh/items/70eeb528690843c897e5
    end

    # 普通のユーザが来るフローではないはずなので本来はテストをしなくていいが、例外のテストのサンプルとして書いてみた
    it "raise ParameterMissing exception" do
      # https://qiita.com/Cesaroshun/items/0cc1a47d1c9bf74dec73
      expect {
        get :show # これだけだとユーザIDが渡らないのでエラー
      }.to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end
end
