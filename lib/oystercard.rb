class Oystercard

    attr_reader :balance
    MAXIMUM_BALANCE = 90

    def initialize
        @balance = 0
    end

    def top_up(money)
      raise "Balance cannot exceed £#{MAXIMUM_BALANCE}" if @balance + money > MAXIMUM_BALANCE
        @balance += money
    end

end
