#encoding: utf-8
class CreateLinkLists < ActiveRecord::Migration
  def self.up

    create_table :link_lists do |t|
      t.references :shop       , comment: '所属商店'
      t.string :title          , comment: '名称'
      t.string :handle         , comment: '用于模板中的Permalink/Handle'
      t.boolean :system_default, comment: '是否为系统默认链接列表'      , default: false

      t.timestamps
    end

    create_table :links do |t|
      t.integer :link_list_id , comment:  '关联的链接列表id'
      t.string :title         , comment:  '链接名称'
      t.string :link_type     , comment:  '链接类型，从LinkType实体中取值'
      t.string :subject_handle, comment:  '博客、页面、产品等的handle'
      t.string :subject_params, comment:  '商品集合类型的额外参数'
      t.string :url           , comment:  '其他网站类型的url地址'
      t.integer :position     , comment:  '排序序号'

      t.timestamps
    end

    add_index :link_lists, :shop_id
    add_index :links     , :link_list_id

  end

  def self.down
    drop_table :links
    drop_table :link_lists
  end
end
