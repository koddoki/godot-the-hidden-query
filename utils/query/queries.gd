extends VBoxContainer


@export_file("*.json") var dataset_path

var dataset : Dictionary


func _ready() -> void:
	carregar_dados(dataset_path)

	if dataset:
		# Exemplo de consulta do usuário
		var query = "SELECT * FROM pessoas WHERE Idade > 15"
		var resultado = processar_query(query, dataset)
		print("Resultado da Query: ", resultado)
	else:
		print(dataset)
		print("Erro ao carregar os dados")


# Função para carregar dados do arquivo JSON
func carregar_dados(file_path: String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	if file:
		var json_content = file.get_as_text()
		file.close()
		dataset = JSON.parse_string(json_content)

# Função para processar a query SQL-like
func processar_query(query: String, data: Dictionary) -> Array:
	var tabela_name = extrair_tabela(query)
	if not tabela_name in data:
		print("Tabela não encontrada: ", tabela_name)
		return []
	
	var registros = data[tabela_name]
	var condicao = extrair_condicao(query)
	
	# Aplicar a condição de filtragem
	if condicao:
		registros = filtrar_registros(registros, condicao)
	
	return registros

# Extrair o nome da tabela (ex: pessoas)
func extrair_tabela(query: String) -> String:
	var tokens = query.split(" ")
	var index = tokens.find("FROM")
	return tokens[index + 1] if index != -1 else ""


# Extrair a condição de filtragem (ex: Idade < 29)
func extrair_condicao(query: String) -> String:
	var index = query.find("WHERE")
	return query.substr(index + 6, query.length()).strip_edges() if index != -1 else ""

# Função para aplicar o filtro nos registros
func filtrar_registros(registros: Array, condicao: String) -> Array:
	var resultado = []

	# Dividir a condição em partes, ex: ["Idade", "<", "29"]
	var partes = condicao.split(" ")
	if partes.size() != 3:
		print("Condição inválida: ", condicao)
		return registros

	var campo = partes[0]
	var operador = partes[1]
	var valor = partes[2].to_int()

	# Filtrar cada registro de acordo com a condição
	for registro in registros:
		if not campo in registro:
			continue
		
		var valor_registro = registro[campo]
		if operador == "<" and valor_registro < valor:
			resultado.append(registro)
		elif operador == ">" and valor_registro > valor:
			resultado.append(registro)
		elif operador == "=" and valor_registro == valor:
			resultado.append(registro)
		elif operador == "<=" and valor_registro <= valor:
			resultado.append(registro)
		elif operador == ">=" and valor_registro >= valor:
			resultado.append(registro)

	return resultado


func _on_button_pressed() -> void:
	pass


func _on_preview_rect_hidden() -> void:
	print("hidden!")
