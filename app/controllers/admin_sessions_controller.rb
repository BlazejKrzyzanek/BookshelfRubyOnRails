class AdminSessionsController < ApplicationController
    def new
      @admin_session = AdminSession.new
    end
  
    def create
      @admin_session = AdminSession.new(admin_params.to_h)
      if @admin_session.save
        flash[:notice] = "Login successful!"
        redirect_to books_path
      else
        flash[:notice] = "Login was not successful!"
        render :action => :new
      end
    end
  
    def destroy
      current_admin_session.destroy
      flash[:notice] = "Logout successful!"
      redirect_to books_path
    end
  
    private
  
    def admin_params
      params.require(:admin_session).permit(:login, :password)
    end
  end