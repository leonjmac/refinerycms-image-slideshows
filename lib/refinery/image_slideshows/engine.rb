module Refinery
  module ImageSlideshows
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_image_slideshows

      before_inclusion do 
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinery_image_slideshows"
          plugin.menu_match = %r{refinery/(image_slides|image_slideshows)(/.+?)?$}
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.admin_image_slideshows_path }
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ImageSlideshows)
      end
    end
  end
end
