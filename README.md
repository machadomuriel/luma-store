
# QA Challenge - Luma Store Automation

## Projeto de Automação de Testes - Luma Store

Este projeto tem como objetivo automatizar cenários de teste para o site [Luma Store](https://magento.softwaretestingboard.com/)
, aplicando conceitos de testes de caixa preta. Utilizando o Robot Framework com a biblioteca Browser, foram criados scripts para validar funcionalidades principais da loja.

### Ferramentas e Tecnologias Utilizadas
- **Framework:** Robot Framework
- **Bibliotecas:**
  - **Browser**: Para automação de navegadores usando Playwright, permitindo interações rápidas e estáveis.
  - **FakerLibrary**: Para geração de dados fictícios dinâmicos (como nome e e-mail), facilitando a execução de testes com diferentes entradas.

### Estrutura de Pastas

A organização do projeto visa simplificar a manutenção e facilitar a navegação pelos recursos de teste, seguindo uma arquitetura baseada em recursos e páginas, que é próxima ao modelo Page Object:
- **commom/**: Contém arquivos de constantes e variáveis comuns.
- **resources/components/**: Componentes reutilizáveis como cabeçalho e criação de dados.
- **resources/pages/**: Recursos específicos de páginas da loja.
- **tests/**: Armazena os arquivos principais de testes automatizados.
- **hooks/**: Arquivo para ações executadas antes ou depois dos testes.

Essa estrutura permite reaproveitamento de código e simplifica a manutenção. A arquitetura é inspirada em Page Object, organizando funcionalidades por página.

### Escolha do Robot Framework e Bibliotecas

Optou-se pelo **Robot Framework** pela sua legibilidade e capacidade de integração com várias bibliotecas de automação, incluindo Browser para testes de UI. Abaixo, uma comparação com outras ferramentas consideradas:

1. **Ghost Inspector**
   - **Vantagens**: Simplicidade, ideal para times não técnicos, integração rápida com CI/CD.
   - **Desvantagens**: Baixa flexibilidade e dependência de nuvem.
2. **Selenium**
   - **Vantagens**: Alta flexibilidade, grande comunidade.
   - **Desvantagens**: Configuração complexa e manutenção trabalhosa.
3. **Cypress**
   - **Vantagens**: Desempenho e integração com JavaScript.
   - **Desvantagens**: Suporte limitado a navegadores e linguagens.

O **Robot Framework** destacou-se como escolha ideal pela sua versatilidade e clareza de sintaxe, além de fornecer relatórios nativos sem necessidade de implementações manuais.

### Casos de Teste Criados

1. **Verificar Carregamento da Home Page**: Assegurar que a página principal da loja carrega corretamente.
2. **Buscar Produto (shirt)**: Testa a busca por "shirt" no menu superior, verificando o carregamento correto dos resultados. Diferencial: Automação clica no último resultado sugerido.
3. **Adicionar Produto ao Carrinho**: Verifica o processo de adição de um item ao carrinho.
4. **Realizar Checkout**: Valida o processo de finalização de compra.
5. **Criar Conta de Usuário** (Diferencial): Verifica a criação de uma conta na loja usando dados fictícios.

Esses casos foram modelados e inicialmente executados manualmente para validar os cenários antes de serem automatizados.

### Uso do Gherkin

A escolha do Gherkin permite definir os testes de forma legível e estruturada, o que facilita o entendimento e colaboração, além de ser uma prática comum em projetos de automação, especialmente para equipes multidisciplinares.

### Idioma do Projeto

O projeto está escrito em inglês, visando escalabilidade para equipes internacionais e alinhamento com as práticas da indústria.

### Preparação do Ambiente e Execução do Projeto

1. **Instalar o Python**:
   - Verifique se o Python está instalado usando o comando:
     ```bash
     python3 --version  # É necessário Python 3.8 ou superior
     ```
   - Caso não esteja instalado, baixe e instale a versão mais recente (3.8 ou superior) em https://www.python.org/downloads/

2. **Criar e Ativar Ambiente Virtual** (opcional, mas recomendado):
   - Na raiz do projeto, execute:
     - **Windows**
       ```bash
       python -m venv env
       .\env\Scripts\activate
       ```
     - **Linux/MacOS**
       ```bash
       python3 -m venv env
       source env/bin/activate
       ```

3. **Instalar o Robot Framework e Dependências**:
   - Na raiz do projeto, execute:
     ```bash
     pip install --upgrade pip
     pip install -r requirements.txt
     ```

4. **Verificar Instalação do Robot Framework**:
   ```bash
   robot --version
   ```

5. **Instalar Node.js e Dependências**:
   - Baixe e instale Node.js em https://nodejs.org/pt/download/prebuilt-installer
   - Verifique a instalação:
     ```bash
     node -v
     ```

6. **Inicializar a Biblioteca Browser**:
   ```bash
   rfbrowser init
   ```
   
7. **Execução dos Testes**:
   - Modo Headless (sem interface gráfica):
     ```bash
     robot -d logs -v HEADLESS:True tests
     ```
   - Modo Assistido (com interface gráfica):
     ```bash
     robot -d logs tests
     ```
    O relatório e log de execução serão gerados na pasta logs.

### Observações Adicionais

- **Seletores CSS**: Preferiu-se o uso de seletores CSS por serem mais rápidos. O XPath relativo foi usado apenas quando o uso do CSS não era possível ou viável, evitando XPath absoluto por ser mais frágil.
- **Falsos Negativos**: Testes de UI são suscetíveis a falsos negativos. Recomenda-se reexecução em caso de falhas esporádicas.

>  This is a challenge by [Coodesh](https://coodesh.com/)