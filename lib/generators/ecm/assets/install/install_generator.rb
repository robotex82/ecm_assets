module Ecm
  module Assets
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Generates the intializer"

        source_root File.expand_path('../templates', __FILE__) 
        
        def generate_intializer
          copy_file "ecm_assets.rb", "config/initializers/ecm_assets.rb"
        end   
      end
    end
  end
end        
