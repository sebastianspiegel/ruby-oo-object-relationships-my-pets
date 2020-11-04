#has_many 

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name, species = "human")
    @name = name 
    @species = species
    @@all << self 
  end

  def say_species 
    "I am a #{species}."
  end

  def self.all
    @@all 
  end

  def self.count
    @@all.length 
  end

  def self.reset_all
    @@all.clear 
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    name = Cat.new(name, self, mood = "happy")
  end

  def buy_dog(name)
    name = Dog.new(name, self, mood = "happy")
  end

  def walk_dogs
    dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.map {|dog| dog.mood = "nervous"}
    cats.map {|cat| cat.mood = "nervous"}
    dogs.map {|dog| dog.owner = nil}
    cats.map {|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end