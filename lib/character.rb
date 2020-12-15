class Character
  attr_reader :name,
              :actor,
              :salary
  def initialize(character_information)
    @name = character_information[:name]
    @actor = character_information[:actor]
    @salary = character_information[:salary]
  end
end
