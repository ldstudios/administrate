require "administrate/view_generator"

module Administrate
  module Generators
    module Views
      class LayoutGenerator < Administrate::ViewGenerator
        source_root template_source_path

        def copy_template
          file_type = Rails.application.config.generators.options[:rails][:template_engine] == :slim ? 'slim' : 'erb'
          copy_file(
            "../../layouts/administrate/application.html.#{ file_type }",
            "app/views/layouts/admin/application.html.#{ file_type }",
          )

          call_generator("administrate:views:sidebar")
          copy_resource_template("_javascript")
          copy_resource_template("_flashes")
        end
      end
    end
  end
end
