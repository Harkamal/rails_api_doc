module RailsApiDoc
  class FailureResponse < ActiveRecord::Base
    attr_accessible :api_id, :failure_structure, :note
    belongs_to :api
    validates_presence_of :failure_structure
    validates_presence_of :note
  end
end
