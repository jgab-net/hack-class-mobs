load 'player.rb'
load 'faction.rb'
load 'attack.rb'

class Admin

	def setup 

		na = Attack.new 'no attack', 0

		dp = Attack.new 'dragon punch', 20
		blk = Attack.new 'bruce lee kick', 20
		cns = Attack.new 'chuck norris stare', 20

		ninja = Faction.new 'ninja'

		ninja.set_attack na
		ninja.set_attack dp
		ninja.set_attack blk
		ninja.set_attack cns

	end

end

