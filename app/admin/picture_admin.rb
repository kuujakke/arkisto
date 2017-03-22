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
    a href: admin_picture_path(picture)
    img src: picture.file.url(:tiny)
  end
  show do
    image_tag picture.file.url(:tiny)
    image_tag picture.file.url(:thumbnail)
    image_tag picture.file.url(:large)
    image_tag picture.file.url(:original)
  end
end
