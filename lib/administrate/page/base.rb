module Administrate
  module Page
    class Base
      def initialize(dashboard, options = {})
        @dashboard = dashboard
        @options = options
      end

      def resource_name
        @resource_name ||=
          resource.model_name.singular
      end

      def resource_model_name
        @resource_model_name ||=
          dashboard.class.to_s.split('Dashboard').first.classify.constantize.model_name
      end

      def resource
        @resource ||=
          dashboard.class.to_s.split('Dashboard').first.classify.constantize
      end

      protected

      def attribute_field(dashboard, _resource, attribute_name, page)
        value = get_attribute_value(_resource, attribute_name)
        field = dashboard.attribute_type_for(attribute_name)
        field.new(attribute_name, value, page)
      end

      def get_attribute_value(_resource, attribute_name)
        _resource.public_send(attribute_name)
      rescue NameError
        nil
      end

      attr_reader :dashboard, :options
    end
  end
end
