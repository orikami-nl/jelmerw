module NavigationHelpers
  module Refinery
    module Volvos
      def path_to(page_name)
        case page_name
        when /the list of volvos/
          admin_volvos_path

         when /the new volvo form/
          new_admin_volvo_path
        else
          nil
        end
      end
    end
  end
end
