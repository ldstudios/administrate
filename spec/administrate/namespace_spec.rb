require "rails_helper"
require "administrate/namespace"

describe Administrate::Namespace do
  describe "#resources" do
    it "searches the routes for resources in the namespace" do
      begin
        namespace = Administrate::Namespace.new(:admin)
        Rails.application.routes.draw do
          namespace(:admin) { resources :customers }
        end

        expect(namespace.resources).to eq [:customers]
      ensure
        reset_routes
      end
    end
  end

  describe "#models" do
    it "searches the routes for ActiveRecord models in the namespace" do
      begin
        namespace = Administrate::Namespace.new(:admin)
        Rails.application.routes.draw do
          namespace(:admin) { resources :customers }
        end

        expect(namespace.models).to eq [::Customer]
      ensure
        reset_routes
      end
    end
  end
end
