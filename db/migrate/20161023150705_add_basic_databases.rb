class AddBasicDatabases < ActiveRecord::Migration
  def change
    create_table "body" do |t|
      t.integer  "fat"
      t.decimal  "weight", precision: 5, scale: 2
      t.date     "date"
      t.string   "memo"
    end
    add_index "body", "date"

    create_table "workout" do |t|
      t.integer "aerobic"   ,:limit => 1, :default => 0 # 有氧
      t.integer "chest"     ,:limit => 1, :default => 0 # 胸
      t.integer "shoulder"  ,:limit => 1, :default => 0 # 肩
      t.integer "back"      ,:limit => 1, :default => 0 # 背
      t.integer "arm"       ,:limit => 1, :default => 0 # 手臂
      t.integer "thigh"     ,:limit => 1, :default => 0 # 大腿 
      t.integer "shank"     ,:limit => 1, :default => 0 # 小腿 
      t.date    "date"      ,:null => false
      t.string  "memo"
    end
    add_index "workout", "date"
  end
end
