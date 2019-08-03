module ApplicationHelper
  def error_message_for(obj, name)
    if obj && obj.errors.any?
      result = ''
      obj.errors.full_messages_for(name).each do |message|
        result += '<div class="field_with_errors">'
        result += message 
        result += '</div>'
      end 
    end
    raw result if result.present?
  end

  def hash_text(id, hash)
    text_hash = Hash[hash]
    return text_hash.invert[id]
  end
end
