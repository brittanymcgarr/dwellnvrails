json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id, :description, :image
  json.url testimonial_url(testimonial, format: :json)
end
