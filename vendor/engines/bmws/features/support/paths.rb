module NavigationHelpers
  module Refinery
    module Bmws
      def path_to(page_name)
        case page_name
        when /the list of bmws/
          admin_bmws_path

         when /the new bmw form/
          new_admin_bmw_path
        else
          nil
        end
      end
    end
  end
end
