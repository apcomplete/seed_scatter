module SeedScatter
  class Railtie < ::Rails::Railtie

    generators do
      require 'rails/generators/rails/model/model_generator'
      require 'rails/generators/rails/scaffold/scaffold_generator'
      Rails::Generators::ModelGenerator.send(:hook_for,:seed_scatter)
      Rails::Generators::ModelGenerator.send(:class_option, :seed_scatter, :default => 'seed_scatter')
      Rails::Generators::ScaffoldGenerator.send(:hook_for,:seed_scatter)
      Rails::Generators::ScaffoldGenerator.send(:class_option, :seed_scatter, :default => 'seed_scatter')
    end
  end
end
