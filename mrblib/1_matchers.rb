module RSpec
  module Matchers

    def self.define(*args, &block)
      DSL.define(*args, &block)
    end

  end
end
