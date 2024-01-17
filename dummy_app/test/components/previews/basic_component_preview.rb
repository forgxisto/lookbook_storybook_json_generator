class BasicComponentPreview < Lookbook::Preview
  def default
    render BasicComponent.new
  end
end
