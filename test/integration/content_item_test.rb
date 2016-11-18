require 'test_helper'

class ContentItemTest < ActionDispatch::IntegrationTest
  def test_examples
    formats = %w( case_study coming_soon detailed_guide document_collection
                  fatality_notice gone html_publication publication statistics_announcement
                  take_part topical_event_about_page unpublishing working_group )

    result = formats.inject({}) do |examples, format|
      examples[format] = format
      examples
    end
    result["html_publication"] = "arabic_translation"
    result["statistics_announcement"] = "cancelled_official_statistics"
    result["working_group"] = "long"
    result
  end

  test "content id" do
    test_examples.each do |format, example|
      define_singleton_method("schema_format") { format }

      setup_and_visit_content_item(example)
      has_component_metadata("name", "govuk:content-id")
      has_component_metadata("content", @content_item["content_id"])
    end
  end
end
