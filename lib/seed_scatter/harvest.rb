require 'thor/group'

module SeedScatter
  class Harvester < Thor::Group
    include Thor::Actions

    def init(model)
      models = if model == :all
                 Dir['app/models/*.rb'].map {|f| File.basename(f, '.*').camelize.constantize.name }
               else
                 [model]
               end
      models.each do |m|
        @model = m.underscore.singularize
        puts "Harvesting seeds for #{class_name}"
        @harvest_data = []
        dump_model(m)
      end
    end

    def collect_data(model)
      klass = model.camelize.constantize
      klass.all.each do |m|
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
      @model.camelize
    end

    def destination_path(model)
      "db/seeds/#{model.downcase.pluralize}.rb"
    end
  end

end
