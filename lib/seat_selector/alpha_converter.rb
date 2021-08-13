module SeatSelector
  class AlphaConverter
    # A -> 1; C -> 3; AA -> 27; AAA -> 703
    def self.to_i(alpha_str)
      alpha_str.each_char.inject(0) do |sum, c| 
        (sum * 26) + self.letter_values[c.downcase]
      end
    end

    def self.letter_values
      @@letter_values ||= begin
        ("a".."z").each_with_object({}).with_index do |(chr, value_map), i|
          value_map[chr] = i + 1
        end
      end
    end
    private_class_method :letter_values
  end
end