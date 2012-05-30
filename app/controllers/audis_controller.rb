class AudisController < ApplicationController

  before_filter :find_all_audis
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @audi in the line below:
    present(@page)
  end

  def show
    @audi = Audi.find(params[:id])
    render :layout => false
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @audi in the line below:
    present(@page)
  end

protected

  def find_all_audis
    @audis = Audi.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/audis").first
  end

end
