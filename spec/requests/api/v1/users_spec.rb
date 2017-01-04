require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "POST#create" do
    let(:attrs) { attributes_for(:user) }
    let!(:request) { post :create, params: attrs }
    let!(:existing_user) { create(:user) }
    subject { response }

    context "when a new user signs up" do
      it_behaves_like "an http response", 201, "Account created successfully"

      it "returns an authentication token" do
        expect(json["token"]).not_to be_nil
      end
    end

    context "when an existing user signs up" do
      let(:attrs) do
        {
          firstname: Faker::Name.first_name,
          lastname: Faker::Name.last_name,
          email: existing_user.email,
          password: existing_user.password,
          password_confirmation: existing_user.password
        }
      end
      it_behaves_like "an http response", 422, "Account could not be created"
    end

    context "when a new user signs up with the invalid parameters" do
      let(:attrs) { {} }

      it_behaves_like "an http response", 422, "Account could not be created"
    end
  end
end
