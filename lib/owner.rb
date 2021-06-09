class Owner
  # code goes here
  
  @@owners = []

  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
  
    @@owners.push(self)
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.length
  end

  def self.reset_all
    @@owners = []
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end
    
  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat)
    Cat.new(cat,self)
  end

  def buy_dog(dog)
    Dog.new(dog,self)
  end

  def walk_dogs
    self.dogs.each{|dog|
      dog.mood = "happy"
    }
  end

  def feed_cats
    self.cats.each{|cat|
      cat.mood = "happy"
    }
  end

  def sell_pets
    pets = self.cats + self.dogs
    pets.each{|pet|
      pet.mood = "nervous"
      pet.owner = nil
    }
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end