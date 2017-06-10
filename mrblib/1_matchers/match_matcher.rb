module RSpec
  module Matchers
    # It requires a RegExp mrbgem
    class MatchMatcher < BaseMatcher

      def match(actual)
        !expected.match(actual).nil?
      end

      def description
        "match #{expected.inspect}"
      end
    end

    define :match, MatchMatcher
  end
end
