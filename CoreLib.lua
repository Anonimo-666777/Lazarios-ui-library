-- ================================================
--         Lazarus Library - by davidgames3d and menkayto
--         Versão: 1.0.4 | Luau | Roblox
-- ================================================
-- Uso via loadstring:
--   local NexusUI = loadstring(game:HttpGet("SUA_URL"))()
--   local Win = NexusUI:MakeWindow({ Title = "Meu Hub", Theme = "Dark" })
-- ================================================

local Library = {}
Library.__index = Library

local UserInputService = game:GetService("UserInputService")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")

-- ── Paleta de Temas ──────────────────────────────
local Themes = {
    Dark = {
        Background   = Color3.fromRGB(15,  15,  20),
        Secondary    = Color3.fromRGB(22,  22,  30),
        Accent       = Color3.fromRGB(100, 80, 255),
        AccentHover  = Color3.fromRGB(120, 100, 255),
        Text         = Color3.fromRGB(235, 235, 245),
        SubText      = Color3.fromRGB(140, 140, 160),
        Element      = Color3.fromRGB(30,  30,  42),
        ElementHover = Color3.fromRGB(40,  40,  55),
        Border       = Color3.fromRGB(45,  45,  65),
        SliderFill   = Color3.fromRGB(100, 80, 255),
        Toggle_On    = Color3.fromRGB(100, 80, 255),
        Toggle_Off   = Color3.fromRGB(55,  55,  75),
        TopBar       = Color3.fromRGB(18,  18,  26),
    },
    Light = {
        Background   = Color3.fromRGB(240, 240, 248),
        Secondary    = Color3.fromRGB(255, 255, 255),
        Accent       = Color3.fromRGB(90,  70, 230),
        AccentHover  = Color3.fromRGB(110, 90, 245),
        Text         = Color3.fromRGB(20,  20,  35),
        SubText      = Color3.fromRGB(100, 100, 120),
        Element      = Color3.fromRGB(225, 225, 238),
        ElementHover = Color3.fromRGB(210, 210, 228),
        Border       = Color3.fromRGB(200, 200, 220),
        SliderFill   = Color3.fromRGB(90,  70, 230),
        Toggle_On    = Color3.fromRGB(90,  70, 230),
        Toggle_Off   = Color3.fromRGB(180, 180, 200),
        TopBar       = Color3.fromRGB(230, 230, 245),
    },
    Neon = {
        Background   = Color3.fromRGB(5,   5,   12),
        Secondary    = Color3.fromRGB(8,   8,   18),
        Accent       = Color3.fromRGB(0,  255, 180),
        AccentHover  = Color3.fromRGB(0,  230, 160),
        Text         = Color3.fromRGB(220, 255, 245),
        SubText      = Color3.fromRGB(100, 180, 160),
        Element      = Color3.fromRGB(12,  20,  28),
        ElementHover = Color3.fromRGB(18,  30,  40),
        Border       = Color3.fromRGB(0,   80,  60),
        SliderFill   = Color3.fromRGB(0,  255, 180),
        Toggle_On    = Color3.fromRGB(0,  255, 180),
        Toggle_Off   = Color3.fromRGB(30,  50,  45),
        TopBar       = Color3.fromRGB(6,   10,  16),
    },
    Red = {
        Background   = Color3.fromRGB(123, 46, 47),
        Secondary    = Color3.fromRGB(196, 40, 28),
        Accent       = Color3.fromRGB(205, 84, 75),
        AccentHover  = Color3.fromRGB(255, 0, 0),
        Text         = Color3.fromRGB(242, 243, 243),
        SubText      = Color3.fromRGB(236, 232, 222),
        Element      = Color3.fromRGB(205, 84, 75),
        ElementHover = Color3.fromRGB(255, 0, 0),
        Border       = Color3.fromRGB(255, 0, 0),
        SliderFill   = Color3.fromRGB(255, 0, 0),
        Toggle_On    = Color3.fromRGB(196, 40, 28),
        Toggle_Off   = Color3.fromRGB(205, 84, 75),
        TopBar       = Color3.fromRGB(196, 40, 28),
    },
    Blue = {
        Background   = Color3.fromRGB(110, 153, 202),
        Secondary    = Color3.fromRGB(180, 210, 228),
        Accent       = Color3.fromRGB(128, 187, 219),
        AccentHover  = Color3.fromRGB(13, 105, 172),
        Text         = Color3.fromRGB(193, 223, 240),
        SubText      = Color3.fromRGB(180, 210, 228),
        Element      = Color3.fromRGB(110, 153, 202),
        ElementHover = Color3.fromRGB(32, 58, 86),
        Border       = Color3.fromRGB(9, 137, 207),
        SliderFill   = Color3.fromRGB(125, 187, 221),
        Toggle_On    = Color3.fromRGB(175, 221, 255),
        Toggle_Off   = Color3.fromRGB(33, 84, 185),
        TopBar       = Color3.fromRGB(51, 88, 130),
    },
    Purple = {
        Background   = Color3.fromRGB(17, 17, 17),
        Secondary    = Color3.fromRGB(98, 37, 209),
        Accent       = Color3.fromRGB(205, 98, 152),
        AccentHover  = Color3.fromRGB(98, 37, 209),
        Text         = Color3.fromRGB(242, 243, 243),
        SubText      = Color3.fromRGB(242, 243, 243),
        Element      = Color3.fromRGB(205, 205, 205),
        ElementHover = Color3.fromRGB(98, 37, 209),
        Border       = Color3.fromRGB(98, 37, 209),
        SliderFill   = Color3.fromRGB(98, 37, 209),
        Toggle_On    = Color3.fromRGB(98, 37, 209),
        Toggle_Off   = Color3.fromRGB(205, 205, 205),
        TopBar       = Color3.fromRGB(98, 37, 209),
    },
    DarkRed = {
        Background   = Color3.fromRGB(17, 17, 17),
        Secondary    = Color3.fromRGB(196, 40, 28),
        Accent       = Color3.fromRGB(27, 42, 53),
        AccentHover  = Color3.fromRGB(196, 40, 28),
        Text         = Color3.fromRGB(242, 243, 243),
        SubText      = Color3.fromRGB(237, 234, 234),
        Element      = Color3.fromRGB(27, 42, 53),
        ElementHover = Color3.fromRGB(196, 40, 28),
        Border       = Color3.fromRGB(255, 0, 0),
        SliderFill   = Color3.fromRGB(255, 0, 0),
        Toggle_On    = Color3.fromRGB(255, 0, 0),
        Toggle_Off   = Color3.fromRGB(27, 42, 53),
        TopBar       = Color3.fromRGB(255, 0, 0),
    }, 
}

-- ── Utilidades ───────────────────────────────────
local function Tween(obj, props, dur, style, dir)
    local info = TweenInfo.new(dur or 0.2, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out)
    TweenService:Create(obj, info, props):Play()
end

local function Corner(parent, radius)
    local c = Instance.new("UICorner", parent)
    c.CornerRadius = UDim.new(0, radius or 8)
    return c
end

local function Stroke(parent, color, thickness)
    local s = Instance.new("UIStroke", parent)
    s.Color = color
    s.Thickness = thickness or 1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return s
end

local function Padding(parent, top, bottom, left, right)
    local p = Instance.new("UIPadding", parent)
    p.PaddingTop    = UDim.new(0, top    or 6)
    p.PaddingBottom = UDim.new(0, bottom or 6)
    p.PaddingLeft   = UDim.new(0, left   or 8)
    p.PaddingRight  = UDim.new(0, right  or 8)
    return p
end

local function ListLayout(parent, padding, dir, halign)
    local l = Instance.new("UIListLayout", parent)
    l.Padding            = UDim.new(0, padding or 6)
    l.FillDirection      = dir    or Enum.FillDirection.Vertical
    l.HorizontalAlignment = halign or Enum.HorizontalAlignment.Center
    l.SortOrder          = Enum.SortOrder.LayoutOrder
    return l
end

local function MakeDraggable(handle, frame)
    local dragging, dragStart, startPos
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging  = true
            dragStart = input.Position
            startPos  = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement or
            input.UserInputType == Enum.UserInputType.Touch
        ) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

function Library:MakeDialog(config)
	config = config or {}
	local Title   = config.Title   or "Aviso"
	local Text    = config.Text    or ""
	local Buttons = config.Buttons or {{Text = "OK", Callback = function() end}}

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name            = "NexusDialog"
	ScreenGui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
	ScreenGui.ResetOnSpawn    = false
	ScreenGui.IgnoreGuiInset  = true
	pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
	if not ScreenGui.Parent then
		ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	end

	local Blur = Instance.new("Frame", ScreenGui)
	Blur.Size             = UDim2.new(1,0,1,0)
	Blur.BackgroundColor3 = Color3.fromRGB(0,0,0)
	Blur.BackgroundTransparency = 0.5
	Blur.BorderSizePixel  = 0
	Blur.ZIndex           = 1

	local btnCount = #Buttons
	local dialogH  = 140 + (btnCount > 2 and (btnCount-2)*44 or 0)

	local Card = Instance.new("Frame", ScreenGui)
	Card.Size             = UDim2.new(0,360,0,dialogH)
	Card.AnchorPoint      = Vector2.new(0.5,0.5)
	Card.Position         = UDim2.new(0.5,0,0.4,0)
	Card.BackgroundColor3 = Color3.fromRGB(18,18,26)
	Card.BorderSizePixel  = 0
	Card.ZIndex           = 2
	local cc = Instance.new("UICorner", Card)
	cc.CornerRadius = UDim.new(0,14)
	local cs = Instance.new("UIStroke", Card)
	cs.Color     = Color3.fromRGB(60,60,90)
	cs.Thickness = 1.5

	Card.Position = UDim2.new(0.5,0,0.6,0)
	Card.BackgroundTransparency = 1
	TweenService:Create(Card, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5,0,0.5,0),
		BackgroundTransparency = 0,
	}):Play()

	local TitleLbl = Instance.new("TextLabel", Card)
	TitleLbl.Size                  = UDim2.new(1,-24,0,36)
	TitleLbl.Position              = UDim2.new(0,12,0,12)
	TitleLbl.BackgroundTransparency = 1
	TitleLbl.Text                  = Title
	TitleLbl.TextColor3            = Color3.new(1,1,1)
	TitleLbl.TextSize              = 17
	TitleLbl.Font                  = Enum.Font.GothamBold
	TitleLbl.TextXAlignment        = Enum.TextXAlignment.Left
	TitleLbl.ZIndex                = 3

	local Divider = Instance.new("Frame", Card)
	Divider.Size             = UDim2.new(1,-24,0,1)
	Divider.Position         = UDim2.new(0,12,0,50)
	Divider.BackgroundColor3 = Color3.fromRGB(50,50,75)
	Divider.BorderSizePixel  = 0
	Divider.ZIndex           = 3

	local TextLbl = Instance.new("TextLabel", Card)
	TextLbl.Size                  = UDim2.new(1,-24,0,50)
	TextLbl.Position              = UDim2.new(0,12,0,58)
	TextLbl.BackgroundTransparency = 1
	TextLbl.Text                  = Text
	TextLbl.TextColor3            = Color3.fromRGB(180,180,200)
	TextLbl.TextSize              = 13
	TextLbl.Font                  = Enum.Font.Gotham
	TextLbl.TextXAlignment        = Enum.TextXAlignment.Left
	TextLbl.TextWrapped           = true
	TextLbl.ZIndex                = 3

	local btnY = 116
	for i, btnData in ipairs(Buttons) do
		local isPrimary = i == 1
		local Btn = Instance.new("TextButton", Card)
		Btn.Size             = UDim2.new(1/math.min(btnCount,2) - 0.04, 0, 0, 36)
		Btn.Position         = UDim2.new(
			(i <= 2) and ((i-1) * (1/math.min(btnCount,2))) + 0.02 or 0.02,
			0,
			0,
			(i <= 2) and btnY or btnY + math.ceil((i-2)) * 44
		)
		Btn.BackgroundColor3 = isPrimary and Color3.fromRGB(100,80,255) or Color3.fromRGB(35,35,50)
		Btn.Text             = btnData.Text or "Botão"
		Btn.TextColor3       = Color3.new(1,1,1)
		Btn.TextSize         = 13
		Btn.Font             = Enum.Font.GothamSemibold
		Btn.BorderSizePixel  = 0
		Btn.ZIndex           = 3
		local bc = Instance.new("UICorner", Btn)
		bc.CornerRadius = UDim.new(0,8)

		Btn.MouseEnter:Connect(function()
			TweenService:Create(Btn, TweenInfo.new(0.12), {
				BackgroundColor3 = isPrimary and Color3.fromRGB(120,100,255) or Color3.fromRGB(50,50,70)
			}):Play()
		end)
		Btn.MouseLeave:Connect(function()
			TweenService:Create(Btn, TweenInfo.new(0.12), {
				BackgroundColor3 = isPrimary and Color3.fromRGB(100,80,255) or Color3.fromRGB(35,35,50)
			}):Play()
		end)
		Btn.MouseButton1Click:Connect(function()
			TweenService:Create(Card, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
				Position = UDim2.new(0.5,0,0.6,0),
				BackgroundTransparency = 1,
			}):Play()
			TweenService:Create(Blur, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
			task.delay(0.22, function()
				ScreenGui:Destroy()
			end)
			if btnData.Callback then
				btnData.Callback()
			end
		end)
	end
end

-- ── MakeWindow ────────────────────────────────────
function Library:MakeWindow(config)
    config = config or {}
    local Title     = config.Title     or "Lazarus Lib"
    local SubTitle  = config.SubTitle  or "David e menkato"
    local ThemeName = config.Theme     or "Dark"
    local ToggleKey = config.ToggleKey or Enum.KeyCode.RightShift
    local LogoId    = config.LogoId    or ""  -- ImageId opcional
    local Size      = config.Size      or {Width = 480, Height = 360}

    local T = Themes[ThemeName] or Themes.Dark

    -- ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name            = "NexusUI_" .. Title
    ScreenGui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn    = false
    ScreenGui.IgnoreGuiInset  = true
    pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
    if not ScreenGui.Parent then
        ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end

    -- ── Botão Flutuante (Toggle) ──
    local ToggleBtn = Instance.new("ImageButton", ScreenGui)
    ToggleBtn.Name            = "ToggleButton"
    ToggleBtn.Size            = UDim2.new(0, 48, 0, 48)
    ToggleBtn.Position        = UDim2.new(0, 16, 0.5, -24)
    ToggleBtn.BackgroundColor3 = T.Accent
    ToggleBtn.BorderSizePixel = 0
    ToggleBtn.ZIndex          = 10
    if LogoId ~= "" then
        ToggleBtn.Image = LogoId
    else
        local lbl = Instance.new("TextLabel", ToggleBtn)
        lbl.Size              = UDim2.new(1,0,1,0)
        lbl.BackgroundTransparency = 1
        lbl.Text              = "☰"
        lbl.TextColor3        = Color3.new(1,1,1)
        lbl.TextScaled        = true
        lbl.Font              = Enum.Font.GothamBold
        lbl.ZIndex            = 11
    end
    Corner(ToggleBtn, 12)
    Stroke(ToggleBtn, T.Border, 1.5)
    MakeDraggable(ToggleBtn, ToggleBtn)

    -- ── MainFrame ──
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Name             = "MainFrame"
    MainFrame.Size             = UDim2.new(0, Size.Width, 0, Size.Height)
    MainFrame.Position         = UDim2.new(0.5, -(Size.Width/2), 0.5, -(Size.Height/2))
    MainFrame.BackgroundColor3 = T.Background
    MainFrame.BorderSizePixel  = 0
    MainFrame.ClipsDescendants = true
    Corner(MainFrame, 12)
    Stroke(MainFrame, T.Border, 1.5)
local RGBBorder = config.RGBBorder or false

if RGBBorder then
	local RGBStroke = Instance.new("UIStroke", MainFrame)
	RGBStroke.Thickness = 1.5
	RGBStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	local hue = 0
	RunService.Heartbeat:Connect(function(dt)
		if not MainFrame or not MainFrame.Parent then return end
		hue = (hue + dt * 0.5) % 1
		RGBStroke.Color = Color3.fromHSV(hue, 1, 1)
	end)
end

    -- ── TopBar ──
    local TopBar = Instance.new("Frame", MainFrame)
    TopBar.Name             = "TopBar"
    TopBar.Size             = UDim2.new(1, 0, 0, 44)
    TopBar.BackgroundColor3 = T.TopBar
    TopBar.BorderSizePixel  = 0
    Corner(TopBar, 12)

    -- Corrige cantos inferiores do topbar
    local CornerFix = Instance.new("Frame", TopBar)
    CornerFix.Size             = UDim2.new(1,0,0,12)
    CornerFix.Position         = UDim2.new(0,0,1,-12)
    CornerFix.BackgroundColor3 = T.TopBar
    CornerFix.BorderSizePixel  = 0

    -- Logo no topbar
    if LogoId ~= "" then
        local Logo = Instance.new("ImageLabel", TopBar)
        Logo.Size                  = UDim2.new(0,28,0,28)
        Logo.Position              = UDim2.new(0,10,0.5,-14)
        Logo.BackgroundTransparency = 1
        Logo.Image                 = LogoId
    end

    local TitleLabel = Instance.new("TextLabel", TopBar)
    TitleLabel.Size            = UDim2.new(1,-80,1,0)
    TitleLabel.Position        = UDim2.new(0, LogoId~="" and 46 or 12, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text            = Title .. (SubTitle~="" and ("  •  "..SubTitle) or "")
    TitleLabel.TextColor3      = T.Text
    TitleLabel.TextSize        = 15
    TitleLabel.Font            = Enum.Font.GothamBold
    TitleLabel.TextXAlignment  = Enum.TextXAlignment.Left

    -- Botão fechar (X)
    local CloseBtn = Instance.new("TextButton", TopBar)
    CloseBtn.Size              = UDim2.new(0,28,0,28)
    CloseBtn.Position          = UDim2.new(1,-36,0.5,-14)
    CloseBtn.BackgroundColor3  = Color3.fromRGB(200,60,60)
    CloseBtn.Text              = "✕"
    CloseBtn.TextColor3        = Color3.new(1,1,1)
    CloseBtn.TextSize          = 13
    CloseBtn.Font              = Enum.Font.GothamBold
    CloseBtn.BorderSizePixel   = 0
    Corner(CloseBtn, 6)
    CloseBtn.MouseButton1Click:Connect(function()
        Tween(MainFrame, {Size = UDim2.new(0, Size.Width, 0, 0)}, 0.2)
        task.delay(0.22, function() MainFrame.Visible = false
            MainFrame.Size = UDim2.new(0, Size.Width, 0, Size.Height)
        end)
    end)

    -- Arrastar pela TopBar
    MakeDraggable(TopBar, MainFrame)

    -- ── TabBar ──
    local TabBar = Instance.new("Frame", MainFrame)
    TabBar.Name             = "TabBar"
    TabBar.Size             = UDim2.new(0, 110, 1, -44)
    TabBar.Position         = UDim2.new(0, 0, 0, 44)
    TabBar.BackgroundColor3 = T.Secondary
    TabBar.BorderSizePixel  = 0

    local TabList = Instance.new("ScrollingFrame", TabBar)
    TabList.Size                 = UDim2.new(1,0,1,0)
    TabList.BackgroundTransparency = 1
    TabList.BorderSizePixel      = 0
    TabList.ScrollBarThickness   = 2
    TabList.ScrollBarImageColor3 = T.Accent
    TabList.CanvasSize           = UDim2.new(0,0,0,0)
    TabList.AutomaticCanvasSize  = Enum.AutomaticSize.Y
    Padding(TabList,8,8,6,6)
    ListLayout(TabList, 4)

    -- Separador vertical
    local Sep = Instance.new("Frame", MainFrame)
    Sep.Size             = UDim2.new(0,1,1,-44)
    Sep.Position         = UDim2.new(0,110,0,44)
    Sep.BackgroundColor3 = T.Border
    Sep.BorderSizePixel  = 0

    -- ── ContentArea ──
    local ContentArea = Instance.new("Frame", MainFrame)
    ContentArea.Name             = "ContentArea"
    ContentArea.Size             = UDim2.new(1,-111,1,-44)
    ContentArea.Position         = UDim2.new(0,111,0,44)
    ContentArea.BackgroundTransparency = 1
    ContentArea.ClipsDescendants = true

    -- Toggle via botão flutuante
    ToggleBtn.MouseButton1Click:Connect(function()
        if MainFrame.Visible then
            Tween(MainFrame, {Size = UDim2.new(0, Size.Width, 0, 0)}, 0.18)
            task.delay(0.2, function()
                MainFrame.Visible = false
                MainFrame.Size = UDim2.new(0, Size.Width, 0, Size.Height)
            end)
        else
            MainFrame.Visible = true
            MainFrame.Size = UDim2.new(0, Size.Width, 0, 0)
            Tween(MainFrame, {Size = UDim2.new(0, Size.Width, 0, Size.Height)}, 0.2)
        end
    end)

    -- Toggle via teclado
    UserInputService.InputBegan:Connect(function(input, gpe)
        if not gpe and input.KeyCode == ToggleKey then
            ToggleBtn.MouseButton1Click:Fire()
        end
    end)

    -- ── WindowObj ────────────────────────────────
    local WindowObj = {}
    local Tabs = {}
    local ActiveTab = nil

    local function SetActiveTab(tabObj)
        if ActiveTab == tabObj then return end
        if ActiveTab then
            Tween(ActiveTab.Button, {BackgroundColor3 = T.Element}, 0.15)
            ActiveTab.Button.TextColor3 = T.SubText
            if ActiveTab.BtnIcon then ActiveTab.BtnIcon.ImageColor3 = T.SubText end
            ActiveTab.Page.Visible = false
        end
        ActiveTab = tabObj
        Tween(tabObj.Button, {BackgroundColor3 = T.Accent}, 0.15)
        tabObj.Button.TextColor3 = T.Text
        if tabObj.BtnIcon then tabObj.BtnIcon.ImageColor3 = T.Text end
        tabObj.Page.Visible = true
    end

    -- ── MakeTab ──
    function WindowObj:MakeTab(tabConfig)
        tabConfig = tabConfig or {}
        local TabName  = tabConfig.Name   or "Tab"
        local TabIcon  = tabConfig.Icon   or ""  -- ImageId

        -- Botão da tab
        local TabBtn = Instance.new("TextButton", TabList)
        TabBtn.Size              = UDim2.new(1,0,0,34)
        TabBtn.BackgroundColor3  = T.Element
        TabBtn.Text              = TabIcon=="" and TabName or "  "..TabName
        TabBtn.TextColor3        = T.SubText
        TabBtn.TextSize          = 12
        TabBtn.Font              = Enum.Font.GothamSemibold
        TabBtn.TextXAlignment    = Enum.TextXAlignment.Left
        TabBtn.BorderSizePixel   = 0
        Corner(TabBtn,6)
        Padding(TabBtn,0,0,TabIcon~=""and 32 or 8,6)

        local BtnIcon
        if TabIcon ~= "" then
            BtnIcon = Instance.new("ImageLabel", TabBtn)
            BtnIcon.Size = UDim2.new(0,16,0,16)
            BtnIcon.Position = UDim2.new(0, 5, 0.5, -9)
            BtnIcon.BackgroundTransparency= 1
            BtnIcon.Image                 = TabIcon
            BtnIcon.ImageColor3           = T.SubText
        end

        -- Hover
        TabBtn.MouseEnter:Connect(function()
            if ActiveTab and ActiveTab.Button == TabBtn then return end
            Tween(TabBtn, {BackgroundColor3 = T.ElementHover}, 0.12)
        end)
        TabBtn.MouseLeave:Connect(function()
            if ActiveTab and ActiveTab.Button == TabBtn then return end
            Tween(TabBtn, {BackgroundColor3 = T.Element}, 0.12)
        end)

        -- Página da tab (ScrollingFrame)
        local Page = Instance.new("ScrollingFrame", ContentArea)
        Page.Size                 = UDim2.new(1,0,1,0)
        Page.BackgroundTransparency = 1
        Page.BorderSizePixel      = 0
        Page.ScrollBarThickness   = 3
        Page.ScrollBarImageColor3 = T.Accent
        Page.CanvasSize           = UDim2.new(0,0,0,0)
        Page.AutomaticCanvasSize  = Enum.AutomaticSize.Y
        Page.Visible              = false
        Padding(Page,10,10,10,10)
        ListLayout(Page, 6)

        local tabObj = { Button = TabBtn, BtnIcon = BtnIcon, Page = Page }
        table.insert(Tabs, tabObj)

        TabBtn.MouseButton1Click:Connect(function()
            SetActiveTab(tabObj)
        end)

        if #Tabs == 1 then SetActiveTab(tabObj) end

        -- ── TabFunctions ──────────────────────────
        local TabFunctions = {}

        -- ─── Section Label ───
        function TabFunctions:MakeSection(name)
            local SectionLbl = Instance.new("TextLabel", Page)
            SectionLbl.Size              = UDim2.new(1,-4,0,22)
            SectionLbl.BackgroundTransparency = 1
            SectionLbl.Text              = (name or ""):upper()
            SectionLbl.TextColor3        = T.Accent
            SectionLbl.TextSize          = 10
            SectionLbl.Font              = Enum.Font.GothamBold
            SectionLbl.TextXAlignment    = Enum.TextXAlignment.Left
            local line = Instance.new("Frame", SectionLbl)
            line.Size             = UDim2.new(1,0,0,1)
            line.Position         = UDim2.new(0,0,1,-1)
            line.BackgroundColor3 = T.Border
            line.BorderSizePixel  = 0
        end

        -- ─── Button (com ImageId opcional) ───
        function TabFunctions:MakeButton(btnConfig)
            btnConfig = btnConfig or {}
            local Name     = btnConfig.Name     or "Button"
            local Callback = btnConfig.Callback or function() end
            local ImageId  = btnConfig.Image    or ""
            local Desc     = btnConfig.Desc     or ""

            local Btn = Instance.new("TextButton", Page)
            Btn.Size             = UDim2.new(1,-4,0,40)
            Btn.BackgroundColor3 = T.Element
            Btn.Text             = ""
            Btn.BorderSizePixel  = 0
            Corner(Btn, 8)
            Stroke(Btn, T.Border, 1)

            if ImageId ~= "" then
                local Ico = Instance.new("ImageLabel", Btn)
                Ico.Size                  = UDim2.new(0,22,0,22)
                Ico.Position              = UDim2.new(0,10,0.5,-11)
                Ico.BackgroundTransparency = 1
                Ico.Image                 = ImageId
            end

            local BtnLabel = Instance.new("TextLabel", Btn)
            BtnLabel.Size             = UDim2.new(1,-(ImageId~=""and 42 or 14),1,0)
            BtnLabel.Position         = UDim2.new(0,ImageId~=""and 40 or 12,0,0)
            BtnLabel.BackgroundTransparency = 1
            BtnLabel.Text             = Name
            BtnLabel.TextColor3       = T.Text
            BtnLabel.TextSize         = 13
            BtnLabel.Font             = Enum.Font.GothamSemibold
            BtnLabel.TextXAlignment   = Enum.TextXAlignment.Left

            if Desc ~= "" then
                BtnLabel.Size     = UDim2.new(1,-(ImageId~=""and 42 or 14),0,20)
                BtnLabel.Position = UDim2.new(0,ImageId~=""and 40 or 12,0,4)
                local DescLbl = Instance.new("TextLabel", Btn)
                DescLbl.Size             = UDim2.new(1,-(ImageId~=""and 42 or 14),0,14)
                DescLbl.Position         = UDim2.new(0,ImageId~=""and 40 or 12,0,22)
                DescLbl.BackgroundTransparency = 1
                DescLbl.Text             = Desc
                DescLbl.TextColor3       = T.SubText
                DescLbl.TextSize         = 10
                DescLbl.Font             = Enum.Font.Gotham
                DescLbl.TextXAlignment   = Enum.TextXAlignment.Left
            end

            -- Arrow icon
            local Arrow = Instance.new("TextLabel", Btn)
            Arrow.Size             = UDim2.new(0,20,1,0)
            Arrow.Position         = UDim2.new(1,-24,0,0)
            Arrow.BackgroundTransparency = 1
            Arrow.Text             = "›"
            Arrow.TextColor3       = T.SubText
            Arrow.TextSize         = 20
            Arrow.Font             = Enum.Font.GothamBold

            Btn.MouseEnter:Connect(function()
                Tween(Btn, {BackgroundColor3 = T.ElementHover}, 0.12)
            end)
            Btn.MouseLeave:Connect(function()
                Tween(Btn, {BackgroundColor3 = T.Element}, 0.12)
            end)
            Btn.MouseButton1Click:Connect(function()
                Tween(Btn, {BackgroundColor3 = T.Accent}, 0.08)
                task.delay(0.15, function()
                    Tween(Btn, {BackgroundColor3 = T.Element}, 0.15)
                end)
                Callback()
            end)
        end

        -- ─── Toggle ───
        function TabFunctions:MakeToggle(tConfig)
            tConfig = tConfig or {}
            local Name     = tConfig.Name     or "Toggle"
            local Default  = tConfig.Default  ~= nil and tConfig.Default or false
            local Callback = tConfig.Callback or function() end

            local state = Default

            local Row = Instance.new("Frame", Page)
            Row.Size             = UDim2.new(1,-4,0,40)
            Row.BackgroundColor3 = T.Element
            Row.BorderSizePixel  = 0
            Corner(Row, 8)
            Stroke(Row, T.Border, 1)

            local Lbl = Instance.new("TextLabel", Row)
            Lbl.Size             = UDim2.new(1,-60,1,0)
            Lbl.Position         = UDim2.new(0,12,0,0)
            Lbl.BackgroundTransparency = 1
            Lbl.Text             = Name
            Lbl.TextColor3       = T.Text
            Lbl.TextSize         = 13
            Lbl.Font             = Enum.Font.GothamSemibold
            Lbl.TextXAlignment   = Enum.TextXAlignment.Left

            -- Track
            local Track = Instance.new("Frame", Row)
            Track.Size             = UDim2.new(0,44,0,24)
            Track.Position         = UDim2.new(1,-54,0.5,-12)
            Track.BackgroundColor3 = state and T.Toggle_On or T.Toggle_Off
            Track.BorderSizePixel  = 0
            Corner(Track, 12)

            -- Thumb
            local Thumb = Instance.new("Frame", Track)
            Thumb.Size             = UDim2.new(0,18,0,18)
            Thumb.Position         = state and UDim2.new(1,-21,0.5,-9) or UDim2.new(0,3,0.5,-9)
            Thumb.BackgroundColor3 = Color3.new(1,1,1)
            Thumb.BorderSizePixel  = 0
            Corner(Thumb, 9)

            local function UpdateToggle()
                Tween(Track, {BackgroundColor3 = state and T.Toggle_On or T.Toggle_Off}, 0.18)
                Tween(Thumb, {Position = state and UDim2.new(1,-21,0.5,-9) or UDim2.new(0,3,0.5,-9)}, 0.18)
            end

            local ClickBtn = Instance.new("TextButton", Row)
            ClickBtn.Size             = UDim2.new(1,0,1,0)
            ClickBtn.BackgroundTransparency = 1
            ClickBtn.Text             = ""
            ClickBtn.MouseButton1Click:Connect(function()
                state = not state
                UpdateToggle()
                Callback(state)
            end)

            Row.MouseEnter:Connect(function()
                Tween(Row, {BackgroundColor3 = T.ElementHover}, 0.12)
            end)
            Row.MouseLeave:Connect(function()
                Tween(Row, {BackgroundColor3 = T.Element}, 0.12)
            end)

            UpdateToggle()

            -- Retorna objeto para controle externo
            local obj = {}
            function obj:Set(val)
                state = val
                UpdateToggle()
                Callback(state)
            end
            function obj:Get() return state end
            return obj
        end

function TabFunctions:MakeImage(imgConfig)
	imgConfig = imgConfig or {}
	local ImageId = imgConfig.Image   or ""
	local Width   = imgConfig.Width   or 1
	local Height  = imgConfig.Height  or 120
	local Desc    = imgConfig.Desc    or ""

	local Container = Instance.new("Frame", Page)
	Container.Size             = UDim2.new(1,-4,0, Desc~="" and Height+24 or Height)
	Container.BackgroundColor3 = T.Element
	Container.BorderSizePixel  = 0
	local cr = Instance.new("UICorner", Container)
	cr.CornerRadius = UDim.new(0,8)
	local cs = Instance.new("UIStroke", Container)
	cs.Color = T.Border cs.Thickness = 1

	local Img = Instance.new("ImageLabel", Container)
	Img.Size                  = UDim2.new(Width,0,0,Height)
	Img.AnchorPoint           = Vector2.new(0.5,0)
	Img.Position              = UDim2.new(0.5,0,0,0)
	Img.BackgroundTransparency = 1
	Img.Image                 = ImageId
	Img.ScaleType             = Enum.ScaleType.Fit
	local ic = Instance.new("UICorner", Img)
	ic.CornerRadius = UDim.new(0,8)

	if Desc ~= "" then
		local DescLbl = Instance.new("TextLabel", Container)
		DescLbl.Size                  = UDim2.new(1,-16,0,20)
		DescLbl.Position              = UDim2.new(0,8,0,Height+2)
		DescLbl.BackgroundTransparency = 1
		DescLbl.Text                  = Desc
		DescLbl.TextColor3            = T.SubText
		DescLbl.TextSize              = 11
		DescLbl.Font                  = Enum.Font.Gotham
		DescLbl.TextXAlignment        = Enum.TextXAlignment.Center
	end

	local obj = {}
	function obj:Set(id) Img.Image = id end
	function obj:Get() return Img.Image end
	return obj
end

        -- ─── Slider ───
        function TabFunctions:MakeSlider(sConfig)
            sConfig = sConfig or {}
            local Name     = sConfig.Name     or "Slider"
            local Min      = sConfig.Min      or 0
            local Max      = sConfig.Max      or 100
            local Default  = sConfig.Default  or Min
            local Suffix   = sConfig.Suffix   or ""
            local Callback = sConfig.Callback or function() end

            local value = math.clamp(Default, Min, Max)

            local Container = Instance.new("Frame", Page)
            Container.Size             = UDim2.new(1,-4,0,52)
            Container.BackgroundColor3 = T.Element
            Container.BorderSizePixel  = 0
            Corner(Container, 8)
            Stroke(Container, T.Border, 1)

            local TopRow = Instance.new("Frame", Container)
            TopRow.Size             = UDim2.new(1,-16,0,26)
            TopRow.Position         = UDim2.new(0,8,0,6)
            TopRow.BackgroundTransparency = 1

            local NameLbl = Instance.new("TextLabel", TopRow)
            NameLbl.Size             = UDim2.new(0.6,0,1,0)
            NameLbl.BackgroundTransparency = 1
            NameLbl.Text             = Name
            NameLbl.TextColor3       = T.Text
            NameLbl.TextSize         = 13
            NameLbl.Font             = Enum.Font.GothamSemibold
            NameLbl.TextXAlignment   = Enum.TextXAlignment.Left

            local ValLbl = Instance.new("TextLabel", TopRow)
            ValLbl.Size            = UDim2.new(0.4,0,1,0)
            ValLbl.Position        = UDim2.new(0.6,0,0,0)
            ValLbl.BackgroundTransparency = 1
            ValLbl.Text            = tostring(value)..Suffix
            ValLbl.TextColor3      = T.Accent
            ValLbl.TextSize        = 13
            ValLbl.Font            = Enum.Font.GothamBold
            ValLbl.TextXAlignment  = Enum.TextXAlignment.Right

            -- Track
            local TrackBg = Instance.new("Frame", Container)
            TrackBg.Size             = UDim2.new(1,-16,0,8)
            TrackBg.Position         = UDim2.new(0,8,0,36)
            TrackBg.BackgroundColor3 = T.Secondary
            TrackBg.BorderSizePixel  = 0
            Corner(TrackBg, 4)

            local Fill = Instance.new("Frame", TrackBg)
            Fill.Size             = UDim2.new((value-Min)/(Max-Min),0,1,0)
            Fill.BackgroundColor3 = T.SliderFill
            Fill.BorderSizePixel  = 0
            Corner(Fill, 4)

            -- Thumb
            local Thumb = Instance.new("Frame", TrackBg)
            Thumb.Size             = UDim2.new(0,14,0,14)
            Thumb.AnchorPoint      = Vector2.new(0.5,0.5)
            Thumb.Position         = UDim2.new((value-Min)/(Max-Min),0,0.5,0)
            Thumb.BackgroundColor3 = Color3.new(1,1,1)
            Thumb.BorderSizePixel  = 0
            Corner(Thumb, 7)
            Stroke(Thumb, T.SliderFill, 2)

            local draggingSlider = false

            local function UpdateSlider(inputPos)
                local absPos  = TrackBg.AbsolutePosition.X
                local absSize = TrackBg.AbsoluteSize.X
                local rel = math.clamp((inputPos - absPos) / absSize, 0, 1)
                value = math.floor(Min + rel*(Max-Min) + 0.5)
                local pct = (value-Min)/(Max-Min)
                Fill.Size     = UDim2.new(pct,0,1,0)
                Thumb.Position = UDim2.new(pct,0,0.5,0)
                ValLbl.Text   = tostring(value)..Suffix
                Callback(value)
            end

            TrackBg.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1
                or inp.UserInputType == Enum.UserInputType.Touch then
                    draggingSlider = true
                    UpdateSlider(inp.Position.X)
                end
            end)
            UserInputService.InputChanged:Connect(function(inp)
                if draggingSlider and (
                    inp.UserInputType == Enum.UserInputType.MouseMovement or
                    inp.UserInputType == Enum.UserInputType.Touch
                ) then UpdateSlider(inp.Position.X) end
            end)
            UserInputService.InputEnded:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1
                or inp.UserInputType == Enum.UserInputType.Touch then
                    draggingSlider = false
                end
            end)

            local obj = {}
            function obj:Set(v)
                value = math.clamp(math.floor(v+0.5), Min, Max)
                local pct = (value-Min)/(Max-Min)
                Fill.Size      = UDim2.new(pct,0,1,0)
                Thumb.Position = UDim2.new(pct,0,0.5,0)
                ValLbl.Text    = tostring(value)..Suffix
                Callback(value)
            end
            function obj:Get() return value end
            return obj
        end

        -- ─── Dropdown ───
        function TabFunctions:MakeDropdown(dConfig)
            dConfig = dConfig or {}
            local Name     = dConfig.Name     or "Dropdown"
            local Options  = dConfig.Options  or {}
            local Default  = dConfig.Default  or (Options[1] or "Selecione")
            local Callback = dConfig.Callback or function() end
            local Multi    = dConfig.Multi    or false  -- multi-select

            local selected = Multi and {} or Default
            if Multi and Default then selected[Default] = true end

            local isOpen = false

            local Wrapper = Instance.new("Frame", Page)
            Wrapper.Size             = UDim2.new(1,-4,0,40)
            Wrapper.BackgroundColor3 = T.Element
            Wrapper.BorderSizePixel  = 0
            Wrapper.ClipsDescendants = false
            Wrapper.ZIndex           = 5
            Corner(Wrapper, 8)
            Stroke(Wrapper, T.Border, 1)

            local Header = Instance.new("TextButton", Wrapper)
            Header.Size             = UDim2.new(1,0,1,0)
            Header.BackgroundTransparency = 1
            Header.Text             = ""
            Header.ZIndex           = 6

            local NameLbl = Instance.new("TextLabel", Wrapper)
            NameLbl.Size            = UDim2.new(0.5,0,1,0)
            NameLbl.Position        = UDim2.new(0,12,0,0)
            NameLbl.BackgroundTransparency = 1
            NameLbl.Text            = Name
            NameLbl.TextColor3      = T.Text
            NameLbl.TextSize        = 13
            NameLbl.Font            = Enum.Font.GothamSemibold
            NameLbl.TextXAlignment  = Enum.TextXAlignment.Left
            NameLbl.ZIndex          = 6

            local SelLbl = Instance.new("TextLabel", Wrapper)
            SelLbl.Size             = UDim2.new(0.45,-10,1,0)
            SelLbl.Position         = UDim2.new(0.5,0,0,0)
            SelLbl.BackgroundTransparency = 1
            SelLbl.Text             = Multi and "Selecione..." or Default
            SelLbl.TextColor3       = T.SubText
            SelLbl.TextSize         = 12
            SelLbl.Font             = Enum.Font.Gotham
            SelLbl.TextXAlignment   = Enum.TextXAlignment.Right
            SelLbl.ZIndex           = 6
            SelLbl.TextTruncate     = Enum.TextTruncate.AtEnd

            local Arrow = Instance.new("TextLabel", Wrapper)
            Arrow.Size             = UDim2.new(0,16,1,0)
            Arrow.Position         = UDim2.new(1,-22,0,0)
            Arrow.BackgroundTransparency = 1
            Arrow.Text             = "▾"
            Arrow.TextColor3       = T.SubText
            Arrow.TextSize         = 14
            Arrow.Font             = Enum.Font.GothamBold
            Arrow.ZIndex           = 6

            -- Dropdown list
            local DropList = Instance.new("Frame", Wrapper)
            DropList.Size             = UDim2.new(1,0,0,0)
            DropList.Position         = UDim2.new(0,0,1,4)
            DropList.BackgroundColor3 = T.Secondary
            DropList.BorderSizePixel  = 0
            DropList.ClipsDescendants = true
            DropList.ZIndex           = 20
            DropList.Visible          = false
            Corner(DropList, 8)
            Stroke(DropList, T.Border, 1)

            local DropScroll = Instance.new("ScrollingFrame", DropList)
            DropScroll.Size                 = UDim2.new(1,-4,1,0)
            DropScroll.Position             = UDim2.new(0,2,0,0)
            DropScroll.BackgroundTransparency = 1
            DropScroll.BorderSizePixel      = 0
            DropScroll.ScrollBarThickness   = 2
            DropScroll.ScrollBarImageColor3 = T.Accent
            DropScroll.CanvasSize           = UDim2.new(0,0,0,0)
            DropScroll.AutomaticCanvasSize  = Enum.AutomaticSize.Y
            DropScroll.ZIndex               = 21
            Padding(DropScroll,4,4,0,0)
            ListLayout(DropScroll,2)

            local maxVisible = math.min(#Options, 5)
            local itemH = 32

            local function UpdateSelLabel()
                if Multi then
                    local t = {}
                    for k in pairs(selected) do table.insert(t,k) end
                    SelLbl.Text = #t>0 and table.concat(t,", ") or "Selecione..."
                else
                    SelLbl.Text = selected
                end
            end

            local function BuildOptions()
                for _, child in ipairs(DropScroll:GetChildren()) do
                    if child:IsA("GuiObject") then child:Destroy() end
                end
                for _, opt in ipairs(Options) do
                    local optBtn = Instance.new("TextButton", DropScroll)
                    optBtn.Size             = UDim2.new(1,0,0,itemH)
                    optBtn.BackgroundColor3 = T.Element
                    optBtn.Text             = opt
                    optBtn.TextColor3       = (Multi and selected[opt]) and T.Accent or T.Text
                    optBtn.TextSize         = 12
                    optBtn.Font             = (Multi and selected[opt]) and Enum.Font.GothamBold or Enum.Font.Gotham
                    optBtn.BorderSizePixel  = 0
                    optBtn.ZIndex           = 22
                    Corner(optBtn, 6)

                    optBtn.MouseEnter:Connect(function()
                        Tween(optBtn, {BackgroundColor3 = T.ElementHover}, 0.1)
                    end)
                    optBtn.MouseLeave:Connect(function()
                        local active = Multi and selected[opt] or (selected==opt)
                        Tween(optBtn, {BackgroundColor3 = active and T.Accent or T.Element}, 0.1)
                    end)
                    optBtn.MouseButton1Click:Connect(function()
                        if Multi then
                            selected[opt] = not selected[opt] or nil
                            optBtn.TextColor3 = selected[opt] and T.Accent or T.Text
                            optBtn.Font = selected[opt] and Enum.Font.GothamBold or Enum.Font.Gotham
                            local t = {}
                            for k in pairs(selected) do table.insert(t,k) end
                            Callback(t)
                        else
                            selected = opt
                            Tween(DropList, {Size = UDim2.new(1,0,0,0)}, 0.15)
                            task.delay(0.16, function() DropList.Visible = false end)
                            isOpen = false
                            Tween(Arrow, {Rotation = 0}, 0.15)
                            Callback(selected)
                        end
                        UpdateSelLabel()
                    end)
                end
            end
            BuildOptions()

            Header.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    DropList.Visible = true
                    DropList.Size = UDim2.new(1,0,0,0)
                    Tween(DropList, {Size = UDim2.new(1,0,0,math.min(#Options,5)*itemH+8)}, 0.18)
                    Tween(Arrow, {Rotation = 180}, 0.18)
                else
                    Tween(DropList, {Size = UDim2.new(1,0,0,0)}, 0.15)
                    task.delay(0.16, function() DropList.Visible = false end)
                    Tween(Arrow, {Rotation = 0}, 0.15)
                end
            end)

            Wrapper.MouseEnter:Connect(function()
                Tween(Wrapper, {BackgroundColor3 = T.ElementHover}, 0.12)
            end)
            Wrapper.MouseLeave:Connect(function()
                Tween(Wrapper, {BackgroundColor3 = T.Element}, 0.12)
            end)

            local obj = {}
            function obj:Set(val)
                if Multi then
                    selected = {}
                    if type(val)=="table" then
                        for _,v in ipairs(val) do selected[v]=true end
                    end
                else
                    selected = val
                end
                UpdateSelLabel()
                BuildOptions()
            end
            function obj:Get() return selected end
            function obj:Refresh(newOptions)
                Options = newOptions
                BuildOptions()
            end
            return obj
        end

        -- ─── TextBox (Input) ───
        function TabFunctions:MakeInput(iConfig)
            iConfig = iConfig or {}
            local Name        = iConfig.Name        or "Input"
            local Placeholder = iConfig.Placeholder or "Digite aqui..."
            local Default     = iConfig.Default     or ""
            local Callback    = iConfig.Callback    or function() end
            local ClearOnFocus = iConfig.ClearOnFocus ~= nil and iConfig.ClearOnFocus or false

            local Container = Instance.new("Frame", Page)
            Container.Size             = UDim2.new(1,-4,0,52)
            Container.BackgroundColor3 = T.Element
            Container.BorderSizePixel  = 0
            Corner(Container, 8)
            Stroke(Container, T.Border, 1)

            local Lbl = Instance.new("TextLabel", Container)
            Lbl.Size             = UDim2.new(1,-16,0,20)
            Lbl.Position         = UDim2.new(0,10,0,4)
            Lbl.BackgroundTransparency = 1
            Lbl.Text             = Name
            Lbl.TextColor3       = T.SubText
            Lbl.TextSize         = 11
            Lbl.Font             = Enum.Font.Gotham
            Lbl.TextXAlignment   = Enum.TextXAlignment.Left

            local Box = Instance.new("TextBox", Container)
            Box.Size             = UDim2.new(1,-16,0,22)
            Box.Position         = UDim2.new(0,10,0,24)
            Box.BackgroundColor3 = T.Secondary
            Box.TextColor3       = T.Text
            Box.PlaceholderText  = Placeholder
            Box.PlaceholderColor3 = T.SubText
            Box.Text             = Default
            Box.TextSize         = 13
            Box.Font             = Enum.Font.Gotham
            Box.TextXAlignment   = Enum.TextXAlignment.Left
            Box.ClearTextOnFocus = ClearOnFocus
            Box.BorderSizePixel  = 0
            Corner(Box, 6)
            Padding(Box,0,0,6,6)

            Box.FocusLost:Connect(function(enter)
                Callback(Box.Text, enter)
            end)

            Container.MouseEnter:Connect(function()
                Tween(Container,{BackgroundColor3=T.ElementHover},0.12)
            end)
            Container.MouseLeave:Connect(function()
                Tween(Container,{BackgroundColor3=T.Element},0.12)
            end)

            local obj = {}
            function obj:Set(v) Box.Text = v end
            function obj:Get() return Box.Text end
            return obj
        end

        -- ─── Label ───
        function TabFunctions:MakeLabel(text, color)
            local Lbl = Instance.new("TextLabel", Page)
            Lbl.Size             = UDim2.new(1,-4,0,30)
            Lbl.BackgroundTransparency = 1
            Lbl.Text             = text or ""
            Lbl.TextColor3       = color or T.SubText
            Lbl.TextSize         = 12
            Lbl.Font             = Enum.Font.Gotham
            Lbl.TextXAlignment   = Enum.TextXAlignment.Left
            Lbl.TextWrapped      = true
            Padding(Lbl,0,0,12,4)
            return { Set = function(_, t) Lbl.Text = t end }
        end

        -- ─── ColorPicker (simples, HSV) ───
        function TabFunctions:MakeColorPicker(cpConfig)
            cpConfig = cpConfig or {}
            local Name     = cpConfig.Name     or "Cor"
            local Default  = cpConfig.Default  or Color3.fromRGB(255,100,100)
            local Callback = cpConfig.Callback or function() end

            local h,s,v = Color3.toHSV(Default)
            local currentColor = Default

            local Container = Instance.new("Frame", Page)
            Container.Size             = UDim2.new(1,-4,0,40)
            Container.BackgroundColor3 = T.Element
            Container.BorderSizePixel  = 0
            Corner(Container,8)
            Stroke(Container,T.Border,1)

            local Lbl = Instance.new("TextLabel", Container)
            Lbl.Size             = UDim2.new(0.7,0,1,0)
            Lbl.Position         = UDim2.new(0,12,0,0)
            Lbl.BackgroundTransparency = 1
            Lbl.Text             = Name
            Lbl.TextColor3       = T.Text
            Lbl.TextSize         = 13
            Lbl.Font             = Enum.Font.GothamSemibold
            Lbl.TextXAlignment   = Enum.TextXAlignment.Left

            local Preview = Instance.new("Frame", Container)
            Preview.Size             = UDim2.new(0,30,0,22)
            Preview.Position         = UDim2.new(1,-42,0.5,-11)
            Preview.BackgroundColor3 = currentColor
            Preview.BorderSizePixel  = 0
            Corner(Preview,6)
            Stroke(Preview,T.Border,1)

            -- Mini pickers de H/S/V
            local PickerOpen = false
            local PickerFrame

            local OpenBtn = Instance.new("TextButton", Container)
            OpenBtn.Size             = UDim2.new(1,0,1,0)
            OpenBtn.BackgroundTransparency = 1
            OpenBtn.Text             = ""

            local function BuildPicker()
                if PickerFrame then PickerFrame:Destroy() end
                PickerFrame = Instance.new("Frame", Container)
                PickerFrame.Size             = UDim2.new(1,0,0,90)
                PickerFrame.Position         = UDim2.new(0,0,1,4)
                PickerFrame.BackgroundColor3 = T.Secondary
                PickerFrame.BorderSizePixel  = 0
                PickerFrame.ZIndex           = 10
                Corner(PickerFrame,8)
                Stroke(PickerFrame,T.Border,1)
                Padding(PickerFrame,6,6,8,8)

                local labels = {"H","S","V"}
                local vals   = {h,s,v}
                local setFns = {}

                for i,label in ipairs(labels) do
                    local row = Instance.new("Frame", PickerFrame)
                    row.Size             = UDim2.new(1,-16,0,20)
                    row.Position         = UDim2.new(0,8,0,(i-1)*26)
                    row.BackgroundTransparency = 1
                    row.ZIndex = 11

                    local ll = Instance.new("TextLabel", row)
                    ll.Size = UDim2.new(0,16,1,0)
                    ll.BackgroundTransparency=1
                    ll.Text=label ll.TextColor3=T.SubText ll.TextSize=11 ll.Font=Enum.Font.GothamBold ll.ZIndex=11

                    local track = Instance.new("Frame",row)
                    track.Size=UDim2.new(1,-20,0,8) track.Position=UDim2.new(0,18,0.5,-4)
                    track.BackgroundColor3=T.Background track.BorderSizePixel=0 track.ZIndex=11
                    Corner(track,4)

                    local fill = Instance.new("Frame",track)
                    fill.Size=UDim2.new(vals[i],0,1,0) fill.BackgroundColor3=T.Accent
                    fill.BorderSizePixel=0 fill.ZIndex=12 Corner(fill,4)

                    local draggingCP=false
                    track.InputBegan:Connect(function(inp)
                        if inp.UserInputType==Enum.UserInputType.MouseButton1
                        or inp.UserInputType==Enum.UserInputType.Touch then
                            draggingCP=true
                            local rel=math.clamp((inp.Position.X-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)
                            vals[i]=rel fill.Size=UDim2.new(rel,0,1,0)
                            h,s,v=vals[1],vals[2],vals[3]
                            currentColor=Color3.fromHSV(h,s,v)
                            Preview.BackgroundColor3=currentColor
                            Callback(currentColor)
                        end
                    end)
                    UserInputService.InputChanged:Connect(function(inp)
                        if draggingCP and (inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch) then
                            local rel=math.clamp((inp.Position.X-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)
                            vals[i]=rel fill.Size=UDim2.new(rel,0,1,0)
                            h,s,v=vals[1],vals[2],vals[3]
                            currentColor=Color3.fromHSV(h,s,v)
                            Preview.BackgroundColor3=currentColor
                            Callback(currentColor)
                        end
                    end)
                    UserInputService.InputEnded:Connect(function(inp)
                        if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then draggingCP=false end
                    end)
                end

                Container.Size = UDim2.new(1,-4,0,136)
            end

            OpenBtn.MouseButton1Click:Connect(function()
                PickerOpen = not PickerOpen
                if PickerOpen then
                    BuildPicker()
                    Container.ClipsDescendants = false
                else
                    if PickerFrame then PickerFrame:Destroy() end
                    Container.Size = UDim2.new(1,-4,0,40)
                end
            end)
            Container.MouseEnter:Connect(function() Tween(Container,{BackgroundColor3=T.ElementHover},0.12) end)
            Container.MouseLeave:Connect(function() Tween(Container,{BackgroundColor3=T.Element},0.12) end)

            local obj={}
            function obj:Set(c)
                currentColor=c Preview.BackgroundColor3=c h,s,v=Color3.toHSV(c)
                Callback(c)
            end
            function obj:Get() return currentColor end
            return obj
        end

        -- ─── Keybind ───
        function TabFunctions:MakeKeybind(kbConfig)
            kbConfig = kbConfig or {}
            local Name     = kbConfig.Name     or "Keybind"
            local Default  = kbConfig.Default  or Enum.KeyCode.E
            local Callback = kbConfig.Callback or function() end

            local currentKey = Default
            local listening  = false

            local Row = Instance.new("Frame", Page)
            Row.Size             = UDim2.new(1,-4,0,40)
            Row.BackgroundColor3 = T.Element
            Row.BorderSizePixel  = 0
            Corner(Row,8)
            Stroke(Row,T.Border,1)

            local Lbl = Instance.new("TextLabel", Row)
            Lbl.Size            = UDim2.new(0.6,0,1,0)
            Lbl.Position        = UDim2.new(0,12,0,0)
            Lbl.BackgroundTransparency=1
            Lbl.Text            = Name
            Lbl.TextColor3      = T.Text
            Lbl.TextSize        = 13
            Lbl.Font            = Enum.Font.GothamSemibold
            Lbl.TextXAlignment  = Enum.TextXAlignment.Left

            local KeyBtn = Instance.new("TextButton", Row)
            KeyBtn.Size            = UDim2.new(0,80,0,26)
            KeyBtn.Position        = UDim2.new(1,-90,0.5,-13)
            KeyBtn.BackgroundColor3 = T.Secondary
            KeyBtn.TextColor3      = T.Accent
            KeyBtn.Text            = currentKey.Name
            KeyBtn.TextSize        = 12
            KeyBtn.Font            = Enum.Font.GothamBold
            KeyBtn.BorderSizePixel = 0
            Corner(KeyBtn,6)
            Stroke(KeyBtn,T.Border,1)

            KeyBtn.MouseButton1Click:Connect(function()
                if listening then return end
                listening = true
                KeyBtn.Text = "..."
                KeyBtn.TextColor3 = T.SubText
            end)

            UserInputService.InputBegan:Connect(function(inp, gpe)
                if listening and not gpe and inp.UserInputType == Enum.UserInputType.Keyboard then
                    currentKey = inp.KeyCode
                    listening = false
                    KeyBtn.Text = currentKey.Name
                    KeyBtn.TextColor3 = T.Accent
                end
                if not listening and not gpe and inp.KeyCode == currentKey then
                    Callback()
                end
            end)

            Row.MouseEnter:Connect(function() Tween(Row,{BackgroundColor3=T.ElementHover},0.12) end)
            Row.MouseLeave:Connect(function() Tween(Row,{BackgroundColor3=T.Element},0.12) end)

            local obj={}
            function obj:Set(k) currentKey=k KeyBtn.Text=k.Name end
            function obj:Get() return currentKey end
            return obj
        end

        return TabFunctions
    end

    -- ── Notificação ──────────────────────────────
    function WindowObj:Notify(nConfig)
        nConfig = nConfig or {}
        local Title    = nConfig.Title    or "Aviso"
        local Content  = nConfig.Content  or ""
        local Duration = nConfig.Duration or 3
        local Type     = nConfig.Type     or "Info" -- Info | Success | Warning | Error

        local typeColor = {
            Info    = T.Accent,
            Success = Color3.fromRGB(80,200,120),
            Warning = Color3.fromRGB(240,180,60),
            Error   = Color3.fromRGB(220,70,70),
        }
        local accent = typeColor[Type] or T.Accent

        -- Container de notificações (cria uma vez)
        local NotifContainer = ScreenGui:FindFirstChild("NotifContainer")
        if not NotifContainer then
            NotifContainer = Instance.new("Frame", ScreenGui)
            NotifContainer.Name = "NotifContainer"
            NotifContainer.Size = UDim2.new(0,280,1,0)
            NotifContainer.Position = UDim2.new(1,-290,0,0)
            NotifContainer.BackgroundTransparency = 1
            NotifContainer.BorderSizePixel = 0
            local nl = ListLayout(NotifContainer,8,Enum.FillDirection.Vertical,Enum.HorizontalAlignment.Center)
            nl.VerticalAlignment = Enum.VerticalAlignment.Bottom
            Padding(NotifContainer,8,8,0,0)
        end

        local Card = Instance.new("Frame", NotifContainer)
        Card.Size             = UDim2.new(1,-8,0,70)
        Card.BackgroundColor3 = T.Secondary
        Card.BorderSizePixel  = 0
        Card.Position         = UDim2.new(1,20,0,0)
        Corner(Card,10)
        Stroke(Card, accent, 1.5)

        local Bar = Instance.new("Frame",Card)
        Bar.Size=UDim2.new(0,3,1,-16) Bar.Position=UDim2.new(0,0,0,8)
        Bar.BackgroundColor3=accent Bar.BorderSizePixel=0 Corner(Bar,2)

        local TLbl = Instance.new("TextLabel",Card)
        TLbl.Size=UDim2.new(1,-16,0,22) TLbl.Position=UDim2.new(0,12,0,8)
        TLbl.BackgroundTransparency=1 TLbl.Text=Title TLbl.TextColor3=T.Text
        TLbl.TextSize=13 TLbl.Font=Enum.Font.GothamBold TLbl.TextXAlignment=Enum.TextXAlignment.Left

        local CLbl = Instance.new("TextLabel",Card)
        CLbl.Size=UDim2.new(1,-16,0,30) CLbl.Position=UDim2.new(0,12,0,28)
        CLbl.BackgroundTransparency=1 CLbl.Text=Content CLbl.TextColor3=T.SubText
        CLbl.TextSize=11 CLbl.Font=Enum.Font.Gotham CLbl.TextXAlignment=Enum.TextXAlignment.Left
        CLbl.TextWrapped=true

        -- Progress bar
        local Prog = Instance.new("Frame",Card)
        Prog.Size=UDim2.new(1,-16,0,2) Prog.Position=UDim2.new(0,8,1,-6)
        Prog.BackgroundColor3=accent Prog.BorderSizePixel=0 Corner(Prog,1)

        -- Slide in
        Tween(Card, {Position=UDim2.new(0,0,0,0)}, 0.25, Enum.EasingStyle.Back)
        Tween(Prog, {Size=UDim2.new(0,0,0,2)}, Duration, Enum.EasingStyle.Linear)

        task.delay(Duration, function()
            Tween(Card,{Position=UDim2.new(1,20,0,0)},0.2)
            task.delay(0.25, function() Card:Destroy() end)
        end)
    end

    -- ── ChangeTheme ──────────────────────────────
    function WindowObj:ChangeTheme(name)
        T = Themes[name] or T
    end

    return WindowObj
end

return Library
