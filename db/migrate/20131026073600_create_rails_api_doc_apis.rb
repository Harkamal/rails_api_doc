class CreateRailsApiDocApis < ActiveRecord::Migration
  def change
    create_table :rails_api_doc_apis do |t|
      t.string :name
      t.string :url
      t.string :version
      t.string :request_type
      t.string :api_group

      t.timestamps
    end
  end
end
