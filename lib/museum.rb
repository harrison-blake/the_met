class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end

  def recommend_exhibits(patron)
    exhibit_accumulator = []

    patron.interests.each do |interest|
      @exhibits.each do |exhibit|
        if exhibit.name == interest
          exhibit_accumulator.push(exhibit)
        end
      end
    end

    exhibit_accumulator
  end

  def admit(patron)
    patrons.push(patron)
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patrons_by_exhibit[exhibit].nil? && patron.interests.include?(exhibit.name)
          patrons_by_exhibit[exhibit] = [patron]
        elsif !patrons_by_exhibit[exhibit].nil? && patron.interests.include?(exhibit.name)
          patrons_by_exhibit[exhibit].push(patron)
        end
      end
    end

    patrons_by_exhibit
  end

  def ticket_lottery_contestants(exhibit)
    lottery_contestants = []
    @patrons.each do |patron|
      if patron.spending_money < exhibit.cost && patron.interests.include?(exhibit.name)
        lottery_contestants.push(patron)
      end
    end

    lottery_contestants
  end

  def draw_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit).empty?
      return nil
    else
      ticket_lottery_contestants(exhibit).sample
    end

  end

  def announce_lottery_winner(exhibit)
    winner = draw_lottery_winner(exhibit)

    if winner.nil?
      "No winners for this lottery"
    else
      "#{winner.name} has won the #{exhibit.name} exhibit lottery"
    end
  end
end
