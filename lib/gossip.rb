#require 'pry'

class Gossip
attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end 

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

def self.all
  all_gossips = [] #on initialise un array vide
  # va chercher chacune des lignes du csv do
  CSV.read("./db/gossip.csv").each do |csv_line|
    # crée un gossip avec les infos de la ligne
  all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end

  return all_gossips #on retourne un array rempli d'objets Gossip
end

end  
  
  #binding.pry