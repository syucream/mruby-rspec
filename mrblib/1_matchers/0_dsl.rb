module RSpec
  module Matchers
    module DSL
      MISING_PREFIXES = []

      def self.define(name, klass=nil, &block)
        if !klass.nil?
          define_method name do |*expected|
            klass.new(*expected)
          end
        elsif block_given?
          define_method name do |*expected|
            block.call(*expected)
          end
        else
          # NOTE unexpected call
          exit
        end
      end

      def self.define_missing(prefix, klass=nil, &definition)
        MISING_PREFIXES << [prefix,klass]
      end

      def method_missing(method,*args,&block)

        MISING_PREFIXES.each do |prefix,klass|
          if method.to_s[0,prefix.length] == prefix
            return klass.new(method,*args,&block)
          end
        end

        super
      end
    end
  end
end

