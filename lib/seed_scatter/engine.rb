module SeedScatter
  class Engine < ::Rails::Engine
    paths["db/seeds.rb"] = Dir.glob("db/seeds/*.rb")
    def load_seed
      paths["db/seeds.rb"].each do |seed_file|
        puts seed_file
        load(seed_file)
        if ActiveRecord::Base.connection.adapter_nameeql?('PostgreSQL')
          table_name = seed_file.gsub(/\.rb$/,'')
          ActiveRecord::Base.connection.reset_pk_sequence!(table_name)
        end
      end

    end
  end
end
