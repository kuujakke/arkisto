ActiveAdmin.register User do
  menu priority: 2
  index do
    column :email do |user|
      link_to user.email, admin_user_path(user)
    end
    column :last_sign_in_at
    column :last_sign_in_ip
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :moderator, :label => "Moderator"
    end
    f.buttons
  end
  create_or_edit = Proc.new {
    @user            = User.find_or_create_by_id(params[:id])
    @user.moderator = params[:user][:moderator]
    @user.attributes = params[:user].delete_if do |k, v|
      (k == "moderator") ||
          (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
    end
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit
end