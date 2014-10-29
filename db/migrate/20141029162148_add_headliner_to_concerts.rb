class AddHeadlinerToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :headliner, :string
  end
end
