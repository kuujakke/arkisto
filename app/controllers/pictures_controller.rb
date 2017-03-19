class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.create(picture_params)
  end

  def picture_params
    params.require(:picture).permit(:file, :source_url)
  end

end
