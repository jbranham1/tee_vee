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
end
