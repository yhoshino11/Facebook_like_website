class AddBitBucketToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :bitbucket, :string
  end
end
