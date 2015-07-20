module Precision
  class Calculator
      attr_accessor :decimal

      def initialize(decimal)
        @decimal = BigDecimal(String(decimal))
      end

      def calculate
        return 0 if significant_digits == "0"
        [(significant_digits.length - exponent), 0].max
      end

      alias_method :to_i, :calculate

    private

      def significant_digits
        split[1]
      end

      def exponent
        split[3]
      end

      def split
        @split ||= decimal.split
      end

  end
end
