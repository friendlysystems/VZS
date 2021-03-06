# -*- encoding : utf-8 -*-
if Rails.env == 'production' then
  CURRENT_VERSION=`git describe --tags`.strip
else
  CURRENT_VERSION=`git rev-parse HEAD`.strip
end 

begin
  REVISION = File.read("#{Rails.root}/REVISION").strip.to_s
rescue
  REVISION = "development"
end
