class AddColumnNoteToRailsApiDocSuccessResponse < ActiveRecord::Migration
  def change
    add_column :rails_api_doc_success_responses, :note, :string
  end
end
