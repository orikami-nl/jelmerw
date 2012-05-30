class ChangeTypeToNaam < ActiveRecord::Migration
  def self.up
    remove_column :peugeots, :type
    remove_column :mazdas, :type
    remove_column :fords, :type
    remove_column :audis, :type
    remove_column :volvos, :type
    remove_column :bmws, :type
  end

  def self.down
    add_column :peugeots, :naam
    add_column :mazdas, :naam
    add_column :fords, :naam
    add_column :audis, :naam
    add_column :volvos, :naam
    add_column :bmws, :naam
  end
end
