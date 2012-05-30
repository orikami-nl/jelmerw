class VwsController < ApplicationController

  before_filter :find_all_vws
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @vw in the line below:
    present(@page)
  end

  def show
    @vw = Vw.find(params[:id])
    render :layout => false
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @vw in the line below:
    present(@page)
  end

protected

  def find_all_vws
    @vws = Vw.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/vws").first
  end

end
