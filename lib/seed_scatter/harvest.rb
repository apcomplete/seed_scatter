require 'thor/group'

module SeedScatter
  class Harvester < Thor::Group
    include Thor::Actions

    def dump_model(model)
      @model = model.underscore.singularize
      @harvest_data = []
      write_to = "db/seeds/#{@model.downcase.pluralize}.rb"
      klass = @model.camelize.constantize
      klass.all.each do |m|
        @harvest_data << ActiveSupport::JSON.decode(m.attributes.to_json).symbolize_keys
      end
      template "seed.erb", write_to, force: true
    end

    def self.source_root(path=nil)
      File.expand_path(File.join(File.dirname(__FILE__), '..', 'generators', 'templates'))
    end

    def class_name
      @model.camelize
    end
  end

end
