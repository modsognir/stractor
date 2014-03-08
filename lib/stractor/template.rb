module Stractor
  class Template
    def initialize(content)
      @content = content || ""
    end

    def content
      @content.gsub(/({{(.*?)}})/, '(?<\2>.*?)')
    end

    def captures
      to_regexp.named_captures
    end

    def to_regexp
      Regexp.new(content)
    end
  end
end