require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to have_many :bucketlists }
  it { is_expected.to have_many :tokens }

  describe "#full_name" do
    let(:user) { create :user }

    it "returns the full name of a user" do
      expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
    end
  end
end
