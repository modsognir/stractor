require "stractor/parser"
require "stractor/template"
require "stractor/version"

module Stractor
  def self.parse(content, template)
    Stractor::Parser.new(content, Template.new(template)).matches
  end
end
