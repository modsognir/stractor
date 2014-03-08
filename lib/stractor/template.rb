module Stractor
  class Template
    def initialize(content)
      @content = content || ""
    end

    def content
      @content.gsub(/({{(.*?)}})/) do |match|
        "(?<#{variable_name_from(match)}>.*?)"
      end
    end

    def captures
      to_regexp.named_captures
    end

    def to_regexp
      Regexp.new(content)
    end

  private

    def variable_name_from(match)
      match.gsub(/\{|\}|\s/, '').strip.chomp
    end
  end
end