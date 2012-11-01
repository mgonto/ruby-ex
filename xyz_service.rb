require 'digest/sha1'
require 'date'

module XYZService
          
  def self.xyz_filename(target)
    # File format:
    # [day of month zero-padded][three-letter prefix] \
    # _[kind]_[age_if_kind_personal]_[target.id] \
    # _[8 random chars]_[10 first chars of title].jpg
    truncated_title = target.title.gsub(/[^\[a-z\]]/i, '').downcase
    truncate_to = truncated_title.length > 9 ? 9 : truncated_title.length

    filename = "#{target.publish_on.strftime("%d")}#{target.xyz_category_prefix}_" +
    "#{target.kind.gsub("_", "")}#{"_%03d" % (target.age || 0) if target.personal?}" +
    "_#{target.id.to_s}_#{Digest::SHA1.hexdigest(rand(10000).to_s)[0,8]}_" +
    "#{truncated_title[0..(truncate_to)]}.jpg"
  end

end
