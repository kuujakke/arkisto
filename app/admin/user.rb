ActiveAdmin.register User do
  menu priority: 2
  index do
    column :email do |user|
      link_to user.email, admin_user_path(user)
    end
    column :last_sign_in_at
    column :last_sign_in_ip
  end
end

