class Car

  attr_reader :make, :model, :classification 
  attr_accessor :owner, :mechanic 

  @@all = []

  def initialize(make, model, classification, owner, mechanic)
    @make = make
    @model = model
    @classification = classification
    @owner = owner
    @mechanic = mechanic 

    @@all << self
  end

  def self.all 
    @@all
  end

  def self.classifications
    cars = self.all.map do |car|
      car.classification
    end
    cars.uniq 
  end

  def matching_mechanic
    Mechanic.all.select do |mechanic|
      if mechanic.specialty == self.classification
        return mechanic 
      end
    end
  end

end

