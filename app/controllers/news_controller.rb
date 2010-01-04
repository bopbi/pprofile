class NewsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @news = News.all :order => 'id DESC'
    @news = @news.paginate :page => params[:page], :per_page => 5
    respond_to do |format|
      format.html
      format.atom { render :layout => false }
    end
  end
  
  def show
    @news = News.find(params[:id])
  end
  
  def new
    @news = News.new
  end
  
  def create
    @news = News.new(params[:news])
    if @news.save
      flash[:notice] = "Successfully created news."
      redirect_to news_instance_path(@news)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @news = News.find(params[:id])
  end
  
  def update
    @news = News.find(params[:id])
    if @news.update_attributes(params[:news])
      flash[:notice] = "Successfully updated news."
      redirect_to news_instance_path(@news)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @news = News.find(params[:id])
    @news.destroy
    flash[:notice] = "Successfully destroyed news."
    redirect_to news_url
  end
end
