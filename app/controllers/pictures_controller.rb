class PicturesController < InheritedResources::Base
  respond_to :html

  def create
    create!
  end

  def permitted_params
    params.require(:picture).permit(:file)
  end
end
