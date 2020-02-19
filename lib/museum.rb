class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    exhibit_names = exhibits.map {|exhibit| exhibit.name}
    exhibits_of_no_interest = exhibit_names - patron.interests
    exhibit_names - exhibits_of_no_interest
  end

  def admit(patron)
    @patrons << patron
  end

end
