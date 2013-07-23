require 'thor/group'

module SeedScatter
  class Harvester < Thor::Group
    include Thor::Actions

    def init(model)
      models = if model == :all
                 Dir['app/models/*.rb'].map {|f| File.basename(f, '.*').camelize.constantize }
               else
                 [model.camelize.constantize]
               end
      models.each do |m|
        @model = m
        puts "Harvesting seeds for #{class_name}"
        @harvest_data = []
        dump_model(m)
      end
    end

    def reseed(model)
      @model = m = model.camelize.constantize
      truncate(m.table_name)
      f = File.expand_path(File.join("db","seeds","#{m.table_name}.rb"))
      puts "Reseeding #{f}"
      load(f)
    end

    def truncate(table)
      ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
    end

    def collect_data(model)
      model.all.each do |m|
        @harvest_data << ActiveSupport::JSON.decode(m.attributes.to_json).symbolize_keys
      end
    end

    def dump_model(model)
      collect_data(model)
      template "seed.erb", destination_path(model), force: true
    end

    def self.source_root(path=nil)
      File.expand_path(File.join(File.dirname(__FILE__), '..', 'generators', 'templates'))
    end

    def class_name
      @model.name
    end

    def destination_path(model)
      "db/seeds/#{model.table_name}.rb"
    end
  end

end
