class Admin::NavigationTypeController < ApplicationController
  
  def index
    @navigationTypes =NavigationType.find(:all)
  end  

  def new
    @navigationTypes  = NavigationType.new
  end
  
  def create
    @navigationTypeNew = NavigationType.new(params[:navigationTypeNew])
    if @navigationTypeNew.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def edit
   @navigationType = NavigationType.find(params[:id])    
  end
  
  def update
    @navigationTypeNew  = NavigationType.find(params[:id]) 
    if @navigationTypeNew.update_attributes(params[:navigationTypeNew])
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end
  
  def remove
    @navigationType = NavigationType.find(params[:id])
    @navigationType.destroy
    redirect_to :action => 'index'
  end
end