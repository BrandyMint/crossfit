ActiveAdmin.register Membership do
  menu label: 'Участники', parent: 'Команды'

  controller do
    def permitted_params
      params.permit!
    end
  end
end
