class AccessoiresController < ApplicationController

  before_filter :find_all_accessoires
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @accessoire in the line below:
    present(@page)
  end

  def show
    @accessoire = Accessoire.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @accessoire in the line below:
    present(@page)
  end

protected

  def find_all_accessoires
    @accessoires = Accessoire.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/accessoires").first
  end

end
