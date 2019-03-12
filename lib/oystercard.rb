class Oystercard

    attr_reader :balance, :entry_station, :exit_station, :journeys
    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1

    def initialize
        @balance = 0
        @journeys = []
    end

    def top_up(money)
      raise "Balance cannot exceed £#{MAXIMUM_BALANCE}" if @balance + money > MAXIMUM_BALANCE
        @balance += money
    end

    def touch_in(station)
      raise 'Insufficient funds' if @balance < MINIMUM_FARE
      store_journey(:in, station)
    end

    def touch_out(station)
      deduct(MINIMUM_FARE)
      store_journey(:out, station)
    end

    def store_journey(touch, station)
      if touch == :in
        @journeys << { entry: station, exit: nil }
      else
        @journeys[-1][:exit] = station
      end
    end

    def in_journey?
      @journeys == [] ? false : @journeys[-1][:exit] == nil
    end

    private

    def deduct(money)
      @balance -= money
    end

end
