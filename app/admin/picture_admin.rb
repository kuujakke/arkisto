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
    image_tag picture.file.url(:tiny)
    image_tag picture.file.url(:thumbnail)
    image_tag picture.file.url(:large)
    image_tag picture.file.url(:original)
  end
end
