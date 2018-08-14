require 'logstasher'

LogStasher.add_custom_fields do |fields|
  fields[:govuk_content_pages_variant] = request.headers["GOVUK-ABTest-ContentPagesNav"]
end
