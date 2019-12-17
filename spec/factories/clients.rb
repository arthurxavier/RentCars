FactoryBot.define do
  factory :client do
    name {'Davi Raul Barbosa'}
    cpf {'89176324672'}
    cnh {'498341884'}
    birth_date {Date.new(1989, 6, 22)}
  end
end
