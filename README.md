🖤 lazarus ui — Roblox UI Library
Library de UI moderna para Roblox, feita em Luau. Suporte a PC e Mobile, múltiplos temas, e carregamento via loadstring.
📦 Instalação
local NexusUI = loadstring(game:HttpGet("SUA_URL_RAW_AQUI"))()
Substitua SUA_URL_RAW_AQUI pela URL raw do arquivo NexusUI.lua no GitHub.
🚀 Exemplo Completo
local NexusUI = loadstring(game:HttpGet("SUA_URL_RAW_AQUI"))()

-- ╔══════════════════════════════╗
-- ║        CRIAR JANELA          ║
-- ╚══════════════════════════════╝
local Win = NexusUI:MakeWindow({
    Title      = "Meu Hub",          -- Título da janela
    SubTitle   = "v1.0",             -- Subtítulo (opcional)
    Theme      = "Dark",             -- "Dark" | "Light" | "Neon"
    ToggleKey  = Enum.KeyCode.RightShift, -- Tecla para abrir/fechar
    LogoId     = "rbxassetid://123", -- ImageId do logo (opcional)
    Size       = { Width = 480, Height = 360 }, -- Tamanho (opcional)
})

-- ╔══════════════════════════════╗
-- ║          CRIAR TAB           ║
-- ╚══════════════════════════════╝
local Tab = Win:MakeTab({
    Name = "Principal",              -- Nome da tab
    Icon = "rbxassetid://456",       -- Ícone da tab (opcional)
})

-- ╔══════════════════════════════╗
-- ║           SECTION            ║
-- ╚══════════════════════════════╝
-- Separador visual com título
Tab:MakeSection("Movimento")

-- ╔══════════════════════════════╗
-- ║           BUTTON             ║
-- ╚══════════════════════════════╝
Tab:MakeButton({
    Name     = "Teleport ao Spawn",
    Desc     = "Vai para o ponto inicial",  -- Descrição (opcional)
    Image    = "rbxassetid://789",          -- Ícone no botão (opcional)
    Callback = function()
        -- código aqui
        local char = game.Players.LocalPlayer.Character
        if char then
            char:MoveTo(Vector3.new(0, 5, 0))
        end
    end,
})

-- ╔══════════════════════════════╗
-- ║           TOGGLE             ║
-- ╚══════════════════════════════╝
local SpeedToggle = Tab:MakeToggle({
    Name     = "Speed Hack",
    Default  = false,   -- Estado inicial
    Callback = function(state)
        -- state = true ou false
        local char = game.Players.LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = state and 100 or 16
            end
        end
    end,
})

-- Controlando o toggle via código:
SpeedToggle:Set(true)   -- Liga
SpeedToggle:Get()       -- Retorna true/false

-- ╔══════════════════════════════╗
-- ║           SLIDER             ║
-- ╚══════════════════════════════╝
local SpeedSlider = Tab:MakeSlider({
    Name     = "Velocidade",
    Min      = 0,       -- Valor mínimo
    Max      = 500,     -- Valor máximo
    Default  = 16,      -- Valor inicial
    Suffix   = " sp",   -- Sufixo exibido (opcional, ex: " km/h")
    Callback = function(value)
        -- value = número atual
        local char = game.Players.LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = value end
        end
    end,
})

-- Controlando o slider via código:
SpeedSlider:Set(100)   -- Define valor
SpeedSlider:Get()      -- Retorna valor atual

-- ╔══════════════════════════════╗
-- ║          DROPDOWN            ║
-- ╚══════════════════════════════╝
local GameDrop = Tab:MakeDropdown({
    Name     = "Modo de Jogo",
    Options  = { "Normal", "Hard", "Insano", "Criativo" },
    Default  = "Normal",   -- Opção inicial
    Multi    = false,      -- true = seleção múltipla
    Callback = function(selected)
        -- selected = string (ou tabela se Multi = true)
        print("Selecionado:", selected)
    end,
})

-- Controlando via código:
GameDrop:Set("Hard")                   -- Define opção
GameDrop:Get()                         -- Retorna selecionado
GameDrop:Refresh({"Opção A","Opção B"}) -- Atualiza lista

-- ╔══════════════════════════════╗
-- ║       DROPDOWN MULTI         ║
-- ╚══════════════════════════════╝
local MultiDrop = Tab:MakeDropdown({
    Name     = "Hacks Ativos",
    Options  = { "Speed", "Jump", "NoClip", "ESP" },
    Default  = "Speed",
    Multi    = true,   -- Permite selecionar vários
    Callback = function(selected)
        -- selected = tabela com os selecionados, ex: { "Speed", "ESP" }
        for _, v in ipairs(selected) do
            print("Ativo:", v)
        end
    end,
})

-- ╔══════════════════════════════╗
-- ║           INPUT              ║
-- ╚══════════════════════════════╝
local NameInput = Tab:MakeInput({
    Name         = "Nome do Player",
    Placeholder  = "Digite o nome...",
    Default      = "",             -- Valor inicial (opcional)
    ClearOnFocus = false,          -- Limpa ao clicar? (opcional)
    Callback     = function(text, enterPressed)
        -- text = texto digitado
        -- enterPressed = true se confirmou com Enter
        if enterPressed then
            print("Nome:", text)
        end
    end,
})

-- Controlando via código:
NameInput:Set("Jogador123")
NameInput:Get()   -- Retorna texto atual

-- ╔══════════════════════════════╗
-- ║           LABEL              ║
-- ╚══════════════════════════════╝
local InfoLabel = Tab:MakeLabel("Versão: 1.0.0 | Feito com NexusUI")

-- Atualizando via código:
InfoLabel:Set("Versão: 1.0.1 | Atualizado!")

-- ╔══════════════════════════════╗
-- ║        COLOR PICKER          ║
-- ╚══════════════════════════════╝
-- Outra tab para demonstrar
local Tab2 = Win:MakeTab({ Name = "Visual" })

local EspColor = Tab2:MakeColorPicker({
    Name     = "Cor do ESP",
    Default  = Color3.fromRGB(255, 100, 100),  -- Cor inicial
    Callback = function(color)
        -- color = Color3
        print("Cor escolhida:", color)
    end,
})

-- Controlando via código:
EspColor:Set(Color3.fromRGB(0, 255, 0))
EspColor:Get()   -- Retorna Color3 atual

-- ╔══════════════════════════════╗
-- ║          KEYBIND             ║
-- ╚══════════════════════════════╝
local FlyBind = Tab2:MakeKeybind({
    Name     = "Fly Toggle",
    Default  = Enum.KeyCode.F,   -- Tecla padrão
    Callback = function()
        -- Chamado toda vez que a tecla for pressionada
        print("Fly toggled!")
    end,
})

-- Controlando via código:
FlyBind:Set(Enum.KeyCode.G)   -- Muda a tecla
FlyBind:Get()                 -- Retorna KeyCode atual

-- ╔══════════════════════════════╗
-- ║        NOTIFICAÇÃO           ║
-- ╚══════════════════════════════╝
Win:Notify({
    Title    = "Bem-vindo!",
    Content  = "Hub carregado com sucesso.",
    Duration = 4,          -- Segundos
    Type     = "Success",  -- "Info" | "Success" | "Warning" | "Error"
})

-- ╔══════════════════════════════╗
-- ║        MUDAR TEMA            ║
-- ╚══════════════════════════════╝
Win:ChangeTheme("Neon")   -- Muda tema em runtime
📋 Referência de Componentes
NexusUI:MakeWindow(config)
Parâmetro
Tipo
Padrão
Descrição
Title
string
"NexusHub"
Título da janela
SubTitle
string
""
Subtítulo ao lado do título
Theme
string
"Dark"
Tema visual da UI
ToggleKey
Enum.KeyCode
RightShift
Tecla para abrir/fechar
LogoId
string
""
rbxassetid:// para logo
Size
table
{480, 360}
{ Width = n, Height = n }
Win:MakeTab(config)
Parâmetro
Tipo
Padrão
Descrição
Name
string
"Tab"
Nome da tab
Icon
string
""
rbxassetid:// do ícone
Tab:MakeSection(name)
Parâmetro
Tipo
Descrição
name
string
Título da seção
Tab:MakeButton(config)
Parâmetro
Tipo
Padrão
Descrição
Name
string
"Button"
Texto do botão
Desc
string
""
Descrição abaixo do nome
Image
string
""
rbxassetid:// para ícone
Callback
function
function()
Chamado ao clicar
Tab:MakeToggle(config)
Parâmetro
Tipo
Padrão
Descrição
Name
string
"Toggle"
Nome do toggle
Default
boolean
false
Estado inicial
Callback
function
function()
function(state)
Métodos: :Set(bool), :Get() → bool
Tab:MakeSlider(config)
Parâmetro
Tipo
Padrão
Descrição
Name
string
"Slider"
Nome do slider
Min
number
0
Valor mínimo
Max
number
100
Valor máximo
Default
number
Min
Valor inicial
Suffix
string
""
Texto após o valor (ex: " km")
Callback
function
function()
function(value)
Métodos: :Set(number), :Get() → number
Tab:MakeDropdown(config)
Parâmetro
Tipo
Padrão
Descrição
Name
string
"Dropdown"
Nome do dropdown
Options
table
{}
Lista de strings com as opções
Default
string
Options[1]
Opção selecionada inicialmente
Multi
boolean
false
Permite selecionar múltiplas opções
Callback
function
function()
function(selected) — string ou table
Métodos: :Set(value), :Get(), :Refresh(newOptions)
Tab:MakeInput(config)
Parâmetro
Tipo
Padrão
Descrição
Name
string
"Input"
Rótulo do campo
Placeholder
string
"Digite aqui…"
Texto de placeholder
Default
string
""
Valor inicial
ClearOnFocus
boolean
false
Limpa ao focar no campo
Callback
function
function()
function(text, enterPressed)
Métodos: :Set(string), :Get() → string
Tab:MakeLabel(text, color)
Parâmetro
Tipo
Padrão
Descrição
text
string
""
Texto exibido
color
Color3
SubText
Cor do texto
Métodos: :Set(string)
Tab:MakeColorPicker(config)
Parâmetro
Tipo
Padrão
Descrição
Name
string
"Cor"
Nome do picker
Default
Color3
RGB(255,100,100)
Cor inicial
Callback
function
function()
function(color)
Métodos: :Set(Color3), :Get() → Color3
Tab:MakeKeybind(config)
Parâmetro
Tipo
Padrão
Descrição
Name
string
"Keybind"
Nome do keybind
Default
Enum.KeyCode
KeyCode.E
Tecla padrão
Callback
function
function()
Chamado ao pressionar a tecla
Métodos: :Set(Enum.KeyCode), :Get() → Enum.KeyCode
Win:Notify(config)
Parâmetro
Tipo
Padrão
Descrição
Title
string
"Aviso"
Título da notificação
Content
string
""
Mensagem
Duration
number
3
Tempo em segundos
Type
string
"Info"
"Info" "Success" "Warning" "Error"
Win:ChangeTheme(name)
Valor
Descrição
"Dark"
Fundo escuro com roxo (padrão)
"Light"
Fundo claro com roxo
"Neon"
Fundo preto com verde neon
🎨 Temas
Tema
Fundo
Destaque
Dark
Escuro
Roxo #6450FF
Light
Claro
Roxo #5A46E6
Neon
Preto
Verde #00FFB4
⌨️ Atalhos
Ação
Padrão
Abrir / Fechar UI
RightShift
Botão flutuante
Clique / Toque
Arrastar janela
Drag na TopBar
O ToggleKey pode ser alterado em MakeWindow.
📝 Notas
Compatível com PC e Mobile
Usa CoreGui automaticamente (com fallback para PlayerGui)
Cada componente retorna um objeto com métodos :Set() e :Get() para controle via código
A janela é arrastável pela barra superior
Feito com ❤️ - Lazarus Ui Lib