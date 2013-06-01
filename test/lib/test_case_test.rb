require 'test_helper'

class TestCaseTest < Testy::TestCase
  def test_should_assert_true
    assert true
  end
  
  def test_should_assert_false
    assert false
  end

  def test_shoud_raise_error
    raise "Zozoz"
  end
end
