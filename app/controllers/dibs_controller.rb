class DibsController < ApplicationController
  def index
    @dibs=Dib.paginate(page: params[:page], per_page: 5)
    if !logged_in?
      redirect_to root_path
      flash[:danger] = "You must be logged in to view these dibs!"
    end
  end

  def show
    @dib = Dib.friendly.find(params[:id])
    if !logged_in?
      redirect_to root_path
      flash[:danger] = "You must be logged in to view this dib!"
    end
  end

  def new
    @dib = Dib.new
  end

  def create
    @dib = Dib.new(dib_params)
    @dib.dibber = current_user

    if @dib.save
      flash[:success] = "You called your dib successfully"
      redirect_to dibs_path

    else
      render :new
    end
  end

  def edit
    @dib= Dib.friendly.find(params[:id])
    if @dib.dibber != current_user
      redirect_to dib_path(@dib)
      flash[:danger] = "You do not have permission to edit this dib!"
    end
  end

  def update
    @dib=Dib.friendly.find(params[:id])
    if  @dib.update(dib_params)
      flash[:success] = "Your dib was edited successfully!"
      redirect_to dib_path(@dib)
    else
      render :edit
    end
  end

  def destroy
    @dib=Dib.friendly.find(params[:id])
    @dib.destroy
    if @dib.destroy
      flash[:success] = "Your dib was deleted successfully!"
      redirect_to dibs_path
    else
      render :index
    end
  end

  private
  def dib_params
    params.require(:dib).permit(:name, :note, :picture)
  end

end
