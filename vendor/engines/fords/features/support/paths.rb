module NavigationHelpers
  module Refinery
    module Fords
      def path_to(page_name)
        case page_name
        when /the list of fords/
          admin_fords_path

         when /the new ford form/
          new_admin_ford_path
        else
          nil
        end
      end
    end
  end
end
