ActiveAdmin.register Team do
  menu label: 'Команды', parent: 'Команды'

  index do
    column :id
    column :title
    column :slug
    column :owner
    actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
