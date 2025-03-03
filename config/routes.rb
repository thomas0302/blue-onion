Rails.application.routes.draw do
  get 'journal_entries', to: 'journal_entries#index'
end
