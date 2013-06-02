module Testy
  class Reporter

    def initialize(printer)
      @printer = printer
      @collection = Hash.new(0)
    end

    def report
      @printer.report @collection
    end

    def pass
      @collection[:passed] += 1
      @printer.pass
    end

    def fail(message, exception)
      @collection[:failed] += 1
      @printer.fail message, exception
    end

    def error(exception)
      @collection[:error] += 1
      @printer.error exception
    end

    def test(name)
      @collection[:count] += 1
      @printer.test_name name
    end
  end
end
