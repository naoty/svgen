require "spec_helper"

describe SVGen::SVG do
  describe "#generate" do
    it "returns simple SVG data" do
      sample = Pathname.new("spec/support/sample.svg")
      data = SVGen::SVG.new(width: 600, height: 300).generate
      expect(data).to eq sample.read
    end

    it "returns SVG data with rect" do
      sample = Pathname.new("spec/support/rect.svg")
      svg = SVGen::SVG.new(width: 600, height: 300) do |svg|
        svg.rect(width: 400, height: 300, fill: "red")
      end
      data = svg.generate
      expect(data).to eq sample.read
    end
  end
end
