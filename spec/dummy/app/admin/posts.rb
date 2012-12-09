ActiveAdmin.register Post do
  form do |f|
    f.inputs :html => { :enctype => "multipart/form-data" } do
      f.input :title
      f.input :body
    end

    f.inputs :for => [:video, f.object.video || Post::Video.new] do |v|
      v.input :attachment, :as => :file
    end

    f.inputs do
      f.has_many :images do |i|
        if i.object.persisted?
          i.input :_destroy, :as => :boolean, :label => I18n.t('active_admin.delete')
        end
        i.input :attachment, :as => :file
      end
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :created_at
      row :updated_at
    end

    panel Post.human_attribute_name(:body) do
      post.body
    end

    panel Post.human_attribute_name(:images) do
      table_for post.images do
        column :thumbnail do |image|
          image_tag image.url(:small)
        end
      end
    end
  end
end

