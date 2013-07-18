namespace :db do
  task :seed => :environment do
    SeedScatter::Engine.load_seed
  end
end
