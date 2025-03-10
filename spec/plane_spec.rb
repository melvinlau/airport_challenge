require "controller" # controller requires all the required files in one place

describe Plane do

  let(:plane) { described_class.new }
  let(:airport) { Airport.new }
  # airport = instance_double("Airport")

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  describe "#land" do

    context "when airport weather is sunny" do

      before(:each) do
        airport.sunny
        plane.land(airport)
      end

      it "confirms that the plane is not airborne" do
        expect(plane).not_to be_airborne
      end

      it "cannot not 'land' again if already landed" do
        expect { plane.land(airport) }.to raise_error "Plane has already landed"
      end

    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when weather is stormy
    context "when airport weather is stormy" do

      before(:each) do
        airport.stormy
      end

      it "raises an error" do
        expect { plane.land(airport) }.to raise_error "Cannot land due to stormy weather"
      end

      it "keeps the plane airborne" do
        expect(plane).to be_airborne
      end

    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full
    context "when airport is full" do

      before(:each) do
        airport.sunny
        airport.capacity.times { Plane.new.land(airport) }
      end

      it "raises an error" do
        expect { plane.land(airport) }.to raise_error "Cannot land as #{airport} is full"
      end

      it "keeps the plane airborne" do
        expect(plane).to be_airborne
      end

    end

  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and
  # confirm that it is no longer in the airport
  describe "#take_off" do

    before(:each) do
      # Because plane is airborne when instantiated, we need to land it first.
      # To land it, the weather must first be sunny.
      airport.sunny
      plane.land(airport)
    end

    context "when airport weather is sunny" do

      before(:each) do
        airport.sunny
        plane.take_off(airport)
      end

      it "confirms the plane is no longer in the airport" do
        expect(plane).to be_airborne
      end

      it "cannot 'take off' again if already airborne" do
        expect { plane.take_off(airport) }.to raise_error "Plane is already airborne"
      end

      it "cannot take off from an airport it is not in" do
        another_airport = Airport.new
        another_airport.sunny
        plane.land(airport) # reset to landed status to test next line
        expect { plane.take_off(another_airport) }.to raise_error "Plane is not in #{another_airport}"
      end

    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent takeoff when weather is stormy
    context "when airport weather is stormy" do

      before(:each) do
        airport.stormy
      end

      it "raises an error" do
        expect { plane.take_off(airport) }.to raise_error "Cannot take off due to stormy weather"
      end

      it "confirms plane is not airborne" do
        expect(plane).not_to be_airborne
      end

    end

  end

end
