class CreatePosts < ActiveRecord::Migration
	def change
		create_table :posts do |t|
			t.text :body, null: false
			t.string :token
			t.belongs_to :category
			t.timestamps
		end
	end
end
