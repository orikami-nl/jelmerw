class VolvosController < ApplicationController

  before_filter :find_all_volvos
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @volvo in the line below:
    present(@page)
  end

  def show
    @volvo = Volvo.find(params[:id])
    render :layout => false
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @volvo in the line below:
    present(@page)
  end

protected

  def find_all_volvos
    @volvos = Volvo.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/volvos").first
  end

end
