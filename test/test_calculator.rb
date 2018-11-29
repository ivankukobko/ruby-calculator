require 'test/unit'
require_relative '../src/calculator'


class TestCalculator < Test::Unit::TestCase
  def test_create_calculator
    calc = Calculator.new
    assert_equal [0], calc.input_stack
  end

  def test_add_valid_number
    calc = Calculator.new
    calc.add '42'
    assert_equal [0, 42.0], calc.input_stack
  end

  def test_add_valid_numbers
    calc = Calculator.new
    calc.add '42 1'
    assert_equal [42.0, 1.0], calc.input_stack
  end

  def test_add_valid_numbers_shift_stack
    calc = Calculator.new
    calc.add '42 1 3'
    assert_equal [1.0, 3.0], calc.input_stack
  end

  def test_add_valid_numbers_shift_stack2
    calc = Calculator.new
    calc.add '42 1 3 +'
    assert_equal [4.0], calc.input_stack
  end

  def test_add_invalid_number
    calc = Calculator.new
    calc.add 'forty'
    assert_equal [0], calc.input_stack
  end

  def test_add_invalid_numbers
    calc = Calculator.new
    calc.add 'forty two'
    assert_equal [0], calc.input_stack
  end

  def test_add_operator
    calc = Calculator.new
    calc.add '42'
    calc.add '+'
    assert_equal [42.0], calc.input_stack
  end

  def test_add_operator2
    calc = Calculator.new
    calc.add '42 3'
    assert_equal [42.0, 3.0], calc.input_stack
    calc.add '+'
    assert_equal [45.0], calc.input_stack
  end

  def test_add_operator3
    calc = Calculator.new
    calc.add '42 3 +'
    assert_equal [45.0], calc.input_stack
  end
end
