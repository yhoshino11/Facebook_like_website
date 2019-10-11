class AddBitBucketToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :bitbucket, :string
  end
end
