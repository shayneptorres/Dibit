class DibbersController < ApplicationController

  def new
    @dibber = Dibber.new
  end

  def create
    @dibber = Dibber.new(dibber_params)
    if @dibber.save
      flash[:success] = "You are now a Dibber, go dib stuff!"
      redirect_to dibs_path
    else
      render 'new'
    end
  end

  def edit
    @dibber = Dibber.find(params[:id])
  end

  def update
    @dibber = Dibber.find(params[:id])
    if @dibber.update(dibber_params)
      flash[:success] = "Your profile has been updated successfully! ;)"
      redirect_to dibs_path
    else
      render 'edit'
    end
  end

  def show
    @dibber = Dibber.find(params[:id])
    
  end

  private
  def dibber_params
    params.require(:dibber).permit(:name, :email, :password)
  end

end
