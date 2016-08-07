require 'gosu'
require 'jogador'
require 'mapas'

class Game < Gosu::Window
	attr_reader :map, :fuels, :spikes

	def initialize
		super(950, 650, false)
		self.caption = "Stuck in Space"
		@bgprincipal = Gosu::Image.new(self, "media/BGprincipal.png", true)
		@bggame_over = Gosu::Image.new(self, "media/Game_over.png", true)
		@bgwinner = Gosu::Image.new(self, "media/Winner.png")
		@musica_theme = Gosu::Song.new(self,"media/Unfurla.ogg")

		@bgfase1 = Gosu::Image.new(self, "media/Venus.png", true)
		@bgfase2 = Gosu::Image.new(self, "media/Mars.png", true)
		@bgfase3 = Gosu::Image.new(self, "media/Moon.png", true)
		@bgfase4 = Gosu::Image.new(self, "media/Earth.png", true)
		@bgfase5 = Gosu::Image.new(self, "media/Saturn.png", true)
		@bgfase6 = Gosu::Image.new(self, "media/Uranus.png", true)
		@bgfase7 = Gosu::Image.new(self, "media/Neptune.png", true)
		
		@map1 = Mapa.new(self, "media/mapinha1.txt", "FASE_1")
		@map2 = Mapa.new(self, "media/mapinha2.txt", "FASE_2")
		@map3 = Mapa.new(self, "media/mapinha3.txt", "FASE_3")
		@map4 = Mapa.new(self, "media/mapinha4.txt", "FASE_4")
		@map5 = Mapa.new(self, "media/mapinha5.txt", "FASE_5")
		@map6 = Mapa.new(self, "media/mapinha6.txt", "FASE_6")
		@map7 = Mapa.new(self, "media/mapinha7.txt", "FASE_7") 
		@map = @map1

		@jogador = Astronautinha.new(self, 100, 100)

		@estado = "ABERTURA"
		@coleta = 0
		$vida = 1

	end

	def reset_jogo
		@map1.reset_fuels
		@map2.reset_fuels
		@map3.reset_fuels
		@map4.reset_fuels
		@map5.reset_fuels
		@map6.reset_fuels
		@map7.reset_fuels
		@jogador = Astronautinha.new(self, 100, 100)
		@coleta = 0
		$vida = 1
		@map = @map1
	end

	def update
		update_inicio if @estado == "ABERTURA"
		update_jogando_fase1 if @estado =="FASE_1"
		update_jogando_fase2 if @estado == "FASE_2"
		update_jogando_fase3 if @estado == "FASE_3"
		update_jogando_fase4 if @estado == "FASE_4"
		update_jogando_fase5 if @estado == "FASE_5"
		update_jogando_fase6 if @estado == "FASE_6"
		update_jogando_fase7 if @estado == "FASE_7"
		update_winner if @estado == "WINNER"
		update_gameover if @estado == "KO"
	end
			
	def update_inicio
		if button_down?(Gosu::Button::KbC) then
			@estado = "FASE_1"
		end
		if button_down?(Gosu::Button::KbEscape) then
			exit
		end
		@musica_theme.play
	end	
	
	def update_jogando_fase1
		moveremx = 0
		moveremx -= 5 if button_down? Gosu::KbLeft
		moveremx += 5 if button_down? Gosu::KbRight
		@jogador.pular if button_down? Gosu::KbUp
		@jogador.update(moveremx)
		@jogador.morrer(@map.spikes)

			puts @coleta += 1 if  @jogador.coletar_combustivel(@map.fuels)
			if (@coleta == 5) then
				@estado = "FASE_2"
				@map = @map2
				@jogador = Astronautinha.new(self, 100, 100)
				@coleta = 0
				$vida = 1
			end

			if ($vida == 0) then
				@estado = "KO"
				@map.reset_fuels
			end
	end

	def update_jogando_fase2
		moveremx = 0
		moveremx -= 5 if button_down? Gosu::KbLeft
		moveremx += 5 if button_down? Gosu::KbRight
		@jogador.pular if button_down? Gosu::KbUp
		@jogador.update(moveremx)
		@jogador.morrer(@map.spikes)

			puts @coleta += 1 if  @jogador.coletar_combustivel(@map.fuels)
			if (@coleta == 5) then
				@estado = "FASE_3"
				@map = @map3
				@jogador = Astronautinha.new(self, 100, 100)
				@coleta = 0
				$vida = 1
			end

			if ($vida == 0) then
				@estado = "KO"

			end
	end

	def update_jogando_fase3
		moveremx = 0
		moveremx -= 5 if button_down? Gosu::KbLeft
		moveremx += 5 if button_down? Gosu::KbRight
		@jogador.pular if button_down? Gosu::KbUp
		@jogador.update(moveremx)
		@jogador.morrer(@map.spikes)

			puts @coleta += 1 if  @jogador.coletar_combustivel(@map.fuels)
			if (@coleta == 5) then
				@estado = "FASE_4"
				@map = @map4
				@jogador = Astronautinha.new(self, 100, 100)
				@coleta = 0
			end

			if ($vida == 0) then
				@estado = "KO"
			end
	end

	def update_jogando_fase4
		moveremx = 0
		moveremx -= 5 if button_down? Gosu::KbLeft
		moveremx += 5 if button_down? Gosu::KbRight
		@jogador.pular if button_down? Gosu::KbUp
		@jogador.update(moveremx)
		@jogador.morrer(@map.spikes)

			puts @coleta += 1 if  @jogador.coletar_combustivel(@map.fuels)
			if (@coleta == 5) then
				@estado = "FASE_5"
				@map = @map5
				@jogador = Astronautinha.new(self, 100, 100)
				@coleta = 0
			end

			if ($vida == 0) then
				@estado = "KO"
			end
	end

	def update_jogando_fase5
		moveremx = 0
		moveremx -= 5 if button_down? Gosu::KbLeft
		moveremx += 5 if button_down? Gosu::KbRight
		@jogador.pular if button_down? Gosu::KbUp
		@jogador.update(moveremx)
		@jogador.morrer(@map.spikes)

		puts @coleta += 1 if  @jogador.coletar_combustivel(@map.fuels)
		if (@coleta == 5) then
			@estado = "FASE_6"
			@map = @map6
			@jogador = Astronautinha.new(self, 100, 100)
			@coleta = 0
		end

		if ($vida == 0) then
			@estado = "KO"
		end
	end

	def update_jogando_fase6
		moveremx = 0
		moveremx -= 5 if button_down? Gosu::KbLeft
		moveremx += 5 if button_down? Gosu::KbRight
		@jogador.pular if button_down? Gosu::KbUp
		@jogador.update(moveremx)
		@jogador.morrer(@map.spikes)

		puts @coleta += 1 if  @jogador.coletar_combustivel(@map.fuels)
		if (@coleta == 5) then
			@estado = "FASE_7"
			@map = @map7
			@jogador = Astronautinha.new(self, 100, 100)
			@coleta = 0
		end

		if ($vida == 0) then
			@estado = "KO"
		end
	end

	def update_jogando_fase7
		moveremx = 0
		moveremx -= 5 if button_down? Gosu::KbLeft
		moveremx += 5 if button_down? Gosu::KbRight
		@jogador.pular if button_down? Gosu::KbUp
		@jogador.update(moveremx)
		@jogador.morrer(@map.spikes)

		puts @coleta += 1 if  @jogador.coletar_combustivel(@map.fuels)
		if (@coleta == 10) then
			@estado = "WINNER"
			@coleta = 0
			$vida = 1
		end

		if ($vida == 0) then
			@estado = "KO"
		end
	end

	def update_gameover
		reset_jogo
		@estado = "ABERTURA" if button_down? Gosu::Button::KbT
	end

	def update_winner
		reset_jogo
		@estado = "ABERTURA" if button_down? Gosu::Button::KbR
	end

	def draw
		draw_inicial if @estado == "ABERTURA"
		draw_fase1 if @estado == "FASE_1"
		draw_fase2 if @estado == "FASE_2"
		draw_fase3 if @estado == "FASE_3"
		draw_fase4 if @estado == "FASE_4"
		draw_fase5 if @estado == "FASE_5"
		draw_fase6 if @estado == "FASE_6"
		draw_fase7 if @estado == "FASE_7"
		draw_gameover if @estado == "KO"
		draw_winner if @estado == "WINNER"
	end

	def draw_inicial
		@bgprincipal.draw(0, 0, 0)
	end


	def draw_fase1
		@bgfase1.draw(0, 0, 0)
		@map.draw
		@jogador.draw
	end

	def draw_fase2
		@bgfase2.draw(0, 0, 0)
		@map.draw
		@jogador.draw
	end

	def draw_fase3
		@bgfase3.draw(0, 0, 0)
		@map.draw
		@jogador.draw
	end

	def draw_fase4
		@bgfase4.draw(0, 0, 0)
		@map.draw
		@jogador.draw
	end

	def draw_fase5
		@bgfase5.draw(0, 0, 0)
		@map.draw
		@jogador.draw
	end

	def draw_fase6
		@bgfase6.draw(0, 0, 0)
		@map.draw
		@jogador.draw
	end

	def draw_fase7
		@bgfase7.draw(0, 0, 0)
		@map.draw
		@jogador.draw
	end

	def draw_winner
		@bgwinner.draw(0, 0, 0)
	end

	def draw_gameover
		@bggame_over.draw(0, 0, 0)
	end
end