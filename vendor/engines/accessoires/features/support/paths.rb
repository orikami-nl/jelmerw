module NavigationHelpers
  module Refinery
    module Accessoires
      def path_to(page_name)
        case page_name
        when /the list of accessoires/
          admin_accessoires_path

         when /the new accessoire form/
          new_admin_accessoire_path
        else
          nil
        end
      end
    end
  end
end
