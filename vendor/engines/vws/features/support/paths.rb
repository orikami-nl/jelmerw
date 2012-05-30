module NavigationHelpers
  module Refinery
    module Vws
      def path_to(page_name)
        case page_name
        when /the list of vws/
          admin_vws_path

         when /the new vw form/
          new_admin_vw_path
        else
          nil
        end
      end
    end
  end
end
