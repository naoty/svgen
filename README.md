# SVGen

SVG generator

## Install

```sh
$ gem install svgen
```

## Usage

```rb
require "svgen"

svg = SVGen::SVG.new(width: 600, height: 400) do |svg|
  svg.rect(width: 300, height: 200, fill: "blue")
  svg.circle(cx: 100, cy: 100, r: 50, fill: "red")
end
svg.generate
#=>
# <?xml version="1.0" encoding="UTF-8" standalone="no"?>
# <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
# <svg width="600" height="300" xmlns="http://www.w3.org/2000/svg">
#   <rect width="300" height="200" fill="blue"/>
#   <circle cx="100" cy="100" r="50" fill="red"/>
# </svg>
```
