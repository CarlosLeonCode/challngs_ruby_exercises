# Desarrolle un script para calcular la secuencia de fibonacci según un número ingresado
# por entrada estándar, tomando este como el límite de la secuencia.
require "ruby_jard"

class Fibonacci
    def initialize(max_number)
        @max_number = max_number
        @serie = [0,1]
        start_serie()
    end

    private

    def start_serie
        generate_serie = true
        while generate_serie == true
            serie_completed = serie_is_equal_to_max_number?()
            serie_completed_greater = is_number_greater_than_max_number?()
            if serie_completed == true || serie_completed_greater == true
                end_program('Serie completed!') if serie_completed
                end_program("Entered number doesn\'t belong to Fibonacci sequence, One sequence more generated after #{@max_number}.") if serie_completed_greater
                generate_serie = false
            else 
                value = calc_new_value()
                push_value_to_serie(value)
            end
        end
    end

    def push_value_to_serie(value)
        @serie.push(value)
    end

    def calc_new_value
        right_ind = 1
        sum = 0
        @serie.each_with_index do |left_val ,ind|
            unless @serie[right_ind].nil?
                sum = left_val + @serie[right_ind]
                right_ind += 1
            end
        end
        sum
    end

    def serie_is_equal_to_max_number?
        return true if @serie.last == @max_number
        false
    end

    def is_number_greater_than_max_number?
        return true if @serie.last > @max_number
        false
    end

    def end_program(cause)
        puts "*" * 50
        puts "⚪ -> #{cause}"
        puts "-" * 50
        puts 'The Fibonacci serie is:'
        puts "▶ #{@serie.inspect}"
        puts "*" * 50
        puts "🍔 Program Finished! 🤓"
    end
end

def is_valid?(number)
    if(number === "0")
        raise "El 0 no es un valor valido 😵 \n"
    else
        number = number.to_i
        # This means that the value received was a string and this can't be parse to integer
        raise "😵 Ingresaste un valor incorrecto 😵 \n" if number == 0
        true
    end
end


start_serie = false
while start_serie === false
    begin
        print('Ingresa un número entero! ')
        max_number = gets.chomp
        start_serie = is_valid?(max_number)
        Fibonacci.new(max_number.to_i) if start_serie === true
    rescue => exception
        puts exception
    end
end
