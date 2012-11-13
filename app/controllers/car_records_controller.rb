#encoding: utf-8
class CarRecordsController < ApplicationController
  require 'spreadsheet'
  
  def receive_info
    CarRecord.create(:car_type => params[:car_type], :user_area => params[:user_area],
      :user_name => params[:user_name], :user_phone => params[:user_phone=],
      :small_type => params[:small_type], :buy_year => params[:buy_year])
    render :inline=>"response_info({'message':'提交成功'})"
  end

  def download_info
    root_url="#{Rails.root}/public/records"
    filename="/LanTai_data_#{Time.now.strftime("%Y%m%d%H%M%s").to_s}.xls"
    url=root_url+filename
    unless File.directory?(root_url)               #判断dir目录是否存在，不存在则创建 下3行
      Dir.mkdir(root_url)
    end
    unless File.exist?(url)
      Spreadsheet.client_encoding = "UTF-8"
      book = Spreadsheet::Workbook.new
      sheet = book.create_worksheet
      sheet.row(0).concat %w{编号 姓名 车型  购买年份 区域分布 提交日期}
      cars=CarRecord.find :all
      cars.each_with_index do |car, index|

        sheet.row(index+1).concat ["#{car.id}","#{car.user_name}", "#{CarRecord::CAR_TYPES[car.car_type]}#{car.small_type}",car.buy_year,car.user_area,car.created_at.strftime("%Y-%m-%d %H:%M")]
      end
      sheet.row(cars.size+1).concat ["总计", "#{cars.size}"]
      book.write url
    end
    render :inline => "<script>window.location.href='/records/#{filename}';setTimeout(function(){window.close();},30000)</script>"
  end

end
