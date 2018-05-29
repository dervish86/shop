class UrlValidator < ActiveModel::EachValidator
  ALLOW_SCHEME = %w(http https)

  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || 'must be a valid URL') unless url_valid?(value)
  end

  def url_valid?(url)
    uri = URI.parse(url) rescue false

    ALLOW_SCHEME.include?(uri.scheme) && uri.host.present?
  end
end
