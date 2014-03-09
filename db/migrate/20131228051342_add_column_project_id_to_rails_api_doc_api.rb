class AddColumnProjectIdToRailsApiDocApi < ActiveRecord::Migration
  def change
    add_column :rails_api_doc_apis, :project_id, :integer
  end
end
