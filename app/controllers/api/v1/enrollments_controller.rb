namespace :api do
  namespace :v1 do
    get '/courses', to: 'courses#index'
    get '/courses/:course_id/enrollments', to: 'enrollments#index'
  end

end