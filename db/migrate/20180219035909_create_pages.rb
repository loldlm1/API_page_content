class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.jsonb :content, default: '{}'

      t.timestamps
    end
  end
end
