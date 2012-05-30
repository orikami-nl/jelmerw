module Admin
  class AccessoiresController < Admin::BaseController

    crudify :accessoire, :xhr_paging => true

  end
end
