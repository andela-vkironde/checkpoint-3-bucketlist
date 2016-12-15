RSpec.shared_context "unauthenticated request" do
  context "when user does not have a valid token" do
    let(:header) { headers }
    it_behaves_like "an http response", 401, "Missing token"
  end
end
