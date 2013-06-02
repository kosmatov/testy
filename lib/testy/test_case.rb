module Testy
  class TestCase
    attr_reader :reporter

    def self.run(reporter)
      instance = new(reporter)
      instance.run
    end

    def initialize(reporter)
      @reporter = reporter
    end

    def test_methods
      self.class.instance_methods(false)
    end

    def run
      test_methods.each do |name|
        test(name) do
          send(name)
        end
      end
    end

    def self.test(name, &block)
      method_name = name.gsub(/[^A-z]+/, '_')
      define_method method_name do
        instance_eval &block
      end
    end

    def test(name, &block)
      reporter.test name
      instance_eval &block
      reporter.pass
    #rescue TestError => e
      #reporter.fail @message, e
    #rescue Exception => e
      #reporter.error e
    end

    def assert(value, message = nil)
      @message = message
      raise TestError unless value
    end
  end
end
