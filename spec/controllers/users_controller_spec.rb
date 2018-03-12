require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "renders the new_user page" do
      get :new

      expect(response).to render_template(:new)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: {user: {username: 'penelope', password: 'abcd1234'}}
      user = User.find_by(username: 'penelope')
      expect(response).to redirect_to(user_url(user.id))
    end
  end

  # describe "GET #edit" do
  #   it "renders the user edit page" do
  #     get :edit
  #     expect(response).to render_template(:edit)
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "PATCH #update" do
  #   it "successfully updates the user" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
