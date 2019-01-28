class Gossip

  attr_accessor :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author,@content]
    end
  end

  def self.all
    #créé une array
    all_gossips = []
    #lit le contenu des csv et insere dans l'array chaque ligne du csv à l'interieur
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips  
  end    
end
