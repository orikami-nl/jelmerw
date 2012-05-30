module NavigationHelpers
  module Refinery
    module Peugeots
      def path_to(page_name)
        case page_name
        when /the list of peugeots/
          admin_peugeots_path

         when /the new peugeot form/
          new_admin_peugeot_path
        else
          nil
        end
      end
    end
  end
end
