load 'admin.rb'

class Game 

	attr_reader :player1, :player2

	def initialize 
		factions = Admin.new.setup
		
		@player1 = Player.new 'pffrff'
		@player1.set_faction(factions[0]);

		@player2 = Player.new 'yii'
		@player2.set_faction(factions[1]);

	end

	def run

		head = "
		<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>. : : NINJAS VS DINOSAURS : : .</title>

    <!-- Bootstrap -->
    <link href='css/bootstrap.min.css' rel='stylesheet'>

    <link href='css/style.css' rel='stylesheet'>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src='https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></script>
      <script src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></script>
    <![endif]-->
  </head>
  <body>
    <div class='container'>"
      
    footer = "</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src='js/bootstrap.min.js'></script>
  </body>
</html>"

		attacksBuffer = ""

		while !@player2.is_dead? && !@player1.is_dead? do
			attacksBuffer+= 
			"<div class='row'>
			        <div class='col-xs-6'>
			          <div class='card'>
			            <div class='row'>
			              <div class='col-xs-5'>
			                <div class='profile-picture'>
			                  <img src='img/ninja.gif' alt=''>
			                </div>
			              </div>
			              <div class='col-xs-7'>
			                <div class='profile-name text-center'>
			                  <h3>#{player1.name}</h3>
			                </div>
			                <div class='life'>
			                  <div class='progress'>
			                    <div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='45' aria-valuemin='0' aria-valuemax='100' style='width: #{player1.life * 100/Player::LIFE}%'>
			                      <span class='sr-only'>#{player1.life * 100/Player::LIFE} % Complete</span>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class='col-xs-6'>
			          <div class='card'>
			            <div class='row'>
			              <div class='col-xs-5'>
			                <div class='profile-picture'>
			                  <img src='img/dinosaur.gif' alt=''>
			                </div>
			              </div>
			              <div class='col-xs-7'>
			                <div class='profile-name text-center'>
			                  <h3>#{player2.name}</h3>
			                </div>
			                <div class='life'>
			                  <div class='progress'>
			                    <div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='45' aria-valuemin='0' aria-valuemax='100' style='width: #{player2.life * 100 / Player::LIFE}%'>
			                      <span class='sr-only'>#{player2.life * 100 / Player::LIFE}% Complete</span>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>
			      </div>"
			attacksBuffer+= @player1.attack(@player2) + "\n"
			attacksBuffer+= 
			"<div class='row'>
			        <div class='col-xs-6'>
			          <div class='card'>
			            <div class='row'>
			              <div class='col-xs-5'>
			                <div class='profile-picture'>
			                  <img src='img/ninja.gif' alt=''>
			                </div>
			              </div>
			              <div class='col-xs-7'>
			                <div class='profile-name text-center'>
			                  <h3>#{player1.name}</h3>
			                </div>
			                <div class='life'>
			                  <div class='progress'>
			                    <div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='45' aria-valuemin='0' aria-valuemax='100' style='width: #{player1.life * 100/Player::LIFE}%'>
			                      <span class='sr-only'>#{player1.life * 100/Player::LIFE} % Complete</span>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>
			        <div class='col-xs-6'>
			          <div class='card'>
			            <div class='row'>
			              <div class='col-xs-5'>
			                <div class='profile-picture'>
			                  <img src='img/dinosaur.gif' alt=''>
			                </div>
			              </div>
			              <div class='col-xs-7'>
			                <div class='profile-name text-center'>
			                  <h3>#{player2.name}</h3>
			                </div>
			                <div class='life'>
			                  <div class='progress'>
			                    <div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='45' aria-valuemin='0' aria-valuemax='100' style='width: #{player2.life * 100 / Player::LIFE}%'>
			                      <span class='sr-only'>#{player2.life * 100 / Player::LIFE}% Complete</span>
			                    </div>
			                  </div>
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>
			      </div>"
			attacksBuffer+= @player2.attack(@player1) + "\n"
		end

		File.open('index.html', 'w') do |file|
			file.puts head + attacksBuffer + footer
		end

		
	end

end