module RailsApiDoc
  class Api < ActiveRecord::Base
    attr_accessible :api_group, :name, :request_type, :url, :version, :parameters_attributes
    has_many :parameters, :class_name => "RailsApiDoc::Parameter", dependent: :destroy
    accepts_nested_attributes_for :parameters, :allow_destroy => true, :reject_if => :all_blank
  end
end
