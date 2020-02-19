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
    # recommendations = []
    # patron_interests = patron.find_all do |patron| patron.interests.exhibit.name
    # exhibits.map do |exhibit|
    #   if exhibit.name.include?(patron.interests)
    #     recommendations << exhibit
    #   end
    # end
    #   recommendations
  end

  def admit(patron)
    @patrons << patron
  end

  # def patrons_by_exhibit_interest
  #
  # end
end
