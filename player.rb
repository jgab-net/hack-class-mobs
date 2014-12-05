class Player

	LIFE = 5000

	attr_reader :life, :name, :faction, :armors
	attr_accessor :drunk

	def initialize (name)
		@life = LIFE
		@name = name
		@armors = []
		@drunk = false
	end

	def attack (player_vs)
		drunk_damage = 0

		if @faction && faction.attacks
			attack = @faction.attacks[Random.rand(0...@faction.attacks.length)]
			unless player_vs.is_dead?
				actual_damage = attack.damage

				if @drunk
					drunk_damage = actual_damage * 0.1
					damage drunk_damage
				end

				player_vs.damage actual_damage

				drunk_html = "<div class='row'>
				  <div class='col-md-12'>
				    <div class='fight-box'>
				      #{@name} [#{@faction.type}] ataco a #{player_vs.name} [#{player_vs.faction.type}] con #{attack.name} y causo #{actual_damage} daño, dejando a #{player_vs.name} con #{player_vs.life} puntos de vida
				    </div>
				  </div>
				</div>"
				
				if @drunk
					drunk_html = "<div class='row'>
					  <div class='col-md-12'>
					    <div class='fight-box'>
					      <span>DRUNK!!! #{@name} [#{@faction.type}] ataco a #{player_vs.name} [#{player_vs.faction.type}] DRUNK DAMAGE!! #{drunk_damage} DRUNK DAMAGE!!con #{attack.name} y causo #{actual_damage} daño, dejando a #{player_vs.name} con #{player_vs.life} puntos de vida</span>
					    </div>
					  </div>
					</div>"
				end
				
				return drunk_html
				#return "#{@name} [#{@faction.type}] ataco a #{player_vs.name} [#{player_vs.faction.type}] con #{attack.name} y causo #{damage} daño, dejando a #{player_vs.name} con #{player_vs.life} puntos de vida"
			end

			"#{player_vs.name} esta muerto "
		else
			puts 'El administrador no ha seteado ningun ataque para este juegador!'
		end
		
	end	

	def damage (damage)
		@life -= damage
	end	

	def add_armor (armor_to_add)
		if @faction
			faction.armors_allowed.each do |armor|
				if armor_to_add.name == armor.name
					@armors.push armor_to_add
				end
			end
		else
			puts 'El administrador no ha seteado ninguna faccion para este jugador'	
		end
	end

	def calculate_new_life 
		@armors.each do |armor|
			@life += armor.value
		end
	end

	def set_faction (faction)
		@faction = faction
	end

	def to_s
		"name: #{@name} \tlife: #{@life}"
	end

	def is_dead?
		@life <= 0
	end

	protected :damage
end