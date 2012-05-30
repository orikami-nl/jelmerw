module NavigationHelpers
  module Refinery
    module Audis
      def path_to(page_name)
        case page_name
        when /the list of audis/
          admin_audis_path

         when /the new audi form/
          new_admin_audi_path
        else
          nil
        end
      end
    end
  end
end
