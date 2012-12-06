module Ecm
  module Assets
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc "Copies the locale files to your application"

        source_root File.expand_path('../../../../../../config/locales', __FILE__)
        
        def generate_locales
          copy_file "ecm.assets.en.yml", "config/locales/ecm.assets.en.yml"
          copy_file "ecm.assets.de.yml", "config/locales/ecm.assets.de.yml"
        end   
      end
    end
  end
end        
