class Calculator
  attr_reader :input_stack
  attr_reader :current_result

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
    @input_stack = []
    @current_result = 0
  end

  def add value
    return unless input_valid?(value)

    @input_stack << (is_operator?(value) ? value : parse_number(value))

    if @input_stack.length > 2
      @input_stack.shift unless is_operator?(value)
    end

    make_result
  end

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
    @current_result = operand1.send(operator, operand2)
    @input_stack << @current_result
  end
end
