Order.transaction do
(1..100).each do |i|
Order.create(name: "Customer#{i}",address: "MainLand Block No #{i}",
				email: "no#{i}@example.com",pay_type: "Check")
end
end
