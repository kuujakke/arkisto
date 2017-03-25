ActiveAdmin.register Picture do
  menu priority: 1
  permit_params :file
  form html: {multipart: true} do |f|
    f.inputs "Upload" do
      f.input :file
    end
    f.actions
  end
  index as: :grid do |picture|
    link_to image_tag(picture.file.url(:tiny)), admin_picture_path(picture)
  end
  show do
    attributes_table do
      row :file_file_name
      row :source_url
      row :rating
      row :file_file_size
      row :created_at
    end
    panel "Available sizes" do
      tabs do
        tab "Tiny" do
          image_tag picture.file.url(:tiny)
        end
        tab "Thumbnail" do
          image_tag picture.file.url(:thumbnail)
        end
        tab "Large" do
          image_tag picture.file.url(:large)
        end
        tab "Original" do
          image_tag picture.file.url(:original)
        end
      end
    end
  end
end