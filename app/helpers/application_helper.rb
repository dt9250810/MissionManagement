module ApplicationHelper
  def error_message_for(obj, name)
    if obj && obj.errors.any?
      result = ''
      obj.errors.full_messages_for(name).each do |message|
        result += message + ', '
      end 
    end
    raw result.chomp! ', ' if result.present?
  end
end
