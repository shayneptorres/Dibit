class LoginsController < ApplicationController
  def new
  end

  def create
    dibber = Dibber.find_by(email: params[:email])
    if dibber && dibber.authenticate(params[:password])
      session[:dibber_id] = dibber.id
      flash[:success] = "You have successfully logged in!"
      redirect_to dibs_path

    else
      flash.now[:danger] = "Your email adress or password do not match!"
      render "new"
    end
  end

  def destroy
    session[:dibber_id] = nil
    flash[:success] = "You have successfully logged out!"
    redirect_to login_path
  end
end
