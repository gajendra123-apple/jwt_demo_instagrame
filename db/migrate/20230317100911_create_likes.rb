class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
    	t.boolean :likes
    	  t.belongs_to :user, foreign_key: true
    	    t.belongs_to :post, foreign_key: true
    	     t.belongs_to :comment, foreign_key: true


      t.timestamps
    end
  end
end
