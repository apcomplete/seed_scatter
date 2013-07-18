namespace :db do
  task :seed => :environment do
    SeedScatter::Engine.load_seed
  end
  desc "Dump model seeds"
  task :harvest, [:model] => :environment do |t,args|
    SeedScatter::Harvester.new.dump_model args[:model]
  end
end
