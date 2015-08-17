require_relative '../bin/environment.rb'

class Pokemon

  def self.save(name,type,database)
    q = database.prepare("INSERT INTO pokemon (name,type) VALUES (?,?)")
    q.bind_params(name,type)
    q.execute
  end

  

end