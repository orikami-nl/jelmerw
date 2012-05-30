class CreateFords < ActiveRecord::Migration

  def self.up
    create_table :fords do |t|
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

    add_index :fords, :id

    load(Rails.root.join('db', 'seeds', 'fords.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "fords"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/fords"})
    end

    drop_table :fords
  end

end
