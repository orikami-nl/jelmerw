class AddAfbeelding567ToAll < ActiveRecord::Migration
  CARTABLES = [:peugeots, :audis, :fords, :vws, :volvos, :bmws, :mazdas]

  def self.up
    CARTABLES.each do |t|
        add_column t, :afbeelding5_id, :integer
        add_column t, :afbeelding6_id, :integer
        add_column t, :afbeelding7_id, :integer
    end
  end

  def self.down
    CARTABLES.each do |t|
        remove_column t, :afbeelding5_id
        remove_column t, :afbeelding6_id
        remove_column t, :afbeelding7_id
    end
  end
end
