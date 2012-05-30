class CreatePeugeots < ActiveRecord::Migration

  def self.up
    create_table :peugeots do |t|
      t.string :naam
      t.integer :grootte
      t.string :steek
      t.integer :et
      t.integer :breedte
      t.string :past
      t.string :spacer
      t.string :tevens
      t.integer :vanaf
      t.integer :afbeelding1_id
      t.integer :afbeelding2_id
      t.integer :afbeelding3_id
      t.integer :afbeelding4_id
      t.integer :position

      t.timestamps
    end

    add_index :peugeots, :id

    load(Rails.root.join('db', 'seeds', 'peugeots.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "peugeots"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/peugeots"})
    end

    drop_table :peugeots
  end

end
