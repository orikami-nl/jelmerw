class AddMerkToAll < ActiveRecord::Migration
  def self.up
    add_column :peugeots, :merk, :string
    add_column :mazdas, :merk, :string
    add_column :fords, :merk, :string
    add_column :audis, :merk, :string
    add_column :volvos, :merk, :string
    add_column :bmws, :merk, :string
  end

  def self.down
    remove_column :peugeots, :merk
    remove_column :mazdas, :merk
    remove_column :fords, :merk
    remove_column :audis, :merk
    remove_column :volvos, :merk
    remove_column :bmws, :merk
  end
end
