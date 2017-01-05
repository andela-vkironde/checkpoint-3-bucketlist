require "rails_helper"

RSpec.describe Pagination do
  describe ".get_limit" do
    it "returns 20 when limit <= 0" do
      pager = Pagination.new(0, 20).paginate
      expect(pager[:limit]).to eq 20
    end

    it "returns 100 when limit >= 100" do
      pager = Pagination.new(101, 20).paginate
      expect(pager[:limit]).to eq 100
    end
  end

  describe ".get_offset" do
    it "returns the specified page" do
      pager = Pagination.new(2, 2).paginate
      expect(pager[:offset]).to eq 2
    end

    it "returns 0 when limit <= 0" do
      pager = Pagination.new(100, -1).paginate
      expect(pager[:offset]).to eq 0
    end
  end
end
