<p align="center">
  <a href="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/readme.md">
    <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/1737%20Sem%20T%C3%ADtulo_20260306125304.png" alt="Versão da lib" height="100px">
  </a>
</p>

**Lazarus Lib Ui**

> Uma biblioteca de interface poderosa, rápida e totalmente personalizável para seus scripts.

---

<p align="center">
  <a href="https://github.com/Anonimo-666777/Lazarios-ui-library?tab=readme-ov-file#info">
    <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/1736%20Sem%20T%C3%ADtulo_20260305214507.png" alt="Versão da lib" height="90px">
  </a>
</p>

Uma lib feita por david e menkato os canais estão na parte de Créditos nesse readme terá como usar a lib e créditos e versão mais recente e outras infos sobre🐺🖤🤍

<p align="center">
  <a href="https://github.com/Anonimo-666777/Lazarios-ui-library?tab=readme-ov-file#Créditos">
    <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/1736%20Sem%20T%C3%ADtulo_20260306123941.png" alt="Versão da lib" height="90px">
  </a>
</p>

## ⚡ Por que usar a Lazarus?
- 🚀 **Rapidez:** Carregamento otimizado.
- 🎨 **Estilo:** Design moderno e minimalista.
- 🛠️ **Facilidade:** Documentação clara e simples de implementar.
- 📱 **Multiplataforma:** Suporte total para Android, iOS e PC.

---

# 📷**Demonstração da lib**

<img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/YouCut_20260305_222030997-ezgif.com-video-to-gif-converter.gif" width="500" height="auto">


## 🎨 Temas Disponíveis

| Dark (Padrão) | Light | Neon |
| :---: | :---: | :---: |
| <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/Screenshot_20260304-195001.png" width="200"> | <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/Screenshot_20260304-212548.png" width="200"> | <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/Screenshot_20260304-212611.png" width="200"> |
| **Red** | **Blue** | **Purple** |
| <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/Screenshot_20260305-195057.png" width="200"> | <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/Screenshot_20260305-194912.png" width="200"> | <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/Screenshot_20260305-194818.png" width="200"> |

---

# **❓como usar**

## Loader

```lua
local NexusUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Anonimo-666777/Lazarios-ui-library/main/CoreLib.lua"))()
```

## 🖼Window

```lua
local Win = NexusUI:MakeWindow({
    Title = "Meu Hub",
    Theme = "Dark",
    RGBBorder = false,
    LogoId    = "rbxassetid://123456", 
}) 
```

troque tema,título,subtítulo e toggleKey
Nota:ToggleKey é para pc

## **Opacidade e tamanho da window**

## Tamanho

```lua
Win:SetSize(480) 
```

## opacidade

```lua
Win:SetOpacity(0)
```

## 📂tab

```lua
local Tab1 = Win:MakeTab({
    Name = "Principal",
    Icon = "rbxassetid://123456",
})
```

troque name e tab1 bote tab2, tab3 e etc e o name você muda para o que quiser

## 〰️Section

```lua
Tab1:MakeSection("Geral")
```

troque Tab1 para tab que quer isso vale para botões, sections, slide rs e etc que tiver dentro da tab e troque o "geral" para o que quiser entre os " "

## 🔘button

```lua
Tab1:MakeButton({
	Name = "Teleport",
	Callback = function()
		print("Teleport clicado")
	end,
})
```

troque name para o nome que quer e substitua print pela função que quer 

##  🎚slider

```lua
Tab1:MakeSlider({
	Name = "Velocidade",
	Min = 0,
	Max = 500,
	Default = 16,
	Suffix = " sp",
	Callback = function(value)
		print("Velocidade:", value)
	end,
})
```
mude name para o nome que quer e mude o default, min, max e etc do jeito que quiser e bote a função no lugar do print

## 🎛toggle

```lua
Tab1:MakeToggle({
	Name = "Speed Hack",
	Default = false,
	Callback = function(state)
		print("Speed Hack:", state)
	end,
})
```

mude name para o nome que quer e substitua o print pela função que quer

## 📜dropdown

```lua
Tab1:MakeDropdown({
	Name = "Time",
	Options = {"Azul", "Vermelho", "Verde"},
	Default = "Azul",
	Callback = function(selected)
		print("Time:", selected)
	end,
})
```

mude name para o nome e bote as opções que quer em options e mude default e função para o que quiser

## 📝Input

```lua
Tab1:MakeInput({
	Name = "Nome",
	Placeholder = "Digite o nome...",
	Callback = function(text, enter)
		print("Nome:", text)
	end,
})
```
mude nome tab e etc para o que quiser

##  🔤label

```lua
Tab1:MakeLabel("NexusUI v1.0 carregado!")
```

acho que você já aprendeu né? 

## 🌈ColorPicker

```lua
Tab2:MakeColorPicker({
	Name = "Cor do ESP",
	Default = Color3.fromRGB(255, 100, 100),
	Callback = function(color)
		print("Cor:", color)
	end,
})
```

## 🔑KeyBind(pra pc) 

```lua
Tab2:MakeKeybind({
	Name = "Fly",
	Default = Enum.KeyCode.F,
	Callback = function()
		print("Fly pressionado")
	end,
})
```

## 🔔notificação

```lua
Win:Notify({
	Title = "Carregado!",
	Content = "Hub iniciado com sucesso.",
	Duration = 4,
	Type = "Success",
})
```

## 💬Dialog 

```lua
NexusUI:MakeDialog({
    Title = "Tem certeza?",
    Text  = "Isso vai resetar o personagem.",
    Buttons = {
        {Text = "Confirmar", Callback = function() print("confirmado") end},
        {Text = "Cancelar",  Callback = function() print("cancelado") end},
        {Text = "Saiba mais",Callback = function() print("info") end},
    }
})
```

Nota: dá para botar quanto quiser com essa parte aqui
```lua
{Text = "Texto",  Callback = function() print("print ou substitua esse print por uma função") end},
```

💬📷**como o dialog é?** 

<img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/Screenshot_20260305-194325.png">

## 📸🔤Image Label

```lua
Tab1:MakeImage({
    Image  = "rbxassetid://123456",
    Height = 150,
    Desc   = "Logo do hub",
})
```

# **⭐Créditos**

**👥Criadores:**
davidgames3d e menkato

**👨‍🎨Interface ui:**
davidgames3d e menkato

**👨‍💻código:**
davidgames3d e menkato 

©2026 lib Davidgames3d e menkato©

# **redes sociais**

<p align="center">
  <a href="https://youtube.com/@davidgames3d?si=TFaUVbvejRl4t80J">
    <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/1736%20Sem%20T%C3%ADtulo_20260305214454.png" alt="Nome da Badge" height="90px">
  </a>
</p>

<p align="center">
  <a href="https://youtube.com/@menkato?si=JvjCUxvzoKWOczlX">
    <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/1736%20Sem%20T%C3%ADtulo_20260305214455.png" alt="Nome da Badge" height="90px">
  </a>
</p>

<p align="center">
  <a href="https://discord.gg/ZVHsuCM5v">
    <img src="https://github.com/Anonimo-666777/Lazarios-ui-library/blob/main/1736%20Sem%20T%C3%ADtulo_20260305214452.png" alt="Nome da Badge" height="90px">
  </a>
</p>

©2026 lib Davidgames3d e menkato©