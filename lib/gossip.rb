class Gossip

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author,@content]
    end
    return "ce que je veux"
  end

end
