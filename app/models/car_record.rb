#encoding: utf-8
class CarRecord < ActiveRecord::Base
  CAR_TYPES = { 1 => "JEEP", 2 => "MINI", 3 => "奥迪", 4 => "宝马", 5 => "保时捷", 6 => "奔驰", 7 => "本田", 8 => "大众",
    9 => "丰田", 10 => "捷豹", 11 => "凯迪拉克", 12 => "雷克萨斯", 13 => "林肯", 14 => "路虎", 15 => "讴歌", 16 => "沃尔沃",
    17 => "英菲尼迪"}
end
