
def draw_letters
  all_letters = %w[A A A A A A A A A B B C C D D D D E E E E E E E E E E E E F F G G G H H I I I I I I I I I J K L L L L M M N N N N N N \
    O O O O O O O O P P Q R R R R R R S S S S T T T T T T U U U U V V W W X Y Y Z ]
    return (all_letters.shuffle).first(10)
end

def uses_available_letters?(input,letters_in_hand)
value = true
  input_letters = (input.upcase).split('')
  input_letters.each do |alphabet|
    if letters_in_hand.include?(alphabet)
      letters_in_hand.delete_at(letters_in_hand.index(alphabet))
    else
      value = false

    end
  end
return value

end
