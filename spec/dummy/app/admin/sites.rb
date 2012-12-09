ActiveAdmin.register Site do
  form do |f|
    f.inputs :html => { :enctype => "multipart/form-data" } do
      f.input :name
    end

    f.inputs :for => [:logo, f.object.logo || Site::Logo.new] do |l|
      l.input :attachment, :as => :file
    end 

    f.actions
  end

  sidebar Site.human_attribute_name(:logo), :only => :show do
    image_tag site.logo.url
  end
end
