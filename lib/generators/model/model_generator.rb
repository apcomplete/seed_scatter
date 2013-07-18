require 'generators/seed_scatter'

module SeedScatter
  module Generators
    class ModelGenerator < Base
      class_option :dir, :type => :string, :default => "db/seeds", :desc => "The directory where the seeds should go"
      hook_for :orm, required: true

      def seed_scatter_file
        template 'seed.erb', File.join(options[:dir], "#{table_name}.rb")
      end

    end
  end
end
