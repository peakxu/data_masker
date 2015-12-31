require 'digest'

#
module DataMasker
  # Mask common names using names from US census
  class MaskedName
    class << self
      def first_names
        return @first_names if @first_names
        file = File.expand_path('../../../data/us_first_names.txt', __FILE__)
        @first_names = File.readlines(file).map(&:strip)
      end

      def last_names
        return @last_names if @last_names
        file = File.expand_path('../../../data/us_last_names.txt', __FILE__)
        @last_names = File.readlines(file).map(&:strip)
      end

      def initials
        @initials ||= ('A'..'Z').to_a
      end
    end

    def initialize(name = nil)
      @hash = Digest::MD5.hexdigest("#{DataMasker.salt}#{name}")
    end

    def to_s
      "#{first_name} #{initial}. #{last_name}"
    end

    def first_name
      return @first_name if @first_name
      # First 3 hex digits provide 4096 possibilities, we have 2048 first names
      first_name_idx = @hash[0..2].hex / 2
      @first_name = self.class.first_names[first_name_idx]
    end

    def initial
      return @initial if @initial
      # Next 2 hex digits provide 256 possibilities, divide by 10 to distribute
      # over 26 initials
      initial_idx = @hash[3..4].hex / 10
      @initial = self.class.initials[initial_idx]
    end

    def last_name
      return @last_name if @last_name
      # Next 3 hex digits provide 4096 possibilites, we have 4096 last names
      last_name_idx = @hash[5..7].hex
      @last_name = self.class.last_names[last_name_idx]
    end
  end
end
