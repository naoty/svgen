require "spec_helper"

describe SVGen::SVG do
  describe "#generate" do
    after do
      data = @svg.generate
      expect(data).to eq @sample.read
    end

    it "returns simple SVG data" do
      @sample = Pathname.new("spec/support/sample.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300)
    end

    it "returns SVG data with rect" do
      @sample = Pathname.new("spec/support/rect.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300) do |svg|
        svg.rect(width: 400, height: 300, fill: "red")
      end
    end

    it "returns SVG data with circle" do
      @sample = Pathname.new("spec/support/circle.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300) do |svg|
        svg.circle(cx: 100, cy: 100, r: 50, fill: "red")
      end
    end

    it "returns SVG data with text" do
      @sample = Pathname.new("spec/support/text.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300) do |svg|
        svg.text("Sample Text", x: 20, y: 20)
      end
    end

    it "returns SVG data with line" do
      @sample = Pathname.new("spec/support/line.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300) do |svg|
        svg.line(x1: 10, y1: 10, x2: 50, y2: 50, stroke: "black", :"stroke-width" => "5")
      end
    end
  end
end
