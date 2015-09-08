class DibsController < ApplicationController
  def index
    @dibs=Dib.paginate(page: params[:page], per_page: 5)
  end

  def show
    @dib = Dib.find(params[:id])
  end

  def new
    @dib = Dib.new
  end

  def create
    @dib = Dib.new(dib_params)
    @dib.dibber = Dibber.find(1)

    if @dib.save
      flash[:success] = "You called your dib successfully"
      redirect_to dibs_path

    else
      render :new
    end

  end

  def edit
    @dib=Dib.find(params[:id])
  end

  def update
    @dib=Dib.find(params[:id])
    if  @dib.update(dib_params)
      flash[:success] = "Your dib was edited successfully!"
      redirect_to dib_path(@dib)
    else
      render :edit
    end
  end

  private
  def dib_params
    params.require(:dib).permit(:name, :note, :picture)
  end

end
