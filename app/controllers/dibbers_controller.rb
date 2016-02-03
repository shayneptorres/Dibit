class DibbersController < ApplicationController

  def new
    @dibber = Dibber.new
  end

  def index
    @dibbers=Dibber.paginate(page: params[:page], per_page: 6)
  end

  def create
    @dibber = Dibber.new(dibber_params)
    if @dibber.save
      flash[:success] = "You are now a Dibber, go dib stuff!"
      session[:dibber_id] = @dibber.id
      if @dibber.super_admin?
        flash[:success] = "You have Admin Powers, go do admin things!"
      end
      redirect_to me_path
    else
      render 'new'
    end
  end

  def edit
    @dibber = Dibber.friendly.find(params[:id])
    if @dibber != current_user
      redirect_to dibber_path(@dibber)
    end
  end

  def update
    @dibber = Dibber.friendly.find(params[:id])
    if @dibber.update(dibber_params)
      flash[:success] = "Your profile has been updated successfully! ;)"
      redirect_to dibs_path
    else
      render 'edit'
    end
  end

  def show
    @dibber = Dibber.friendly.find(params[:id])
    if !logged_in?
      redirect_to root_path
      flash[:danger] = "You must be logged in to view these dibbers!"
    end
  end

  def me
    @dibber = current_user
  end

  private
  def dibber_params
    params.require(:dibber).permit(:name, :email, :password, :super_admin_password)
  end

end
