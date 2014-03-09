class CreateRailsApiDocProjects < ActiveRecord::Migration
  def change
    create_table :rails_api_doc_projects do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
