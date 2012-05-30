module Admin
  class BmwsController < Admin::BaseController

    crudify :bmw,
            :title_attribute => 'naam', :xhr_paging => true

  end
end
