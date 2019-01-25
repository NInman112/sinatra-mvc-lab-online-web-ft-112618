class PigLatinizer

  def piglatin(phrase)
    if phrase.split(" ").length == 1
      binding.pry

      piglatinize(phrase)
    else
      piglatinize_sentence(phrase)
    end
  end

  def piglatinize(word)
    vowels = %w[a e i o u A E I O U]
    consonants = ("A".."Z").to_a + ("a".."z").to_a - vowels

    if word[0].match(/[aeiouAEIOU]/)
	     word + "way"
     elsif consonants.include?(word[0]) && consonants.include?(word[1]) && consonants.include?(word[2])
       word[3..-1] + word[0..2] + "ay"
     elsif consonants.include?(word[0]) && consonants.include?(word[1])
       word[2..-1] + word[0..1] + "ay"
     else consonants.include?(word[0])
       word[1..-1] + word[0] + "ay"
     end
   end

   def piglatinize_sentence(phrase)
     phrase.split.map do |word|
       #binding.pry
       piglatinize(word)
     end.join(" ")
   end

end
