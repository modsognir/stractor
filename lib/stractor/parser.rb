module Stractor
  class Parser
    attr_accessor :content, :template

    def initialize(content, template)
      @content = content
      @template = template
    end

    def matches
      content.match(template.to_regexp)
    end
  end
end