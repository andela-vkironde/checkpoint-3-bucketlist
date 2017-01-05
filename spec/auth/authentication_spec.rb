
require "rails_helper"

RSpec.describe Authentication do
  let(:user) { create(:user) }
  let(:new_user_attrs) { attributes_for(:user) }
  let(:invalid_user_attrs) { attributes_for(:user, email: nil) }

  describe "#call" do
    context "when correct user details are supplied" do
      subject { described_class.new(user.email, user.password) }

      it "creates a new token" do
        expect(subject.call).to_not eq nil
      end
    end

    context "when incorrect user details are supplied" do
      subject { described_class.new(user.email, "") }

      it "raises an active record error" do
        expect { subject.call }.to raise_error ExceptionHandler::NotAuthorized
      end
    end
  end
end
