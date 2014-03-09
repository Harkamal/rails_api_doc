module RailsApiDoc
  class Api < ActiveRecord::Base
    attr_accessible :api_group, :name, :request_type, :url, :version, :parameters_attributes,
     								:success_responses_attributes, :failure_responses_attributes, :project_id
    has_many :parameters, :class_name => "RailsApiDoc::Parameter", dependent: :destroy
    has_many :success_responses, :class_name => "RailsApiDoc::SuccessResponse", dependent: :destroy
    has_many :failure_responses, :class_name => "RailsApiDoc::FailureResponse", dependent: :destroy
    belongs_to :project
    accepts_nested_attributes_for :parameters, :allow_destroy => true, :reject_if => :all_blank
    accepts_nested_attributes_for :success_responses, :allow_destroy => true, :reject_if => :all_blank
    accepts_nested_attributes_for :failure_responses, :allow_destroy => true, :reject_if => :all_blank
    DEFAULT_PAGE_SIZE = 10
  end
end
