require "testy/version"

module Testy
  class TestError < Exception
  end

  def self.reporter
    @reporter ||= Reporter.new(Printer.new)
  end

  def self.runnable
    @runnable ||= Runnable.new
  end

  def self.autorun
    at_exit {
      runnable.run reporter
      reporter.report
    }
  end
end

require "testy/runnable"
require "testy/test_case"
require "testy/printer"
require "testy/reporter"

