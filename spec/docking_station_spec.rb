require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect( subject.release_bike ).to eq bike
  end

  it 'raises an error when there are no bikes available' do
    expect { subject.release_bike }.to raise_error "No bikes available"
  end


  it 'raises and error when the station is full' do
    20.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error "Bike dock full"
  end

  # it 'docks a bike' do
  #   bike = Bike.new
  #   subject.dock(bike)
  #   expect(subject.bike).to eq bike
  # end

end
