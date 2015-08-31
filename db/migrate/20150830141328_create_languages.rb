class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.boolean :learned
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
