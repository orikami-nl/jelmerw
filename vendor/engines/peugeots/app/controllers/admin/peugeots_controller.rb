module Admin
  class PeugeotsController < Admin::BaseController

    crudify :peugeot,
            :title_attribute => 'naam', :xhr_paging => true

  end
end
