# coding: utf-8
source "http://ruby.taobao.org"

gem "rails", "4.1.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.0.0"

gem "jquery-rails"
gem "turbolinks"
gem "jbuilder", "~> 2.0"
gem "sdoc", "~> 0.4.0", :group => :doc
gem "spring", :group => :development

group :test do
  gem "rspec"
  gem "database_cleaner", "~> 1.2.0"
end

# -------------

gem "sass-rails", "~> 4.0.3"
gem "kaminari", "~> 0.15.1"
gem "haml"
gem "pry" # 加强的 irb
gem "mongoid", "~> 4.0.0.beta2"
gem "bson_ext"
gem 'cells', '~> 3.10.1' # 用于复用一些前端组件
gem "simple_form", "~> 3.0.2"
gem "unicorn"
gem "rest-client" # 简化 http 请求

# -------------

gem "mina",
    :github => "fushang318/mina",
    :tag => "v0.2.0fix"

gem "knowledge-net-plan-store",
    :github => "mindpin/knowledge-net-plan-store",
    :tag => "v0.0.2"

gem 'knowledge-net-store',
    :github => 'mindpin/knowledge-net-store',
    :tag => '0.0.5'

gem "generic_controller",
    :github => "mindpin/generic_controller",
    :tag => "v0.0.2"

gem "user-auth",
    :github => "mindpin/user-auth",
    :tag => "0.0.7"

# 文字文档持久化，以下两个 gem 是相关的
gem "mongoid-versioning", 
    :github => "simi/mongoid-versioning"

gem "documents-store",    
    :github => "mindpin/documents-store",
    :tag => "v0.0.2"

# 文件上传，用于用户头像逻辑
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
# carrierwave 用到的图片切割
gem "mini_magick", :require => false

# 虚拟文件夹
gem 'virtual_file_system',    
    :github => "mindpin/virtual-file",
    :tag => "v0.0.5"
# 支持分段上传的文件持久化
gem 'file-part-upload', 
  :git => 'git://github.com/mindpin/file-part-upload.git',
  :tag => '1.0.3'