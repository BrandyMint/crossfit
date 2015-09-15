ActiveAdmin.register User do
  decorate_with UserDecorator

  index do
    column :avatar
    column :nick
    column :phone
    column :full_name
    column :email
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs 'Атрибуты' do
      f.input :full_name
      f.input :nick
      f.input :phone
      f.input :email
      f.input :pin
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
