class CreateRailsApiDocFailureResponses < ActiveRecord::Migration
  def change
    create_table :rails_api_doc_failure_responses do |t|
      t.string :note
      t.text :failure_structure
      t.integer :api_id

      t.timestamps
    end
  end
end
