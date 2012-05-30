class AddSubjectToInquiries < ActiveRecord::Migration
  def self.up
    add_column :inquiries, :subject, :string
  end

  def self.down
    add_column :inquiries, :subject
  end
end
