ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Pictures" do
          Picture.all.each do |picture|
            a link_to image_tag(picture.file.url(:tiny)), admin_picture_path(picture)
          end
        end
      end
    end

    columns do
      column do
        panel "Recent Users" do
          ul do
            User.all.each do |user|
              li link_to user.email, admin_admin_user_path(user)
            end
          end
        end
      end
    end
  end
end
