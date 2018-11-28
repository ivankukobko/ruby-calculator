require_relative 'calculator'

COMMANDS = [
  'q',
  'c'
]

class CalculatorCli
  def initialize
    @calc = Calculator.new
    main_loop
  end

  def main_loop
    while true do
      puts @calc.input_stack.join(', ')
      #puts @calc.current_result
      print '> '
      @current_input = gets.chomp
      if is_command?(@current_input.downcase)
        case @current_input.downcase
        when 'q' then exit
        when 'c' then @calc.reset
        end
      else
        @calc.add @current_input
      end
    end
  end

  def is_command? value
    COMMANDS.include?(value)
  end
end
