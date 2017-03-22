ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Pictures" do
          ul do
            # Picture.recent(5).map do |picture|
            Picture.all do |picture|
              li link_to(picture.title, picture_path(picture))
            end
          end
        end
      end

      columns do
        column do
          panel "Recent Users" do
            ul do
              # User.recent(5).map do |picture|
              User.all do |user|
                li link_to(user, user_path(user))
              end
            end
          end
        end

        column do
          panel "Info" do
            para "Welcome to ActiveAdmin."
          end
        end
      end
    end
  end
end