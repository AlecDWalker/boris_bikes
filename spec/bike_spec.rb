require 'bike'

describe Bike do
it { is_expected.to respond_to :working?}

# 1. Setup - calculator = Calculator.new
  it 'user can report broken bike when docking' do
    subject.report_broken
    expect(subject).to be_broken
  end

end
