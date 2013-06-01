module Testy
  class Printer
    def self.test_name(name)
      print "\n#{name} -- "
    end

    def self.pass
      print "PASS\n"
    end
    
    def self.fail
      print "FAIL\n"
    end

    def self.error(e)
      print "ERROR\n"
      print "\n#{e.message}\n===\n"
      print e.backtrace.join "\n"
    end
  end
end
