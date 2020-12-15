class Network
  attr_reader :name,
              :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    @shows.each_with_object([]) do |show, array|
      array << show.get_main_characters
    end.flatten
  end

  def actors_by_show
    @shows.each_with_object({}) do |show, hash|
      hash[show] = show.actors
    end
  end

  def shows_by_actor
    find_all_actors.each_with_object({}) do |actor, hash|
      hash[actor] = find_shows_for_actor(actor)
    end
  end

  def find_all_actors
    @shows.map do |show|
      show.actors
    end.flatten.uniq
  end

  def find_shows_for_actor(actor)
    @shows.select do |show|
      show.actors.any?(actor)
    end
  end

  def prolific_actors
    shows_by_actor.each_with_object([]) do |actor, array|
      array << actor[0] if actor[1].count > 1
    end
  end
end
