class MindpinHTMLDiff
  class << self
    include HTMLDiff
  end
end

module KnowledgeNetPlanStore
  class Plan
    belongs_to :net,
               :class_name => "KnowledgeNetStore::Net"
  end

  class Tutorial
    has_and_belongs_to_many :points,
                            :class_name => "KnowledgeNetStore::Point"
  end
end

# -----------------------------------------
# virtual_file_system 相关
module FileEntityVFSModule
  def get_uri(store_id)
    {
      :type => :disk,
      :value => FilePartUpload::FileEntity.find(store_id).attach.path
    }
  end

  def file_info(store_id)
    fe = FilePartUpload::FileEntity.find(store_id)
    {
      :size => fe.attach.size,
      :mime_type => fe.attach.content_type, # MIME TYPE
      :mime_type_info => {}
    }
  end
end

VirtualFileSystem.config do 
  bucket :knowledge_net, :store => :file_entity
end

VirtualFileSystem::File.send :belongs_to,
                             :net,
                             :class_name => "KnowledgeNetStore::Net"

VirtualFileSystem::File.send :field,
                             :visible_name,
                             :type => String
 

KnowledgeNetStore::Net.send :has_many,
                            :virtual_files,
                            :class_name => "VirtualFileSystem::File"

User.send :has_many,
          :virtual_files,
          :class_name => "VirtualFileSystem::File",
          :foreign_key => :creator_id

def randstr(length=8)
  base = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  size = base.size
  re = '' << base[rand(size-10)]
  (length - 1).times {
    re << base[rand(size)]
  }
  re
end

def get_virtual_filename(filename)
  filename = filename.to_s
  return "" if filename.blank?
  arr = filename.split(".")
  return "#{filename}-#{randstr(32)}" if arr.count == 1

  extname = arr.pop
  return "#{arr*"."}-#{randstr(32)}.#{extname}"
end

require_relative 'r'
FilePartUpload.config do
  path File.join(R::UPLOAD_FILE_BASE_PATH, "files/:id/file/:name")
  url "/#{R::STATIC_FILE_URL_PREFIX}/files/:id/file/:name"
end

module FilePartUpload
  class FileEntity
    field :identifier, :type => String
    index({:identifier => 1})
  end
end

# ---------------------------------------

module DocumentsStore
  class Document
    belongs_to :creator,
               :class_name => "User",
               :foreign_key => :creator_id

    belongs_to :last_editor,
               :class_name => "User",
               :foreign_key => :last_editor_id

    belongs_to :net,
               :class_name  => "KnowledgeNetStore::Net",
               :foreign_key => :net_id

    default_scope -> {
      order_by :updated_at => :desc
    }

    before_validation :_set_default_title
    def _set_default_title
      self.title = "无题 #{Time.now.to_s(:db)}" if self.title.blank?
    end

    # 恢复到指定版本
    # version_obj 是对象，不是编号
    # editor 需要传入 current_user
    def restore_version(version_obj, editor)
      self.title = version_obj.title
      self.content = version_obj.content
      self.last_editor = editor
      self.save
    end
  end
end

module KnowledgeNetStore
  class Net
    has_many :documents,
             :class_name => "DocumentsStore::Document"

    has_many :plans,
             :class_name => "KnowledgeNetPlanStore::Plan"
  end
end