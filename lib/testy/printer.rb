module Testy
  class Printer
    def test_name(name)
      print "\n#{name} -- "
    end

    def pass
      print "PASS\n"
    end

    def fail(message = nil, exception = nil)
      print "FAIL\n"
    end

    def error(exception = nil)
      print "ERROR\n"
      print "\n#{exception.message}\n===\n"
      print exception.backtrace.join "\n"
    end

    def report(hash)
      print "Tests finished\n"
      print "#{hash[:count]} tests completed. "
      print "#{hash[:passed]} tests successfull. "
      print "#{hash[:failed]} tests failed. "
      print "#{hash[:error]} tests with errors.\n"
    end
  end
end
