class PeugeotsController < ApplicationController

  before_filter :find_all_peugeots
  before_filter :find_page
 
  #before_filter :set_locale
 
  #def set_locale
  #  I18n.locale = params[:locale] || I18n.default_locale
  #end

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @peugeot in the line below:
    present(@page)
  end

  def show
    @peugeot = Peugeot.find(params[:id])
    render :layout => false
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @peugeot in the line below:
    present(@page)
  end

protected

  def find_all_peugeots
    @peugeots = Peugeot.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/peugeots").first
  end

end
