require 'gosu'
require 'fuel'
require 'spike'

class Mapa
	attr_reader :largura, :altura, :spikes
	attr_accessor :fuels

	def initialize(window, filename, estado)
		@bloco = Gosu::Image.new(window, "media/Tileoficial.png", true)
		@spikes = []
			spike_img = Gosu::Image.new(window, "media/spike.png", false)
		@fuels = []
			fuel_img = Gosu::Image.new(window, "media/Fuel.png", false)
		
		@jogador = Astronautinha.new(window, @x, @y)

		lines = File.readlines(filename).map do |line|
			line.chomp
		end

		@estado = estado

		@altura = lines.size
		@largura = lines[0].size
		
		@tiles = Array.new(@largura) do |x|
			Array.new(@altura) do |y|
				case lines[y][x,1]
				when "."
					@bloco
				when "x"
					@spikes.push(Spike.new(spike_img, x * 50, y * 50))
					nil
				when "?"
					nil
				when "!"
					@fuels.push(Fuel.new(fuel_img, x * 50, y * 50))
					nil
				else
					nil
				end
			end
		end
		@reserva = @fuels.dup
	end

	def reset_fuels
		@fuels = @reserva.dup
	end

	def draw
		draw_fase1 if @estado == "FASE_1"
		draw_fase2 if @estado == "FASE_2"
		draw_fase3 if @estado == "FASE_3"
		draw_fase4 if @estado == "FASE_4"
		draw_fase5 if @estado == "FASE_5"
		draw_fase6 if @estado == "FASE_6"
		draw_fase7 if @estado == "FASE_7"
	end

	def draw_fase1
		@altura.times do |y|
			@largura.times do |x|
				tile = @tiles[x][y]
				if tile then
					tile.draw(x * 50 , y * 50, 0)
				end		
			end
		end
		@fuels.each do |combustivel| combustivel.draw end
		@spikes.each do |spike| spike.draw end
	end

	def draw_fase2
		@altura.times do |y|
			@largura.times do |x|
				tile = @tiles[x][y]
				if tile then
					tile.draw(x * 50 , y * 50, 0)
				end		
			end
		end
		@fuels.each do |combustivel| combustivel.draw end
		@spikes.each do |spike| spike.draw end
	end

	def draw_fase3
		@altura.times do |y|
			@largura.times do |x|
				tile = @tiles[x][y]
				if tile then
					tile.draw(x * 50 , y * 50, 0)
				end		
			end
		end
		@fuels.each do |combustivel| combustivel.draw end
		@spikes.each do |spike| spike.draw end
	end

	def draw_fase4
		@altura.times do |y|
			@largura.times do |x|
				tile = @tiles[x][y]
				if tile then
					tile.draw(x * 50 , y * 50, 0)
				end		
			end
		end
		@fuels.each do |combustivel| combustivel.draw end
		@spikes.each do |spike| spike.draw end
	end

	def draw_fase5
		@altura.times do |y|
			@largura.times do |x|
				tile = @tiles[x][y]
				if tile then
					tile.draw(x * 50 , y * 50, 0)
				end		
			end
		end
		@fuels.each do |combustivel| combustivel.draw end
		@spikes.each do |spike| spike.draw end
	end

	def draw_fase6
		@altura.times do |y|
			@largura.times do |x|
				tile = @tiles[x][y]
				if tile then
					tile.draw(x * 50 , y * 50, 0)
				end		
			end
		end
		@fuels.each do |combustivel| combustivel.draw end
		@spikes.each do |spike| spike.draw end
	end

	def draw_fase7
		@altura.times do |y|
			@largura.times do |x|
				tile = @tiles[x][y]
				if tile then
					tile.draw(x * 50 , y * 50, 0)
				end		
			end
		end
		@fuels.each do |combustivel| combustivel.draw end
		@spikes.each do |spike| spike.draw end
	end

	def solid? (x,y)
		y < 0 or @tiles [x/50][y/50] or x < 0 or x > 950 or y > 650
	end
end