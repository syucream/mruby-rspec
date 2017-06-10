module RSpec
  module Matchers
    UndefinedValue = Module.new

    # @abstract
    class BaseMatcher
      def initialize(expected = UndefinedValue)
        @expected = expected
      end

      def expected
        @expected
      end

      def description
        nil
      end

      def diff(actual)
        "    Expected: #{expected.inspect}\n" +
        "      Actual: #{actual.inspect}"
      end

      def self.definer_alias(&block)
        define_method __method__ do |*expected|
          instance_exec(*expected, &block)
        end
      end
      def self.chain(name, &block)
        define_method name do |*expected|
          instance_exec(*expected, &block)
          self
        end
      end

      class << self
        alias :match       definer_alias
        alias :description definer_alias
      end
    end
  end
end
