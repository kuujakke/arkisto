ActiveAdmin.register Picture do
  menu priority: 1
  permit_params :file
  batch_action :update_similarities do |ids|
    batch_action_collection.find(ids).each do |picture|
      picture.update_similar
    end
    redirect_to admin_pictures_path, notice: 'Similar pictures updated!'
  end
  member_action :update_similar, method: :put do
    resource.update_similar
    redirect_to resource_path, notice: 'Similar pictures updated!'
  end
  action_item :update_similar, only: :show do
    link_to "Update Similar", update_similar_admin_picture_path(resource), method: :put
  end
  form html: {multipart: true} do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Upload" do
      f.input :file
    end
    f.actions
  end
  index :as => :grid do |picture|
    div link_to(image_tag(picture.file.url(:thumbnail)), admin_picture_path(picture))
    resource_selection_cell picture
  end
  show do |picture|
    attributes_table do
      row :file_file_name
      row :source_url
      row :rating
      row :file_file_size
      row :created_at
      row :file_fingerprint
      row :file_fingerprint_bits
    end
    panel "Available sizes" do
      tabs do
        tab "Tiny" do
          image_tag resource.file.url(:tiny)
        end
        tab "Thumbnail" do
          image_tag resource.file.url(:thumbnail)
        end
        tab "Large" do
          image_tag resource.file.url(:large)
        end
        tab "Original" do
          image_tag resource.file.url(:original)
        end
      end
    end
    panel "Similar images" do
      table_for picture.similarities do
        column :picture do |similarity|
          link_to(image_tag(similarity.similar.file.url(:tiny)), admin_similarity_path(similarity))
        end
        column "Hamming distance:", :hamming
        column "Levenshtein distance:", :levenshtein
      end
    end
  end
end
