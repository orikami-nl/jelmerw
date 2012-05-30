class MazdasController < ApplicationController

  before_filter :find_all_mazdas
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @mazda in the line below:
    present(@page)
  end

  def show
    @mazda = Mazda.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @mazda in the line below:
    present(@page)
  end

protected

  def find_all_mazdas
    @mazdas = Mazda.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/mazdas").first
  end

end
