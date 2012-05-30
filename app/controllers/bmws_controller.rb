class BmwsController < ApplicationController

  before_filter :find_all_bmws
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @bmw in the line below:
    present(@page)
  end

  def show
    @bmw = Bmw.find(params[:id])
    render :layout => false
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @bmw in the line below:
    present(@page)
  end

protected

  def find_all_bmws
    @bmws = Bmw.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/bmws").first
  end

end
