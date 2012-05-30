module Admin
  class FordsController < Admin::BaseController

    crudify :ford,
            :title_attribute => 'naam', :xhr_paging => true

  end
end
