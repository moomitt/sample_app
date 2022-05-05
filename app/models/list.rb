class List < ApplicationRecord
  has_one_attached :image         #ActiveStorageの使用を宣言（:imageカラムが追加されたかのように扱える）

  validates :title, presence: true    #対象データ:titleの存在:true（存在しなければならない）
  validates :body, presence: true     #対象データ:bodyの存在:true（存在しなければならない）
  validates :image, presence: true    #対象データ:imageの存在:true（存在しなければならない）
end
