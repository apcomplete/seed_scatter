module SeedScatter
  class Engine < ::Rails::Engine
    paths["db/seeds.rb"] = Dir.glob("db/seeds/*.rb")
    def load_seed
      paths["db/seeds.rb"].each do |seed_file|
        puts seed_file
        load(seed_file)
      end
    end
  end
end
