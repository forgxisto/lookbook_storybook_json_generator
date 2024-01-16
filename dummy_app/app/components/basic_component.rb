class BasicComponent < ViewComponent::Base
  def call
    tag.p { 'BasicComponent' }
  end
end
