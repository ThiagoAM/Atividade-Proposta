# Atividade-Proposta
Solução do desafio principal proposto pela Fóton.
</br>
</br>
<b>Descrição:</b>
</br>
</br>
Tendo em vista a necessidade de um gestor que precisa de uma lista, que seja salva localmente, dos seus funcionários. Construa uma aplicação que liste seus funcionários e permita que o gestor realize alterações nas inconsistências cadastrais.
</br>
</br>
Requisitos:</br></br>
• Linguagem: Swift</br>
• Arquitetura: MVP (https://medium.com/@saad.eloulladi/ios-swift-mvp-architecture-pattern-a2b0c2d310a3)</br>
• Utilizar o padrão de projeto Coordinator: Para transitar entre as telas</br>

2 Telas muito simples, o objetivo não é analisar layout, apenas o layout da célula customizada da table view (.xib):
</br></br>
• 1º Lista dos funcionários (contendo placeholder ou imagem de perfil do funcionário, seguida do nome e abaixo do nome a idade e o salário do funcionário)</br>
Deve conter uma UITableView com uma célula customizada (.xib) que receba o nome, idade e imagem de perfil via parâmetro
</br>
• 2º Tela para alteração do nome e/ou salário do funcionário.</br>
Deve conter 2 UITextView (Um para o nome e outro para o salário) o campo de idade deve ser apenas leitura
</br></br>
A requisição inicial (apenas primeira vez que abrir ao app) deve ser realizada utilizando Alamofire (Cocoa Pods) realizar a operação
(GET) http://dummy.restapiexample.com/api/v1/employees
Toda documentação qualquer outra coisa necessária para a consulta no serviço está disponível em: http://dummy.restapiexample.com
Salvar os dados localmente utilizando Core Data (+ Salvar as alterações realizadas pelo gestor)
