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
    end


end 