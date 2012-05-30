require 'refinerycms-base'

module Refinery
  module Volvos

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "volvos"
          plugin.pathname = root
          plugin.activity = {
            :class => Volvo,
            :title => 'naam'
          }
        end
      end
    end
  end
end
