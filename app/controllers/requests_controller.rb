class RequestsController < ApplicationController
  before_filter :authenticate_user! 
  
  def index
    @title = "Requests"
  end
  
  def show
     @request = Request.find(params[:id])
     @title = @user.name
   end
  
  def create
    @request  = Request.new(params[:request])
    @request.owner = current_user
    if @request.save
      flash[:success] = "Request created!"
      redirect_to @request
    else       
      render 'pages/home'
    end
  end
  
  def edit
    @title = "Edit request"
  end
  
  def update
    if @request.update_attributes(params[:request])
      flash[:success] = "Request updated."
      redirect_to @request
    else
      @title = "Edit request"
      render 'edit'
    end
  end

  def destroy
    @request.destroy
    redirect_back_or root_path
  end
end
