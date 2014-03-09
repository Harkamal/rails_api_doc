module RailsApiDoc
  class Parameter < ActiveRecord::Base
    attr_accessible :api_id, :name, :note, :param_type
    belongs_to :api
    validates_presence_of :name, :param_type
  end
end
