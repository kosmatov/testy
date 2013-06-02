module Testy
  class Runnable

    def register(klass)
      @runnable_list ||= []
      @runnable_list << klass
    end

    def run(reporter)
      @runnable_list.each { |klass| klass.run reporter }
    end
  end
end
