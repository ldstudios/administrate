require "rails/generators/base"
require "administrate/generator_helpers"

module Administrate
  class ViewGenerator < Rails::Generators::Base
    include Administrate::GeneratorHelpers

    private

    def self.template_source_path
      File.expand_path(
        "../../../app/views/administrate/application",
        __FILE__,
      )
    end

    def copy_resource_template(template_name)
      file_type = Rails.application.config.generators.options[:rails][:template_engine] == :slim ? 'slim' : 'erb'
      template_file = "#{template_name}.html.#{ file_type }"

      copy_file(
        template_file,
        "app/views/admin/#{resource_path}/#{template_file}",
      )
    end

    def resource_path
      args.first.try(:underscore).try(:pluralize) || "application"
    end
  end
end
