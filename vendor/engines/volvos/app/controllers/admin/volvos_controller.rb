module Admin
  class VolvosController < Admin::BaseController

    crudify :volvo,
            :title_attribute => 'naam', :xhr_paging => true

  end
end
