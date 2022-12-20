json.extract! endereco, :id, :cep, :longr, :complemento, :bairro, :cidade, :uf, :cdg_ibge, :municipe_id, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
