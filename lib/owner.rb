class Owner
  attr_reader :name, :species
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select{|cat| cat if cat.owner == self}
  end
  
  def dogs
    Dog.all.select{|dog| dog if dog.owner == self}
  end
  
  def buy_cat(name)
    purchased_cat = Cat.new(name, self)
  end
  
  def buy_dog(name)
    purchased_dog = Dog.new(name, self)
  end
  
  def walk_dogs
    dogs.map{|dog|dog.mood = "happy"}
  end
  
  def feed_cats
    cats.map{|cat|cat.mood = "happy"}
  end
end
