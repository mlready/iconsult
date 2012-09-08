class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    consultant = Consultant.find_by_email(params[:session][:email].downcase)
    if consultant && consultant.authenticate(params[:session][:password])
      sign_in consultant
      redirect_to consultant
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end     
  end
  
  def destroy 
    sign_out
    redirect_to root_url   
  end
end
