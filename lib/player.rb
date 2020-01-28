class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{life_points} points de vie"
  end

  def gets_damage(points)
    @life_points -= points
    if is_alive? == false
      then puts "#{@name} a été tué"
    end
  end

  def is_alive?
    return @life_points > 0
  end

  def compute_damage
    return rand(1..6)
  end

  def attacks(player)
    puts "le joueur #{self.name} attaque le joueur #{player.name}"
    damage = compute_damage
    puts "il lui inflige #{damage} points de dommage"
    player.gets_damage(damage)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end
  def show_state
    puts "#{@name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon}"
    if weapon > @weapon_level
      @weapon_level = weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health = rand(1..6)
    if health == 1
      puts "Tu n'as rien trouvé... "
    elsif health <= 5
      @life_points = [100, @life_points + 50].min
    else
      @life_points = [100, @life_points + 80].min
    end
  end
end