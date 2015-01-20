json.array!(@professors) do |professor|
  json.extract! professor, :id, :user_id, :email, :price, :nota_pi, :nota_pf, :cr, :ranking, :horario
  json.url professor_url(professor, format: :json)
end
