class AddStatusToArticles < ActiveRecord::Migration[5.2]
  def change
  	add_column :articles,:status,:string
  	add_column :articles,:status_two,:string
  end
end
