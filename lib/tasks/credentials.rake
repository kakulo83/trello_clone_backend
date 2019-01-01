namespace :credentials do
  desc "Thin wrapper to edit credentials file"
  task edit: :environment do
    sh "EDITOR=vi bin/rails credentials:edit"
  end
end
