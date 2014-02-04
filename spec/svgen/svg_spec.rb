require "spec_helper"

describe SVGen::SVG do
  describe "#generate" do
    let(:fixtures_path) { Pathname.new("spec/fixtures") }

    after do
      data = @svg.generate
      expect(data).to eq @sample.read
    end

    it "returns simple SVG data" do
      @sample = fixtures_path.join("sample.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300)
    end

    it "returns SVG data with rect" do
      @sample = fixtures_path.join("rect.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300) do |svg|
        svg.rect(width: 400, height: 300, fill: "red")
      end
    end

    it "returns SVG data with circle" do
      @sample = fixtures_path.join("circle.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300) do |svg|
        svg.circle(cx: 100, cy: 100, r: 50, fill: "red")
      end
    end

    it "returns SVG data with text" do
      @sample = fixtures_path.join("text.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300) do |svg|
        svg.text("Sample Text", x: 20, y: 20)
      end
    end

    it "returns SVG data with line" do
      @sample = fixtures_path.join("line.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300) do |svg|
        svg.line(x1: 10, y1: 10, x2: 50, y2: 50, stroke: "black", :"stroke-width" => "5")
      end
    end

    it "returns SVG data with path" do
      @sample = fixtures_path.join("path.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300) do |svg|
        svg.path(d: "M 10 80 Q 95 10 180 80", stroke: "black", fill: "none")
      end
    end

    it "returns SVG data with group" do
      @sample = fixtures_path.join("group.svg")
      @svg = SVGen::SVG.new(width: 600, height: 300) do |svg|
        svg.g(stroke: "red", "stroke-width" => 5) do |g|
          g.rect(width: "300", height: "200", fill: "red")
          g.circle(cx: "50", cy: "50", r: "10", fill: "blue")
        end
      end
    end
  end
end
