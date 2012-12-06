module Ecm
  module Links
    class Routing
      def self.routes(router, options = {})
        options.reverse_merge! {}

        # router.resources :posts, :controller => 'ecm/assets/posts'
      end
    end
  end
end

