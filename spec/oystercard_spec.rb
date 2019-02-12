require 'oystercard'

describe Oystercard do
  it "balance is zero" do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error if max balance is exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect{ subject.top_up 1 }.to raise_error 'Max balance of #{max_balance} exceeded'
    end
  end

    describe '#deduct' do
      it { is_expected.to respond_to(:touch_out) }  #with(1).argument

      it 'deducts an amount from the balance' do
        subject.top_up(20)
        expect{ subject.touch_out }.to change{ subject.balance }.by -Oystercard::MIN_BALANCE
      end
    end

    describe '#journey' do
      it 'is not in a journey' do
        expect(subject).not_to be_in_journey
      end

      it 'can touch in' do
        subject.top_up(20)
        subject.touch_in
        expect(subject).to be_in_journey
      end

      it 'can touch_out' do

        subject.touch_out
        expect(subject).not_to be_in_journey
        end

      it 'raise error if it doesnt have minimum balance' do
        expect{subject.touch_in }.to raise_error "Not enough balance"
      end

      it 'deduct the amount when its check out' do
        expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MIN_BALANCE)
      end
    end
  it "remembers the entry station after touch_in" do
    oystercard = Oystercard.new
    oystercard.top_up(5)
    oystercard.touch_in
    expect(oystercard.entry_station).to eq("a")
  end
end
