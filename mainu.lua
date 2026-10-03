--[[
    PL MURDER - Standalone ESP Panel
    Feito para Roblox / Executor
]]

local Players           = game:GetService("Players")
local RunService        = game:GetService("RunService")
local TweenService      = game:GetService("TweenService")
local UserInputService  = game:GetService("UserInputService")

local LP = Players.LocalPlayer
local parent = (gethui and gethui()) or game:GetService("CoreGui")

if parent:FindFirstChild("PLMURDER_UI") then parent.PLMURDER_UI:Destroy() end

local Config = {
    EspName      = false,
    EspInocente  = false,
    EspMurder    = false,
    EspXerife    = false,
    EspGunDrop   = false,
    AutoKill     = false,
    KillAura     = false,
    KillAuraRange = 30,
    AutoShot     = false,
    KillMurder   = false,
    AimBot       = false,
    AimFOV       = 100,
    AimIntensity = 0.15,
    Colors = {
        Inocente = Color3.fromRGB(0, 255, 80),
        Murder   = Color3.fromRGB(255, 40, 40),
        Xerife   = Color3.fromRGB(40, 130, 255),
        GunDrop  = Color3.fromRGB(255, 220, 0),
    }
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PLMURDER_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = parent

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 470, 0, 300)
Main.Position = UDim2.new(0.5, -235, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(22, 22, 24)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ZIndex = 1
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(45, 45, 50)
MainStroke.Thickness = 1

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 36)
TitleBar.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
TitleBar.BorderSizePixel = 0
TitleBar.ZIndex = 2
TitleBar.Parent = Main
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 10)

local tbFix = Instance.new("Frame")
tbFix.Size = UDim2.new(1, 0, 0, 10)
tbFix.Position = UDim2.new(0, 0, 1, -10)
tbFix.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
tbFix.BorderSizePixel = 0
tbFix.ZIndex = 2
tbFix.Parent = TitleBar

local Skull = Instance.new("TextLabel")
Skull.Size = UDim2.new(0, 22, 0, 22)
Skull.Position = UDim2.new(0, 12, 0.5, -11)
Skull.BackgroundTransparency = 1
Skull.Text = "☠"
Skull.TextColor3 = Color3.fromRGB(235, 235, 235)
Skull.TextSize = 16
Skull.Font = Enum.Font.GothamBold
Skull.ZIndex = 3
Skull.Parent = TitleBar

local TitleLbl = Instance.new("TextLabel")
TitleLbl.Size = UDim2.new(0, 200, 0, 14)
TitleLbl.Position = UDim2.new(0, 38, 0, 4)
TitleLbl.BackgroundTransparency = 1
TitleLbl.Text = "PL MURDER"
TitleLbl.TextColor3 = Color3.fromRGB(240, 240, 240)
TitleLbl.TextSize = 12
TitleLbl.Font = Enum.Font.GothamBold
TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
TitleLbl.ZIndex = 3
TitleLbl.Parent = TitleBar

local SubLbl = Instance.new("TextLabel")
SubLbl.Size = UDim2.new(0, 200, 0, 12)
SubLbl.Position = UDim2.new(0, 38, 0, 18)
SubLbl.BackgroundTransparency = 1
SubLbl.Text = "PL MURDER"
SubLbl.TextColor3 = Color3.fromRGB(130, 130, 130)
SubLbl.TextSize = 8
SubLbl.Font = Enum.Font.Gotham
SubLbl.TextXAlignment = Enum.TextXAlignment.Left
SubLbl.ZIndex = 3
SubLbl.Parent = TitleBar

local SearchFrame = Instance.new("Frame")
SearchFrame.Name = "SearchFrame"
SearchFrame.Size = UDim2.new(0, 150, 0, 22)
SearchFrame.Position = UDim2.new(1, -210, 0.5, -11)
SearchFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 38)
SearchFrame.BorderSizePixel = 0
SearchFrame.ZIndex = 3
SearchFrame.Parent = TitleBar
Instance.new("UICorner", SearchFrame).CornerRadius = UDim.new(0, 6)

local SearchIcon = Instance.new("TextLabel")
SearchIcon.Size = UDim2.new(0, 22, 1, 0)
SearchIcon.Position = UDim2.new(0, 2, 0, 0)
SearchIcon.BackgroundTransparency = 1
SearchIcon.Text = "🔍"
SearchIcon.TextSize = 11
SearchIcon.ZIndex = 3
SearchIcon.Parent = SearchFrame

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1, -26, 1, 0)
SearchBox.Position = UDim2.new(0, 24, 0, 0)
SearchBox.BackgroundTransparency = 1
SearchBox.Text = ""
SearchBox.PlaceholderText = "Search"
SearchBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
SearchBox.TextColor3 = Color3.fromRGB(220, 220, 220)
SearchBox.TextSize = 10
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.ClearTextOnFocus = false
SearchBox.ZIndex = 3
SearchBox.Parent = SearchFrame

local function makeWindowBtn(pos, color, symbol, name)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Size = UDim2.new(0, 22, 0, 22)
    b.Position = pos
    b.BackgroundColor3 = color
    b.BorderSizePixel = 0
    b.Text = symbol
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextSize = 14
    b.Font = Enum.Font.GothamBold
    b.AutoButtonColor = false
    b.ZIndex = 3
    b.Parent = TitleBar
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)

    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = Color3.new(
            math.min(color.R + 0.15, 1),
            math.min(color.G + 0.15, 1),
            math.min(color.B + 0.15, 1)
        )}):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {BackgroundColor3 = color}):Play()
    end)
    return b
end

local CloseBtn = makeWindowBtn(UDim2.new(1, -32, 0.5, -11), Color3.fromRGB(220, 60, 55), "✕", "CloseBtn")
local MinBtn   = makeWindowBtn(UDim2.new(1, -60, 0.5, -11), Color3.fromRGB(230, 170, 40), "—", "MinBtn")

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 130, 1, -50)
Sidebar.Position = UDim2.new(0, 10, 0, 42)
Sidebar.BackgroundTransparency = 1
Sidebar.ZIndex = 2
Sidebar.Parent = Main

local SidebarList = Instance.new("UIListLayout")
SidebarList.Padding = UDim.new(0, 5)
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.Parent = Sidebar

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -155, 1, -54)
Content.Position = UDim2.new(0, 146, 0, 44)
Content.BackgroundColor3 = Color3.fromRGB(16, 16, 18)
Content.BorderSizePixel = 0
Content.ZIndex = 2
Content.Parent = Main
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

local ContentStroke = Instance.new("UIStroke", Content)
ContentStroke.Color = Color3.fromRGB(40, 40, 45)
ContentStroke.Thickness = 1

local Tabs = {}
local ActiveTab

local function createTab(name, icon)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(28, 28, 30)
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.ZIndex = 3
    btn.Parent = Sidebar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local ic = Instance.new("TextLabel")
    ic.Size = UDim2.new(0, 24, 1, 0)
    ic.Position = UDim2.new(0, 6, 0, 0)
    ic.BackgroundTransparency = 1
    ic.Text = icon or "•"
    ic.TextColor3 = Color3.fromRGB(200, 200, 200)
    ic.TextSize = 13
    ic.Font = Enum.Font.GothamBold
    ic.ZIndex = 3
    ic.Parent = btn

    local tx = Instance.new("TextLabel")
    tx.Size = UDim2.new(1, -32, 1, 0)
    tx.Position = UDim2.new(0, 30, 0, 0)
    tx.BackgroundTransparency = 1
    tx.Text = name
    tx.TextColor3 = Color3.fromRGB(200, 200, 200)
    tx.TextSize = 11
    tx.Font = Enum.Font.Gotham
    tx.TextXAlignment = Enum.TextXAlignment.Left
    tx.ZIndex = 3
    tx.Parent = btn

    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, -14, 1, -14)
    page.Position = UDim2.new(0, 7, 0, 7)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Color3.fromRGB(70, 70, 70)
    page.Visible = false
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.ZIndex = 3
    page.Parent = Content

    local pl = Instance.new("UIListLayout")
    pl.Padding = UDim.new(0, 5)
    pl.SortOrder = Enum.SortOrder.LayoutOrder
    pl.Parent = page

    local tab = { Button = btn, Page = page, Name = name }

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do
            t.Page.Visible = false
            TweenService:Create(t.Button, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(28, 28, 30)}):Play()
        end
        page.Visible = true
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(45, 45, 50)}):Play()
        ActiveTab = tab
    end)

    table.insert(Tabs, tab)
    return tab
end

local function createHeader(parent, text)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, -4, 0, 20)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = Color3.fromRGB(140, 140, 150)
    l.TextSize = 10
    l.Font = Enum.Font.GothamBold
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.ZIndex = 3
    l.Parent = parent
    return l
end

local function createToggle(parent, text, default, callback)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -4, 0, 30)
    f.BackgroundColor3 = Color3.fromRGB(26, 26, 28)
    f.BorderSizePixel = 0
    f.ZIndex = 3
    f.Parent = parent
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -60, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
    lbl.TextSize = 11
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 3
    lbl.Parent = f

    local sw = Instance.new("TextButton")
    sw.Size = UDim2.new(0, 36, 0, 18)
    sw.Position = UDim2.new(1, -44, 0.5, -9)
    sw.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    sw.Text = ""
    sw.AutoButtonColor = false
    sw.ZIndex = 3
    sw.Parent = f
    Instance.new("UICorner", sw).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(0, 2, 0.5, -7)
    knob.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    knob.BorderSizePixel = 0
    knob.ZIndex = 4
    knob.Parent = sw
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local state = default or false
    local function update(anim)
        if state then
            sw.BackgroundColor3 = Color3.fromRGB(80, 130, 255)
            if anim then
                TweenService:Create(knob, TweenInfo.new(0.15), {Position = UDim2.new(1, -16, 0.5, -7)}):Play()
            else
                knob.Position = UDim2.new(1, -16, 0.5, -7)
            end
        else
            sw.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            if anim then
                TweenService:Create(knob, TweenInfo.new(0.15), {Position = UDim2.new(0, 2, 0.5, -7)}):Play()
            else
                knob.Position = UDim2.new(0, 2, 0.5, -7)
            end
        end
        if callback then callback(state) end
    end

    sw.MouseButton1Click:Connect(function()
        state = not state
        update(true)
    end)

    update(false)
    return f
end

local function createColorOption(parent, text, defaultColor, callback)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -4, 0, 30)
    f.BackgroundColor3 = Color3.fromRGB(26, 26, 28)
    f.BorderSizePixel = 0
    f.ZIndex = 3
    f.Parent = parent
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -60, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
    lbl.TextSize = 11
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 3
    lbl.Parent = f

    local cb = Instance.new("TextButton")
    cb.Size = UDim2.new(0, 24, 0, 18)
    cb.Position = UDim2.new(1, -34, 0.5, -9)
    cb.BackgroundColor3 = defaultColor
    cb.Text = ""
    cb.AutoButtonColor = false
    cb.ZIndex = 3
    cb.Parent = f
    Instance.new("UICorner", cb).CornerRadius = UDim.new(0, 5)
    local stroke = Instance.new("UIStroke", cb)
    stroke.Color = Color3.fromRGB(80, 80, 85)
    stroke.Thickness = 1

    cb.MouseButton1Click:Connect(function()
        local existing = f:FindFirstChild("ColorPopup")
        if existing then existing:Destroy() return end

        local popup = Instance.new("Frame")
        popup.Name = "ColorPopup"
        popup.Size = UDim2.new(0, 160, 0, 100)
        popup.Position = UDim2.new(0, -100, 1, 6)
        popup.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
        popup.BorderSizePixel = 0
        popup.ZIndex = 15
        popup.Parent = f
        Instance.new("UICorner", popup).CornerRadius = UDim.new(0, 6)
        local ps = Instance.new("UIStroke", popup)
        ps.Color = Color3.fromRGB(60, 60, 65)
        ps.Thickness = 1

        local grid = Instance.new("UIGridLayout")
        grid.CellSize = UDim2.new(0, 24, 0, 24)
        grid.CellPadding = UDim.new(0, 4)
        grid.SortOrder = Enum.SortOrder.LayoutOrder
        grid.Parent = popup

        local pad = Instance.new("UIPadding")
        pad.PaddingTop = UDim.new(0, 8)
        pad.PaddingLeft = UDim.new(0, 8)
        pad.Parent = popup

        local colors = {
            Color3.fromRGB(255, 50, 50),   Color3.fromRGB(255, 150, 0),  Color3.fromRGB(255, 230, 0),
            Color3.fromRGB(0, 255, 80),    Color3.fromRGB(0, 200, 255),  Color3.fromRGB(50, 100, 255),
            Color3.fromRGB(180, 0, 255),   Color3.fromRGB(255, 100, 200), Color3.fromRGB(255, 255, 255),
            Color3.fromRGB(150, 150, 150), Color3.fromRGB(70, 70, 70),    Color3.fromRGB(0, 0, 0),
        }

        for _, c in ipairs(colors) do
            local cbtn = Instance.new("TextButton")
            cbtn.BackgroundColor3 = c
            cbtn.Text = ""
            cbtn.BorderSizePixel = 0
            cbtn.ZIndex = 16
            cbtn.Parent = popup
            Instance.new("UICorner", cbtn).CornerRadius = UDim.new(0, 4)
            cbtn.MouseButton1Click:Connect(function()
                cb.BackgroundColor3 = c
                if callback then callback(c) end
                popup:Destroy()
            end)
        end

        task.delay(5, function()
            if popup and popup.Parent then popup:Destroy() end
        end)
    end)

    return f
end

local function createSlider(parent, text, min, max, default, callback)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -4, 0, 42)
    f.BackgroundColor3 = Color3.fromRGB(26, 26, 28)
    f.BorderSizePixel = 0
    f.ZIndex = 3
    f.Parent = parent
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -60, 0, 16)
    lbl.Position = UDim2.new(0, 10, 0, 4)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
    lbl.TextSize = 11
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 3
    lbl.Parent = f

    local valLbl = Instance.new("TextLabel")
    valLbl.Size = UDim2.new(0, 40, 0, 16)
    valLbl.Position = UDim2.new(1, -50, 0, 4)
    valLbl.BackgroundTransparency = 1
    valLbl.Text = tostring(default)
    valLbl.TextColor3 = Color3.fromRGB(120, 180, 255)
    valLbl.TextSize = 11
    valLbl.Font = Enum.Font.GothamBold
    valLbl.TextXAlignment = Enum.TextXAlignment.Right
    valLbl.ZIndex = 3
    valLbl.Parent = f

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, -20, 0, 6)
    bar.Position = UDim2.new(0, 10, 0, 26)
    bar.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    bar.BorderSizePixel = 0
    bar.ZIndex = 3
    bar.Parent = f
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(80, 130, 255)
    fill.BorderSizePixel = 0
    fill.ZIndex = 4
    fill.Parent = bar
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 12, 0, 12)
    knob.Position = UDim2.new(fill.Size.X.Scale, -6, 0.5, -6)
    knob.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    knob.BorderSizePixel = 0
    knob.ZIndex = 5
    knob.Parent = bar
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local dragging = false

    local function updateFromX(x)
        local rel = math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        local v = math.floor(min + (max - min) * rel + 0.5)
        fill.Size = UDim2.new(rel, 0, 1, 0)
        knob.Position = UDim2.new(rel, -6, 0.5, -6)
        valLbl.Text = tostring(v)
        if callback then callback(v) end
    end

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateFromX(input.Position.X)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateFromX(input.Position.X)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    return f
end

local espTab     = createTab("ESPs",     "◎")
local murderTab  = createTab("Murder",   "⚔")
local xerifeTab  = createTab("Xerife",   "🔫")
local configTab  = createTab("Config",   "≡")

espTab.Page.Visible = true
espTab.Button.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
ActiveTab = espTab

createHeader(espTab.Page, "ESP OPTIONS")
createToggle(espTab.Page, "Esp Name",     false, function(v) Config.EspName     = v end)
createToggle(espTab.Page, "Esp Inocente", false, function(v) Config.EspInocente = v end)
createToggle(espTab.Page, "Esp Murder",   false, function(v) Config.EspMurder   = v end)
createToggle(espTab.Page, "Esp Xerife",   false, function(v) Config.EspXerife   = v end)
createToggle(espTab.Page, "Esp GunDrop",  false, function(v) Config.EspGunDrop  = v end)

createHeader(espTab.Page, "CORES DAS ESPs")
createColorOption(espTab.Page, "Cor Inocente", Config.Colors.Inocente, function(c) Config.Colors.Inocente = c end)
createColorOption(espTab.Page, "Cor Murder",   Config.Colors.Murder,   function(c) Config.Colors.Murder   = c end)
createColorOption(espTab.Page, "Cor Xerife",   Config.Colors.Xerife,   function(c) Config.Colors.Xerife   = c end)
createColorOption(espTab.Page, "Cor GunDrop",  Config.Colors.GunDrop,  function(c) Config.Colors.GunDrop  = c end)

createHeader(murderTab.Page, "MURDER CONFIG")

createToggle(murderTab.Page, "Auto-Kill", false, function(v)
    Config.AutoKill = v
    if v then
        if _G.startAutoKill then _G.startAutoKill() end
    else
        if _G.stopAutoKill then _G.stopAutoKill() end
    end
end)

createToggle(murderTab.Page, "Kill-Aura", false, function(v)
    Config.KillAura = v
    if v then
        if _G.startKillAura then _G.startKillAura(Config.KillAuraRange) end
    else
        if _G.stopKillAura then _G.stopKillAura() end
    end
end)

createHeader(murderTab.Page, "KILL-AURA RANGE")
createSlider(murderTab.Page, "Distância", 1, 100, 30, function(v)
    Config.KillAuraRange = v
    if _G.updateKillAuraRange then _G.updateKillAuraRange(v) end
end)

createHeader(xerifeTab.Page, "XERIFE CONFIG")

createToggle(xerifeTab.Page, "Auto-Shot", false, function(v)
    Config.AutoShot = v
    if v then
        if _G.showFloatBtn then _G.showFloatBtn() end
    else
        if _G.hideFloatBtn then _G.hideFloatBtn() end
    end
end)

createToggle(xerifeTab.Page, "Kill-Murder", false, function(v)
    Config.KillMurder = v
    if v then
        if _G.startKillMurder then _G.startKillMurder() end
    else
        if _G.stopKillMurder then _G.stopKillMurder() end
    end
end)

createToggle(xerifeTab.Page, "Aim-Bot", false, function(v)
    Config.AimBot = v
    if v then
        if _G.startAimBot then _G.startAimBot() end
    else
        if _G.stopAimBot then _G.stopAimBot() end
    end
end)

createHeader(xerifeTab.Page, "AIM-BOT CONFIG")

createSlider(xerifeTab.Page, "FOV", 20, 400, 100, function(v)
    Config.AimFOV = v
    if _G.updateFOV then _G.updateFOV(v) end
end)

createSlider(xerifeTab.Page, "Intensidade", 5, 100, 15, function(v)
    Config.AimIntensity = v / 100
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local minimized  = false
local normalSize = Main.Size
local normalPos  = Main.Position

MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    Sidebar.Visible = not minimized
    Content.Visible = not minimized
    SearchFrame.Visible = not minimized

    if minimized then
        normalSize = Main.Size
        normalPos  = Main.Position
        MinBtn.Text = "▢"
        TweenService:Create(Main, TweenInfo.new(0.2), {
            Size = UDim2.new(0, 220, 0, 30)
        }):Play()
    else
        MinBtn.Text = "—"
        TweenService:Create(Main, TweenInfo.new(0.2), {
            Size = normalSize,
            Position = normalPos
        }):Play()
    end
end)

local function notify(text)
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 260, 0, 50)
    notif.Position = UDim2.new(1, 20, 0, 60)
    notif.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
    notif.BorderSizePixel = 0
    notif.ZIndex = 50
    notif.Parent = ScreenGui
    Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", notif)
    stroke.Color = Color3.fromRGB(255, 220, 0)
    stroke.Thickness = 1

    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(0, 36, 1, 0)
    icon.Position = UDim2.new(0, 4, 0, 0)
    icon.BackgroundTransparency = 1
    icon.Text = "🔔"
    icon.TextSize = 18
    icon.ZIndex = 51
    icon.Parent = notif

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -44, 1, 0)
    lbl.Position = UDim2.new(0, 42, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(230, 230, 230)
    lbl.TextSize = 11
    lbl.Font = Enum.Font.Gotham
    lbl.TextWrapped = true
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextYAlignment = Enum.TextYAlignment.Center
    lbl.ZIndex = 51
    lbl.Parent = notif

    TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quart), { Position = UDim2.new(1, -280, 0, 60) }):Play()
    task.delay(3, function()
        if notif and notif.Parent then
            TweenService:Create(notif, TweenInfo.new(0.3), { Position = UDim2.new(1, 20, 0, 60) }):Play()
            task.wait(0.35)
            if notif then notif:Destroy() end
        end
    end)
end

local function getTool(player, toolName)
    local char = player.Character
    if not char then return nil end
    local held = char:FindFirstChildOfClass("Tool")
    if held and held.Name:lower() == toolName:lower() then return held end
    local bp = player:FindFirstChild("Backpack")
    if bp then
        for _, item in ipairs(bp:GetChildren()) do
            if item:IsA("Tool") and item.Name:lower() == toolName:lower() then return item end
        end
    end
    return nil
end

local function hasKnife(player) return getTool(player, "Knife") ~= nil end
local function hasGun(player)   return getTool(player, "Gun")   ~= nil end

local function getTorso(char)
    return char:FindFirstChild("Torso")
        or char:FindFirstChild("UpperTorso")
        or char:FindFirstChild("HumanoidRootPart")
end

local function getMurderPlayer()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and hasKnife(p) then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then return p end
        end
    end
    return nil
end

local function equipGun()
    local char = LP.Character
    if not char then return nil end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return nil end
    local gun = char:FindFirstChild("Gun")
    if gun then return gun end
    local bp = LP:FindFirstChild("Backpack")
    if bp then
        local g = bp:FindFirstChild("Gun")
        if g then
            hum:EquipTool(g)
            return g
        end
    end
    return nil
end

local function aimAndShoot(targetChar)
    if not targetChar then return end

    local gun = equipGun()
    if not gun then
        notify("⚠ Você não tem a Gun!")
        return
    end

    task.wait(0.2)

    pcall(function() gun:Activate() end)

    task.spawn(function()
        task.wait(0.05)
        if mouse1click then
            pcall(mouse1click)
        end
    end)
end

local function createOrUpdateHighlight(target, name, color, transparency)
    local h = target:FindFirstChild("PLMURDER_" .. name)
    if not h then
        h = Instance.new("Highlight")
        h.Name = "PLMURDER_" .. name
        h.Adornee = target
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.Parent = target
    end
    h.FillColor           = color
    h.FillTransparency    = transparency or 0.6
    h.OutlineColor        = color
    h.OutlineTransparency = 0
    return h
end

local function removeHighlight(target, name)
    if not target then return end
    local h = target:FindFirstChild("PLMURDER_" .. name)
    if h then h:Destroy() end
end

local function updateNameTag(player, char)
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end
    local tag = head:FindFirstChild("PLMURDER_NameTag")
    if Config.EspName then
        if not tag then
            tag = Instance.new("BillboardGui")
            tag.Name = "PLMURDER_NameTag"
            tag.Size = UDim2.new(0, 120, 0, 22)
            tag.StudsOffset = Vector3.new(0, 2.5, 0)
            tag.AlwaysOnTop = true
            tag.Adornee = head
            tag.Parent = head
            local txt = Instance.new("TextLabel")
            txt.Size = UDim2.new(1, 0, 1, 0)
            txt.BackgroundTransparency = 1
            txt.Text = player.Name
            txt.TextColor3 = Color3.fromRGB(255, 255, 255)
            txt.TextStrokeTransparency = 0
            txt.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            txt.TextSize = 12
            txt.Font = Enum.Font.GothamBold
            txt.Parent = tag
        else
            tag.Enabled = true
            local txt = tag:FindFirstChildOfClass("TextLabel")
            if txt then txt.Text = player.Name end
        end
    else
        if tag then tag:Destroy() end
    end
end

RunService.Heartbeat:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LP then
            local char = player.Character
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if hrp and humanoid and humanoid.Health > 0 then
                    local isMurder   = hasKnife(player)
                    local isXerife   = hasGun(player)
                    local isInocente = (not isMurder) and (not isXerife)
                    if Config.EspMurder and isMurder then
                        createOrUpdateHighlight(char, "Murder", Config.Colors.Murder, 0.5)
                    else removeHighlight(char, "Murder") end
                    if Config.EspXerife and isXerife then
                        createOrUpdateHighlight(char, "Xerife", Config.Colors.Xerife, 0.5)
                    else removeHighlight(char, "Xerife") end
                    if Config.EspInocente and isInocente then
                        createOrUpdateHighlight(char, "Inocente", Config.Colors.Inocente, 0.6)
                    else removeHighlight(char, "Inocente") end
                    updateNameTag(player, char)
                else
                    removeHighlight(char, "Murder")
                    removeHighlight(char, "Xerife")
                    removeHighlight(char, "Inocente")
                end
            end
        end
    end
end)

local gunDropNotified = false
task.spawn(function()
    while ScreenGui.Parent do
        local found = false
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj.Name == "GunDrop" and obj:IsA("BasePart") then
                found = true
                if Config.EspGunDrop then
                    createOrUpdateHighlight(obj, "GunDrop", Config.Colors.GunDrop, 0.4)
                else removeHighlight(obj, "GunDrop") end
            end
        end
        if Config.EspGunDrop and found and not gunDropNotified then
            gunDropNotified = true
            notify("☠ GunDrop encontrado no mapa!")
        elseif (not found) or (not Config.EspGunDrop) then
            gunDropNotified = false
        end
        task.wait(0.5)
    end
end)

local autoKillConn = nil

function _G.startAutoKill()
    if autoKillConn then autoKillConn:Disconnect() end
    autoKillConn = RunService.Heartbeat:Connect(function()
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end
        local bp = LP:FindFirstChild("Backpack")
        if bp and not char:FindFirstChild("Knife") then
            local knife = bp:FindFirstChild("Knife")
            if knife then hum:EquipTool(knife) end
        end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LP and p.Character then
                local thrp = p.Character:FindFirstChild("HumanoidRootPart")
                local thum = p.Character:FindFirstChildOfClass("Humanoid")
                if thrp and thum and thum.Health > 0 then
                    hrp.CFrame = thrp.CFrame * CFrame.new(0, 0, -1.5)
                    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    local heldKnife = char:FindFirstChild("Knife")
                    if heldKnife then pcall(function() heldKnife:Activate() end) end
                end
            end
        end
    end)
end

function _G.stopAutoKill()
    if autoKillConn then autoKillConn:Disconnect() autoKillConn = nil end
end

local killAuraConn = nil
local currentRange = 30

function _G.updateKillAuraRange(v)
    currentRange = v
end

function _G.startKillAura(radius)
    currentRange = radius or currentRange
    if killAuraConn then killAuraConn:Disconnect() end
    killAuraConn = RunService.Heartbeat:Connect(function()
        local myChar = LP.Character
        if not myChar then return end
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        local myHum = myChar:FindFirstChildOfClass("Humanoid")
        if not myHRP or not myHum or myHum.Health <= 0 then return end
        local knife = myChar:FindFirstChild("Knife")
        if not knife then
            local bp = LP:FindFirstChild("Backpack")
            if bp then
                local k = bp:FindFirstChild("Knife")
                if k then myHum:EquipTool(k) knife = k end
            end
        end
        if not knife then return end
        local blade = knife:FindFirstChild("Handle") or knife:FindFirstChild("Blade") or knife:FindFirstChild("Faca")
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LP and p.Character then
                local thrp = p.Character:FindFirstChild("HumanoidRootPart")
                local thum = p.Character:FindFirstChildOfClass("Humanoid")
                if thrp and thum and thum.Health > 0 then
                    local dist = (myHRP.Position - thrp.Position).Magnitude
                    if dist <= currentRange then
                        pcall(function() knife:Activate() end)
                        if blade then
                            pcall(function() firetouchinterest(blade, thrp, 0) end)
                            pcall(function() firetouchinterest(blade, thrp, 1) end)
                        end
                    end
                end
            end
        end
    end)
end

function _G.stopKillAura()
    if killAuraConn then killAuraConn:Disconnect() killAuraConn = nil end
end

local floatingBtn = nil

function _G.showFloatBtn()
    if floatingBtn then floatingBtn.Visible = true return end

    local btn = Instance.new("TextButton")
    btn.Name = "PLMURDER_FloatBtn"
    btn.Size = UDim2.new(0, 56, 0, 56)
    btn.Position = UDim2.new(0, 100, 0.5, -28)
    btn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    btn.BorderSizePixel = 0
    btn.Text = "🔫"
    btn.TextSize = 24
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.ZIndex = 99
    btn.Active = true
    btn.Parent = ScreenGui
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)

    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Thickness = 2

    local dragging, dragStart, startPos, wasDragged = false, nil, nil, false

    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            wasDragged = false
            dragStart = input.Position
            startPos = btn.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if delta.Magnitude > 5 then wasDragged = true end
            btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if dragging and not wasDragged then
                local murder = getMurderPlayer()
                if murder and murder.Character then
                    task.spawn(aimAndShoot, murder.Character)
                else
                    notify("⚠ Nenhum Murder encontrado")
                end
            end
            dragging = false
        end
    end)

    floatingBtn = btn
end

function _G.hideFloatBtn()
    if floatingBtn then
        floatingBtn.Visible = false
    end
end

local killMurderConn = nil

function _G.startKillMurder()
    if killMurderConn then killMurderConn:Disconnect() end
    killMurderConn = RunService.Heartbeat:Connect(function()
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end

        local murder = getMurderPlayer()
        if not murder or not murder.Character then return end
        local thrp = murder.Character:FindFirstChild("HumanoidRootPart")
        local thum = murder.Character:FindFirstChildOfClass("Humanoid")
        if not thrp or not thum or thum.Health <= 0 then return end

        hrp.CFrame = thrp.CFrame * CFrame.new(0, 0, 3)
        hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)

        local gun = equipGun()
        if not gun then return end

        task.spawn(function()
            task.wait(0.2)

            local cam = workspace.CurrentCamera
            local target = murder.Character:FindFirstChild("Head") or getTorso(murder.Character)
            if target then
                cam.CFrame = CFrame.new(cam.CFrame.Position, target.Position)
            end

            task.wait(0.03)
            pcall(function() gun:Activate() end)

            task.spawn(function()
                task.wait(0.05)
                if mouse1click then
                    pcall(mouse1click)
                end
            end)
        end)
    end)
end

function _G.stopKillMurder()
    if killMurderConn then killMurderConn:Disconnect() killMurderConn = nil end
end

local aimBotConn = nil
local fovCircle = nil
local currentFOV = 100

local function createFOVCircle()
    if fovCircle then return fovCircle end
    local f = Instance.new("Frame")
    f.Name = "PLMURDER_FOV"
    f.AnchorPoint = Vector2.new(0.5, 0.5)
    f.Position = UDim2.new(0.5, 0, 0.5, 0)
    f.Size = UDim2.new(0, currentFOV * 2, 0, currentFOV * 2)
    f.BackgroundTransparency = 1
    f.ZIndex = 90
    f.Visible = false
    f.Parent = ScreenGui

    local corner = Instance.new("UICorner", f)
    corner.CornerRadius = UDim.new(1, 0)

    local stroke = Instance.new("UIStroke", f)
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Thickness = 1
    stroke.Transparency = 0.4

    fovCircle = f
    return f
end

function _G.updateFOV(v)
    currentFOV = v
    if fovCircle then
        fovCircle.Size = UDim2.new(0, v * 2, 0, v * 2)
    end
end

function _G.startAimBot()
    createFOVCircle()
    if fovCircle then fovCircle.Visible = true end
    if aimBotConn then aimBotConn:Disconnect() end

    aimBotConn = RunService.RenderStepped:Connect(function()
        local cam = workspace.CurrentCamera
        if not cam then return end

        local viewportCenter = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
        local closest, closestDist = nil, currentFOV

        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LP and p.Character and hasKnife(p) then
                local torso = getTorso(p.Character)
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if torso and hum and hum.Health > 0 then
                    local sp, onScreen = cam:WorldToViewportPoint(torso.Position)
                    if onScreen then
                        local dist = (Vector2.new(sp.X, sp.Y) - viewportCenter).Magnitude
                        if dist < closestDist then
                            closestDist = dist
                            closest = torso
                        end
                    end
                end
            end
        end

        if closest then
            local targetCF = CFrame.new(cam.CFrame.Position, closest.Position)
            cam.CFrame = cam.CFrame:Lerp(targetCF, Config.AimIntensity)
        end
    end)
end

function _G.stopAimBot()
    if aimBotConn then aimBotConn:Disconnect() aimBotConn = nil end
    if fovCircle then fovCircle.Visible = false end
end

print("[PL MURDER] UI carregada com sucesso ✔")
