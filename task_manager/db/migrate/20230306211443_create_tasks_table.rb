class CreateTasksTable < ActiveRecord::Migration[6.1]
def up
  create_table :tasks do |t|
    t.string :title
    t.text :description
    t.boolean :completed, default: false
    t.timestamps
  end
end

def down
  drop_table :tasks
end
end



