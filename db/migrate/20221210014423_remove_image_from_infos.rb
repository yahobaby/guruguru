class RemoveImageFromInfos < ActiveRecord::Migration[6.0]
  def change
    remove_column :infos, :Image, :text
  end
end
