class Calculator
  attr_reader :input_stack

  OPERATORS = [
    '*',
    '/',
    '+',
    '-'
  ].freeze

  def initialize
    reset
  end

  def reset
    @input_stack = [0]
  end

  def add value
    return unless input_valid?(value)

    value.split(' ').each do |v|
      val = v.chomp
      val = (is_operator?(val) ? val : parse_number(val))
      next if !is_operator?(val) && val === 0
      @input_stack << val
      @input_stack.shift if @input_stack.length > 2 && !is_operator?(val)
    end

    make_result
  end

  private

  def parse_number value
    value.to_f
  end

  def is_operator? value
    OPERATORS.include?(value)
  end

  def input_valid? value
    return false if value.empty?
    #return false if value.to_f.to_s != value
    return true
  end

  def make_result
    return unless is_operator?(@input_stack.last)
    operator = @input_stack.pop
    operand2 = @input_stack.pop
    operand1 = @input_stack.pop || 0
    result = operand1.send(operator, operand2)
    @input_stack << result
  end
end
