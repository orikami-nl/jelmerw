module Admin
  class MazdasController < Admin::BaseController

    crudify :mazda,
            :title_attribute => 'naam', :xhr_paging => true

  end
end
