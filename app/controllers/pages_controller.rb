class PagesController < ApplicationController

	def index
	end

	def simulations
		@simulations = Sim.all
	end

	def gallery
		@sim = Sim.find(params[:id])
	end

	def videos
		@videos = Vid.all
	end

	def pictures
		@pictures = Pic.all
	end

end
