require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  it 'default capacity is 20' do
    docking_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times {docking_station.dock double(:bike)}
    expect {docking_station.dock double(:bike)}.to raise_error "Bike dock full"
  end

  it 'allows user to set new capacity' do
    docking_station = DockingStation.new(5)
    5.times {docking_station.dock double(:bike)}
    expect {docking_station.dock double(:bike)}.to raise_error "Bike dock full"
  end

  it 'releases bikes' do
    bike = double(:bike)
    subject.dock(bike)
    expect( subject.release_bike ).to eq bike
  end

  it 'raises an error when there are no bikes available' do
    expect { subject.release_bike }.to raise_error "No bikes available"
  end


  it 'raises and error when the station is full' do
    subject.capacity.times { subject.dock double(:bike) }
    expect { subject.dock double(:bike) }.to raise_error "Bike dock full"
  end

  it 'docking station does not release broken bike' do
    bike = double(:bike)
    bike.report_broken
    subject.dock(bike)
    expect{subject.release_bike}.to raise_error "Bike not working"
  end

  it 'docking station accepts working bikes' do
    bike = double(:bike)
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'docking station accepts broken bikes' do
    bike = double(:bike)
    bike.report_broken
    expect(subject.dock(bike)).to eq [bike]
  end
end
