require 'oystercard'

describe Oystercard do

    describe ':balance' do

    it 'has a balance of 0 when initialized' do
        expect(subject.balance).to eq 0
    end

    end

    describe '#top_up' do

        it 'adds money to the card' do
            subject.top_up(10)
            expect(subject.balance).to eq 10
        end

        it 'raises exception when balance would go above maximum' do
          expect { subject.top_up(Oystercard::MAXIMUM_BALANCE + 1) }.to raise_error 'Balance cannot exceed £90'
        end
    end

    describe '#deduct' do

      it 'deducts money from the card' do
        subject.top_up(20)
        expect{ subject.deduct(3) }.to change{ subject.balance }.by(-3)
      end
    end

    describe '#in_journey?' do

      it 'should return false if oystercard has just been created' do
        expect(subject).not_to be_in_journey
      end

    end

    describe '#touch_in' do

      it 'should be in journey when touched in' do
        subject.touch_in
        expect(subject).to be_in_journey
      end

    end

    describe '#touch_out' do

      it 'should not be in journey after touched out' do
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey
      end

    end

end
