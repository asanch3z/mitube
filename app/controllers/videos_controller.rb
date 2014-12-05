class VideosController < ApplicationController
  def index
  	@videos = Video.order('created_at DESC')
  	render 'index'
  end

  def new
  	@video = Video.new
  	render 'new'
	end

	def create
	  @video = Video.new(video_params)
	  if @video.save
	    flash[:success] = 'Video added!'
	    redirect_to root_url
	  else
	    render 'new'
	  end
	end

	def show
    @video = Video.find(params[:id])
    render 'show'
  end

	def video_params
	  params.require(:video).permit(:link)
	end
	
end