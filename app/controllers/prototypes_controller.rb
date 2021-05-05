class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    # if current_user.new(prototype_params)
    #   redirect_to_root_path
    # else
    #   render :new
    # end
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
       redirect_to root_path
    else
    render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:image, :title, :cath_copy, :concept).merge(user_id: current_user.id)
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
   unless current_user.id == @prototype.user_id
      redirect_to action: :index
   end
  end

end



# redirect_to root_path  unless current_user = @prototype.user