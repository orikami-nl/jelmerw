class CreateAccessoires < ActiveRecord::Migration

  def self.up
    create_table :accessoires do |t|
      t.string :title
      t.text :description
      t.integer :afbeelding1_id
      t.integer :afbeelding2_id
      t.integer :afbeelding3_id
      t.integer :afbeelding4_id
      t.integer :afbeelding5_id
      t.integer :afbeelding6_id
      t.integer :afbeelding7_id
      t.integer :position

      t.timestamps
    end

    add_index :accessoires, :id

    load(Rails.root.join('db', 'seeds', 'accessoires.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "accessoires"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/accessoires"})
    end

    drop_table :accessoires
  end

end
