ImmigrationMgmt::Application.routes.draw do


  root to: 'search#index'
  resources :employees
  resources :passports
  resources :visas
  resources :visa_types

  match 'employees' => 'employees#index', as: 'employees_home'
  match 'employees/:id/remove', to: 'employees#remove', as: 'remove_employee'
  match 'employees/:id', to: 'employees#show', as: 'show_employee'

  match 'passports' => 'passports#index', as: 'passports_home'
  match 'passports/:id/remove', to: 'passports#remove', as: 'remove_passport'
  match 'passports/:id', to: 'passports#show', as: 'show_passport'

  match 'visas' => 'visas#index', as: 'visas_home'
  match 'visas/:id/remove', to: 'visas#remove', as: 'remove_visa'
  match 'visas/:id', to: 'visas#show', as: 'show_visa'


  match 'visa_types' => 'visa_types#index', as: 'visa_types_home'
  match 'visa_types/:id/remove', to: 'visa_types#remove', as: 'remove_visa_type'

  match 'search' => 'search#index', as: 'search_employees'

end
