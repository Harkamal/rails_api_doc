class CreateRailsApiDocParameters < ActiveRecord::Migration
  def change
    create_table :rails_api_doc_parameters do |t|
      t.string :name
      t.string :param_type
      t.string :note
      t.integer :api_id

      t.timestamps
    end
  end
end
