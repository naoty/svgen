# SVGen

SVG generator

## Install

```sh
$ gem install svgen
```

## Usage

### rect, circle, text

```rb
require "svgen"

svg = SVGen::SVG.new(width: 600, height: 400) do |svg|
  svg.rect(width: 300, height: 200, fill: "blue")
  svg.circle(cx: 100, cy: 100, r: 50, fill: "red")
  svg.text("Sample Text", x: 20, y: 20)
end
svg.generate
#=>
# <?xml version="1.0" encoding="UTF-8" standalone="no"?>
# <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
# <svg width="600" height="300" xmlns="http://www.w3.org/2000/svg">
#   <rect width="300" height="200" fill="blue"/>
#   <circle cx="100" cy="100" r="50" fill="red"/>
#   <text x="20" cy="20">Sample Text</text>
# </svg>
```

### group

```rb
require "svgen"

svg = SVGen::SVG.new(width: 600, height: 400) do |svg|
  svg.g(stroke: "red", "stroke-width" => 5) do |g|
    g.rect(x: 50, y: 50, width: 100, height: 100)
    g.circle(cx: 200, cy: 200, r: 50)
  end
end
svg.generate
#=>
# <?xml version="1.0" encoding="UTF-8" standalone="no"?>
# <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
# <svg width="600" height="300" xmlns="http://www.w3.org/2000/svg">
#   <g stroke="red" stroke-width="5">
#     <rect x="50" y="50" width="100" height="100"/>
#     <circle cx="200" cy="200" r="50"/>
#   </g>
# </svg>
```
