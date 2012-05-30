module Admin
  class VwsController < Admin::BaseController

    crudify :vw,
            :title_attribute => 'naam', :xhr_paging => true

  end
end
