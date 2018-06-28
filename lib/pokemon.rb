class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db
  def initialize (id:, name:, type:, db:)

    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    record = db.execute("SELECT pokemon.id FROM pokemon WHERE pokemon.id = #{id};")
    #binding.pry
    @@all[record - 1]
  end
end
