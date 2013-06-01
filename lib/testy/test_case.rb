module Testy
  class TestCase
    @method_list = []
    
    def self.test(name, &block)
      Printer.test_name name
      instance_eval &block
      Printer.pass
    rescue TestError => e
      Printer.fail
    rescue Exception => e
      Printer.error e
    end

    def self.assert(value)
      raise TestError unless value
      value
    end

    def assert(value)
      self.class.assert value
    end

    def self.method_added(name)
      test(name) do
        new.send(name)
      end
    end
  end
end
