require 'vans'

describe Van do
  it { is_expected.to respond_to :collect }

  describe '#collect' do
    it 'collect broken bikes from docking stations' do
      van = Van.new
      docking_station = DockingStation.new
      bike = Bike.new.report_broken
      docking_station.dock(bike)

      expect(van.collect).to eq [bike]
    end


  end
end
