lib = File.dirname(__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "svgen/svg"
require "svgen/element/base"
require "svgen/element/rect"
require "svgen/element/circle"
require "svgen/element/text"
require "svgen/element/line"
