require 'oystercard'

describe Oystercard do
  let(:station){ double :station}
  let(:exit){ double :exit}

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
        subject.touch_in("abc")
        expect{ subject.touch_out(exit) }.to change{ subject.balance }.by -Oystercard::MIN_BALANCE
      end
    end

    describe '#journey' do
      it 'is not in a journey' do
        expect(subject).not_to be_in_journey
      end

      it 'can touch_out' do
        subject.top_up(10)
        subject.touch_in("abc")
        subject.touch_out("def")
        expect(subject).not_to be_in_journey
        end

      it 'raise error if it doesnt have minimum balance' do
        oyestercard = Oystercard.new(0)
        expect{oyestercard.touch_in(station) }.to raise_error "Not enough balance"
      end

      it 'deduct the amount when its check out' do
        subject.top_up(10)
        subject.touch_in("abc")
        expect { subject.touch_out(exit) }.to change{ subject.balance }.by(-Oystercard::MIN_BALANCE)
      end
    end

  it 'sets entry station to nil after touch out' do
    subject.top_up(7)
    subject.touch_in(station)
    subject.touch_out(exit)
    expect(subject.entry_station).to eq nil
  end

  it "sets journeys as empty by default" do
    oystercard = Oystercard.new
    expect(oystercard.journeys).to eq([])
  end

  it 'checks that touching in and out creates 1 journey' do
    subject.top_up(10)
    subject.touch_in("abc")
    subject.touch_out('def')
    expect { subject.touch_out(exit) }.to change{ subject.journeys.length }.by 1
  end

  it "charges 6 if touching out without touching in" do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in("abc")
    oystercard.touch_out("def")
    expect { oystercard.touch_out("def") }.to change{ oystercard.balance }.by(-6)
  end

  it "charges 6 if touching in having not touched out from before" do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in("abc")
    expect { oystercard.touch_in("def") }.to change{ oystercard.balance }.by(-6)
  end
end
