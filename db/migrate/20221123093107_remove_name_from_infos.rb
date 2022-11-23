class RemoveNameFromInfos < ActiveRecord::Migration[6.0]
  def change
    remove_column :infos, :name, :string
  end
end
