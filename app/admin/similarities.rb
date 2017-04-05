ActiveAdmin.register Similarity do
  menu priority:3
  config.sort_order = 'hamming'
  member_action :similarities do
    @similarities = resource.similarities
  end
  index do
    selectable_column
    column :picture do |similarity|
      link_to(image_tag(similarity.picture.file.url(:tiny)), admin_picture_path(similarity.picture))
    end
    column :similar do |similarity|
      link_to(image_tag(similarity.similar.file.url(:tiny)), admin_picture_path(similarity.similar))
    end
    column :hamming
    column :levenshtein
  end
  show do
    attributes_table do
      row :picture
      row :similar
      row :picture_fingerprint do
        resource.picture.file_fingerprint
      end
      row :similar_fingerprint do
        resource.similar.file_fingerprint
      end
      row :hamming
      row :levenshtein
    end
    panel "Comparison" do
      columns do
        column do
          link_to(image_tag(resource.picture.file.url(:thumbnail)), admin_picture_path(resource.picture))
        end
        column do
          link_to(image_tag(resource.similar.file.url(:thumbnail)), admin_picture_path(resource.similar))
        end
      end
    end
  end
end