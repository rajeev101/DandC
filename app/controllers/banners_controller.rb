class BannersController < ApplicationController
	def index
		@banners = Banner.all
	end
end
