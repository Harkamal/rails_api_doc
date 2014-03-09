module RailsApiDoc
  class Project < ActiveRecord::Base
    attr_accessible :description, :name
    has_many :apis, :dependent => :destroy
    validates_presence_of :name
  end
end
