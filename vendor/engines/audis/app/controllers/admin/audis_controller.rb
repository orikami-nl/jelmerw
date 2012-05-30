module Admin
  class AudisController < Admin::BaseController

    crudify :audi,
            :title_attribute => 'naam', :xhr_paging => true

  end
end
