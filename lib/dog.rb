class Dog
  # code goes here
  attr_reader :name
  attr_accessor :owner, :mood
  @@dog = []
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@dog << self
  end

  def self.all
    @@dog
  end

  
end