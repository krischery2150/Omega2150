class CapsulesController < ApplicationController
  before_action :find_capsule, only: [:show, :edit, :update, :destroy]

  def index
    @capsules = Capsule.all.order("created_at DESC")
  end

  def new
    @capsule = Capsule.new
  end

  def create
    @capsule = Capsule.new(capsule_params)
    if @capsule.save
      redirect_to @capsule, notice: "Congratulations, you have successfully created your capsule"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if  @capsule.update(capsule_params)
      redirect_to @capsule, notice:" You have successfully updated your Capsule"
    else
      render 'edit'
    end
  end

  def destroy
    @capsule.destroy
    redirect_to root_path
    
  end

private

  def capsule_params
    params.require(:capsule).permit(:title, :about, :purpose)
  end

  def find_capsule
    @capsule = Capsule.find(params[:id])
  end

end
