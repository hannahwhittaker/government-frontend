class AnswerPresenter < ContentItemPresenter
  include ContentItem::Body
  include ContentItem::LastUpdated
  include Navigation::Mainstream
end
