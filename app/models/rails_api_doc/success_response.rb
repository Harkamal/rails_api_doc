module RailsApiDoc
  class SuccessResponse < ActiveRecord::Base
    attr_accessible :api_id, :success_structure, :note
    belongs_to :api
    validates_presence_of :success_structure
    validates_presence_of :note
  end
end
