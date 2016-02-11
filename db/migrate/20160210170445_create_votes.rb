class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.integer :movie_id
      t.integer :upvotes
      t.integer :downvotes
      t.references :movie

      t.timestamps null: false
    end
    add_index :votes, :movie_id
  end
end
