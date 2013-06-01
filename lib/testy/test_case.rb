module Testy
  class TestCase
    def self.instance
      @instance ||= new
    end

    def self.test(name, &block)
      instance.test name, &block
    end

    def test(name, &block)
      Printer.test_name name
      instance_eval &block
      Printer.pass
    rescue TestError => e
      Printer.fail
    rescue Exception => e
      Printer.error e
    end

    def assert(value)
      raise TestError unless value
      value
    end

    def self.method_added(name)
      instance.test(name) do
        send(name)
      end
    end
  end
end
