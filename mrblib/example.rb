module RSpec
  class Example
    include RSpec::Matchers::DSL

    def initialize(group,description,&block)
      @group = group
      @description = description
      @block = block
    end

    # Executes the example Proc
    def execute
      if @block
        instance_eval(&@block)
      else
        raise MRubyTestSkip, "(Not implemented)"
      end
    end

    # The example full description
    def description
      [@group.description,@description].join(' ')
    end

    def expect(*args,&block)
      Expectation.new(*args,&block)
    end

    def described_class
      @group.described_class
    end

    def subject
      @subject ||= @group.subject.call
    end

    def is_expected
      expect(subject)
    end

    def should(*args)
      expect(subject).to(*args)
    end

    def should_not(*args)
      expect(subject).not_to(*args)
    end

  end
end
