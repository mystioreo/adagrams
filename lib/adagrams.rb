
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

def score_word(word)
  score_hash = {"A" => 1, "E" => 1, "I" => 1,"O" => 1,"U" => 1,"L" => 1,"N" => 1,"R" => 1,"S" => 1,"T" => 1,\
  "D" => 2, "G" => 2, "B" => 3, "C" => 3,"M" => 3,"P" => 3, "F" => 4, "H" => 4,"V" => 4,"W" => 4,"Y" => 4,\
  "K" => 5, "J" => 8, "X" => 8, "Q" => 10,"Z" => 10}

  word_array = word.upcase.split('')
  scores = word_array.map do |letter|
    score_hash[letter]
  end

  score = scores.sum
  if word.length > 6
    score += 8
  end

  return score
end

def highest_score_from(words)
  words_with_scores = {}

  words.each do |word|
    words_with_scores["#{word}"] = score_word(word)
  end

  best_score_array = words_with_scores.max_by {|word, score| score}

  best_score = best_score_array[1]

  best_word_list = words_with_scores.select{|word, score| score == best_score}

  best_word = 'reallybigtestword'

  best_word_list.each do |word, score|
    if word.length == 10
      best_word = word
      return {word: best_word, score: best_score}
    elsif word.length < best_word.length
      best_word = word
    end
  end

  return {word: best_word, score: best_score}

end
