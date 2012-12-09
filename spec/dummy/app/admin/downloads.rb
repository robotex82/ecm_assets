ActiveAdmin.register Download do
  form do |f|
    f.inputs :html => { :enctype => "multipart/form-data" } do
      f.input :name
      f.input :description
    end

    f.semantic_errors(:plain_file)

    f.inputs :for => [:plain_file, f.object.plain_file || Ecm::Assets::PlainFile.new] do |pf|
      pf.input :attachment, :as => :file
    end 

    f.actions
  end

  sidebar Download.human_attribute_name(:plain_file), :only => :show do
    link_to "Download", download.plain_file.url
  end
end
