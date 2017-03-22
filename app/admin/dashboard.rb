ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Pictures" do
          Picture.all.each do |picture|
            a href: admin_picture_path(picture)
            img src: picture.file.url(:tiny)
          end
        end
      end
    end

    columns do
      column do
        panel "Recent Users" do
          ul do
            User.all do |user|
              a href: admin_user_path(user)
            end
          end
        end
      end
    end
  end
end
