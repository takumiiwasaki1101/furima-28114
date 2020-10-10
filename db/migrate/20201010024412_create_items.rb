class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,            null:false
      # 商品一覧表示機能作成時のみitemモデルを一時的に簡略化
      # t.text       :detail,          null:false
      # t.integer    :category_id,     null:false
      # t.integer    :status_id,       null:false
      # t.integer    :cost_burden_id,  null:false
      # t.integer    :ship_from_id,    null:false
      # t.integer    :shipping_day_id, null:false
      t.text       :image
      t.integer    :price,           null:false
      
      # t.references :user,            null:false, foreign_key:true      
      t.timestamps
    end
  end
end
