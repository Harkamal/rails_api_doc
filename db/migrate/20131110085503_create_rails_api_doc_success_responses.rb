class CreateRailsApiDocSuccessResponses < ActiveRecord::Migration
  def change
    create_table :rails_api_doc_success_responses do |t|
      t.text :success_structure
      t.integer :api_id

      t.timestamps
    end
  end
end
