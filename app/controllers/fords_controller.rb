class FordsController < ApplicationController

  before_filter :find_all_fords
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @ford in the line below:
    present(@page)
  end

  def show
    @ford = Ford.find(params[:id])
    render :layout => false
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @ford in the line below:
    present(@page)
  end

protected

  def find_all_fords
    @fords = Ford.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/fords").first
  end

end
