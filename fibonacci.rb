require "ruby_jard"

class Fibonacci
    def initialize(max_number)
        puts "Inside Fibonacci class"
        @max_number = max_number
        @serie = [0,1]
        # jard
        start_serie()
    end

    private

    def start_serie
        while serie_is_equal_to_max_number?() === false || is_number_greater_than_max_number?() === false
        # end_program('Limit reached') if serie_is_equal_to_max_number?()
        # end_program('Entered number doesn\'t belong to Fibonacci sequence, limit exceeded') if is_number_greater_than_max_number?()
            value = calc_new_value()
            push_value_to_serie(value)
        end
    end

    def push_value_to_serie(value)
        @serie.push(value)
    end

    def calc_new_value
        jard
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
        puts "PROGRAMA TERMINADO !!!"
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
