module Rpg
  class Pesel
    def initialize(options = {})
      @date = options[:date].is_a?(Date) ? options[:date] : Date.parse(options[:date])
      if [:male, :female].include?(options[:gender])
        @gender = options[:gender]
      else
        @gender = [:male, :female].sample
      end
    end

    def generate
      @pesel = [date, serie, gender_num].join
      @pesel += calculate_control_sum.to_s
    end

    private
    def serie
      "%03d" % rand(0..999)
    end

    def calculate_control_sum
      mask = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3]
      val = @pesel.split("").map(&:to_i)
      modulo = (mask.inject(0){|sum, num| sum + (num * val.shift)} % 10)

      modulo == 0 ? 0 : 10 - modulo
    end

    def gender_num
      if @gender == :male
        (0..9).to_a.select(&:odd?).sample
      else
        (0..9).to_a.select(&:even?).sample
      end
    end

    def date
      [@date.strftime("%y"), month_with_century_offset, @date.strftime("%d")]
    end

    def month_with_century_offset
      offset = if (1800..1899).include?(@date.year)
        80
      elsif (1900..1999).include?(@date.year)
        0
      elsif (2000..2099).include?(@date.year)
        20
      elsif (2100..2199).include?(@date.year)
        40
      elsif (2200..2299).include?(@date.year)
        60
      else
        raise ArgumentError.new("Year should be between 1800 and 2299")
      end
      "%02d" % (@date.month + offset)
    end
  end
end