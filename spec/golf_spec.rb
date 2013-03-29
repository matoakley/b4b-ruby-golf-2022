require_relative "../lib/golf"

describe Golf do
  describe ".hole_1" do
    it "blah" do
    end
  end

  describe ".hole_2" do
    it "foo" do
    end
  end

  describe ".hole_3" do
    it "foo" do
    end

    it "blah" do
      fail
    end
  end

  describe ".hole_4" do
    it "foo" do
    end
  end
end
