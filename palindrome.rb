# Crear un script que al ingresar una palabra por entrada estándar identifique si es un
# palíndromo o no. (Realizar este script sin utilizar métodos de la clase String o Array)
require "ruby_jard"

class Palindrome
    def initialize(word)
        @word = word
        @word_length = word.length
        @keys_by_lvl = [0, @word_length - 1]

        analize()
    end

    private 

    def analize
        even_odd = is_even_or_odd()
        set_levels(even_odd)

        current_lvl = 1
        is_palindrome = true
        while current_lvl < @levels
            is_palindrome = false if !is_valid?()
            
            current_lvl += 1
            recalculate_keys_by_lvl() unless current_lvl == @levels
        end
        is_palindrome ? end_program('Word is a Palindrome!') : end_program('Word isn\'t a Palindrome!')
    end

    def end_program(cause)
        puts "*" * 50
        puts "▶ #{cause}"
        puts "-" * 50
        puts "🍔 Program Finished! 🤓"
        puts "*" * 50
    end

    def is_valid?
        return true if @word[@keys_by_lvl[0]] === @word[@keys_by_lvl[1]] 
        false
    end

    def is_even_or_odd
        @word_length % 2 == 0 ? 'even' : 'odd' 
    end

    def set_levels(even_odd)
        @levels = @word_length / 2      if even_odd == 'even'
        @levels = @word_length - 2 / 2  if even_odd == 'odd'
    end

    def recalculate_keys_by_lvl
        @keys_by_lvl[0] += 1
        @keys_by_lvl[1] -= 1
    end
end

is_valid_word? = false
while is_valid_word? == false
    puts "Ingresa una palabra"
    word = gets.chomp()
    
    if word.length > 0
        is_valid_word? = true
        Palindrome.new(word)
    end
end

