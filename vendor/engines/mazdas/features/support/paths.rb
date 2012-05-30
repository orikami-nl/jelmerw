module NavigationHelpers
  module Refinery
    module Mazdas
      def path_to(page_name)
        case page_name
        when /the list of mazdas/
          admin_mazdas_path

         when /the new mazda form/
          new_admin_mazda_path
        else
          nil
        end
      end
    end
  end
end
