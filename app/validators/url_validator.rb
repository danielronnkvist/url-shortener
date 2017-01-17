class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    uri = URI.parse(value)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    record.errors[attribute] << "Invalid URL"
  rescue URI::InvalidURIError
    record.errors[attribute] << "Invalid URL"
  end
end
