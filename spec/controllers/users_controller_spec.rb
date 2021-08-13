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
      
      # {:id => 100}
      get :show, params: {id: 100} # テストを実行するときに確実にユーザID100のユーザが存在することを保証する必要がある
      expect(response).to have_http_status(:success)
    end

    it "returns 404 NotFound" do
      # ここはやってみてください
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
