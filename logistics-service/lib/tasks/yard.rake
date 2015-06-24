namespace :yard do
  desc 'rake task to generate rest api documentation'
  task :generate_api => :environment do
    system("bundle exec yardoc --title 'Backend API' --plugin restful --query '@restful_api.text == \"1.0\"' --output-dir ./public/api_doc --markup markdown")
  end

  desc 'rake task to generate method level documentation'
  task :generate => :environment do
    system("bundle exec yardoc --title 'Backend Template'  --output-dir ./public/doc --markup markdown")
  end
end