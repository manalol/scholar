--[[ Somewhere in a source code
local library = [...]
local avalanche = library:Init("avalanche", Color3.fromRGB(24, 24, 24))
]]

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local tab = {}
tab.__index = tab

local section = {
    gui = nil
}
section.__index = tab

if not getgenv().library then
    getgenv().library = {
        name = "avalanche",
        color = Color3.fromRGB(255, 170, 127),
        flags = {},
        tabs = {},
        initalized = false,
        screengui = nil,
        connections = {},
        objects = {},
        opened = false,
        selected = ""
    }
end
library.__index = library


function library:Drawing(type, properties, gc)
    local object = Drawing.new(type)

    for i, v in next, properties do
        object[i] = v
    end

    if gc then
        table.insert(self.objects, object)
    end

    return object
end
function library:Connection(object, signal, callback)
    local connection = object[signal]:Connect(callback)
    if connection then
        table.insert(library.connections, connection)
    else
        error("Failed to create a connection signal with signal "..signal)
    end  
end

function library:Init(name, color)
    if self.initalized then
        warn("Library already initalized, unloading")
        self:Unload()
    end

    if not #name then -- Check if a valid UI name was passed (x > 1 character)
        warn("Attempted to initalize library without a proper name")
    end

    -- Generating the top bar and initalizing library variables
    local ProtectedGui = Instance.new("ScreenGui")
    syn.protect_gui(ProtectedGui)
    ProtectedGui.Parent = game:GetService("CoreGui")

    library.screengui = ProtectedGui
    library.color = color or library.color
    library.name = name

    local Topbar = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    local Name = Instance.new("TextLabel")
    local Options = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local Aimbot = Instance.new("TextButton")
    local Frame = Instance.new("Frame")
    local Visuals = Instance.new("TextButton")
    local Misc = Instance.new("TextButton")
    local Misc_2 = Instance.new("TextButton")
    local Seperator = Instance.new("Frame")

    Topbar.Name = "Topbar"
    Topbar.Parent = ProtectedGui
    Topbar.BackgroundColor3 = Color3.fromRGB(15, 17, 19)
    Topbar.Position = UDim2.new(0.295757562, 0, 0.150549456, 0)
    Topbar.Size = UDim2.new(0, 600, 0, 50)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Topbar

    UIGradient.Color = ColorSequence.new {ColorSequenceKeypoint.new(0.00, Color3.fromRGB(15, 17, 19)),
                                        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(168, 169, 170)),
                                        ColorSequenceKeypoint.new(0.05, Color3.fromRGB(240, 240, 240)),
                                        ColorSequenceKeypoint.new(0.15, Color3.fromRGB(255, 255, 255)),
                                        ColorSequenceKeypoint.new(0.76, Color3.fromRGB(237, 237, 237)),
                                        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(15, 17, 19))}
    UIGradient.Rotation = 90
    UIGradient.Parent = Topbar


    Name.Name = "Name"
    Name.Parent = Topbar
    Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Name.BackgroundTransparency = 1.000
    Name.Position = UDim2.new(0, 15, 0.0799999982, 0)
    Name.Size = UDim2.new(0, 133, 0, 35)
    Name.Font = Enum.Font.GothamSemibold
    Name.Text = library.name
    Name.TextColor3 = Color3.fromRGB(255, 255, 255)
    Name.TextSize = 20.000
    Name.TextXAlignment = Enum.TextXAlignment.Left

    
    Seperator.Name = "Seperator"
    Seperator.Parent = ProtectedGui.Topbar
    Seperator.BackgroundColor3 = library.color
    Seperator.BorderColor3 = Color3.fromRGB(255, 255, 255)
    Seperator.BorderSizePixel = 0
    Seperator.Position = UDim2.new(0.030, 0, 0, 35)
    Seperator.Size = UDim2.new(0, Name.TextBounds.X - 10, 0, 1)

    Options.Name = "Options"
    Options.Parent = Topbar
    Options.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Options.BackgroundTransparency = 1.000
    Options.Position = UDim2.new(0.278, 0, 0.280000001, 0)
    Options.Size = UDim2.new(0, 420, 0, 18)

    UIListLayout.Parent = Options
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 25)
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right

    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local LeftSection = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local RightSection = Instance.new("Frame")
    local UIListLayout_2 = Instance.new("UIListLayout")

    -- Properties:

    Main.Name = "Main"
    Main.Parent = ProtectedGui
    Main.BackgroundColor3 = Color3.fromRGB(20, 22, 24)
    Main.Position = UDim2.new(0.296, 0, 0.195, 0)
    Main.Size = UDim2.new(0, 600, 0, 455)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Main

    LeftSection.Name = "Left Section"
    LeftSection.Parent = Main
    LeftSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LeftSection.BackgroundTransparency = 1.000
    LeftSection.Position = UDim2.new(0, 10, 0.0109890113, 0)
    LeftSection.Size = UDim2.new(0, 280, 0, 440)
    LeftSection.SizeConstraint = Enum.SizeConstraint.RelativeXX

    UIListLayout.Parent = LeftSection
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 10)

    RightSection.Name = "Right Section"
    RightSection.Parent = Main
    RightSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    RightSection.BackgroundTransparency = 1.000
    RightSection.Position = UDim2.new(0, 307, 0.0109890113, 0)
    RightSection.Size = UDim2.new(0, 282, 0, 440)

    UIListLayout_2.Parent = RightSection
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.Padding = UDim.new(0, 10)
    self.initalized = true

    -- Dragging 
    local dragging, old
    library:Connection(library.screengui.Topbar, "InputBegan", function(input, gpe)

        if not gpe and input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            old = UIS:GetMouseLocation() + Vector2.new(0, 36)
        end

       library:Connection(UIS, "InputChanged", function()
            if dragging then 
                local new = UIS:GetMouseLocation() + Vector2.new(0, 36) -- gui insert
                local relativepos = new - old
                old = new

                library.screengui.Main.Position = library.screengui.Main.Position + UDim2.fromOffset(relativepos.X, relativepos.Y)
                library.screengui.Topbar.Position = library.screengui.Topbar.Position +  UDim2.fromOffset(relativepos.X, relativepos.Y)
            end
        end)

        library:Connection(UIS, "InputEnded", function()
            if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
                dragging = false
            end
        end)
    end)
    -- Helper functions
    function library:AddTab(name)
        if not library.initalized then
            return
        end

        if not #name then
            warn("Attempted to initalize tab without a name")
        end

        local Tab = Instance.new("TextButton")
        local Frame = Instance.new("Frame")

        Tab.Name = name
        Tab.Parent = library.screengui.Topbar.Options
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.Position = UDim2.new(-2.06506848, 0, 0.333333343, 0)
        Tab.Font = Enum.Font.Gotham
        Tab.Text = name
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextSize = 16.000
        Tab.Size = UDim2.fromOffset(Tab.TextBounds.X, Tab.TextBounds.Y)
        library.tabs[name] = {}

        -- Detect when the tab is pressed
        local tweeninfo = TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        local tween = TweenService:Create(Tab, tweeninfo, {
            TextColor3 = library.color
        })

        local debounce = true
        library:Connection(Tab, "Activated", function()
            if debounce then
                debounce = false
            end
            if name == library.selected then
                return
            else
                library.selected = Tab.Name
                for _, tab in pairs(library.tabs) do
                    library.screengui.Topbar.Options:FindFirstChild(_).TextColor3 = Color3.fromRGB(255, 255, 255)
                end
                task.delay(1, function()
                    tween:Play()
                    tween.Completed:Wait(function()
                        debounce = true
                    end) 
                end)
                
            end
        end)

        tab.name = name
        return tab
    end
end

function library:Unload()
    for _, connection in next, self.connections do
        connection:Disconnect()
    end

    for _, object in next, self.objects do
        object:Remove()
    end

    self.screengui:Destroy()
    self.screengui = nil
    self.initalized = false
    self.tabs = {}
    self.flags = {}
    self.objects = {}

    warn("Succesfully unloaded UI library")
end

function tab:AddSection(name, pos)
    
    if not library.initalized then return end
    if not #name then warn("Attempted to create section "..name.." with an invalid name") return end
    if type(pos) ~= "string" then return end

    if pos ~= "Left" and pos ~= "Right" then
        warn("Provided invalid section (options: Left or Right)")
        return
    end
    
    local obj = {}
    for k, v in pairs(section) do
        obj[k] = v
    end

    local Section = Instance.new("Frame")
    local Name = Instance.new("TextLabel")
    local Seperator = Instance.new("Frame")
    local Options = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")

    --Properties:
    if pos == "Left" then
        Section.Parent = library.screengui.Main["Left Section"]
    else
        Section.Parent = library.screengui.Main["Right Section"]
    end
    
    Section.Name = name
    Section.BackgroundColor3 = Color3.fromRGB(24, 26, 28)
    Section.BorderColor3 = Color3.fromRGB(36, 38, 40)
    Section.Size = UDim2.new(0, 284, 0, 34)

    Name.Name = "Name"
    Name.Parent = Section
    Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Name.BackgroundTransparency = 1.000
    Name.Position = UDim2.new(0, 8, 0, 8)
    Name.Font = Enum.Font.Gotham
    Name.Text = name
    Name.TextColor3 = Color3.fromRGB(255, 255, 255)
    Name.TextSize = 14.000
    Name.Size = UDim2.fromOffset(Name.TextBounds.X, Name.TextBounds.Y)
    Name.TextXAlignment = Enum.TextXAlignment.Left

    Seperator.Name = "Seperator"
    Seperator.Parent = Section
    Seperator.BackgroundColor3 = library.color
    Seperator.Position = UDim2.new(0, 0, 0, 30)
    Seperator.Size = UDim2.new(0, 284, 0, 3)

    Options.Name = "Options"
    Options.Parent = Section
    Options.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Options.BackgroundTransparency = 1.000
    Options.Position = UDim2.new(0, 8, 0, 38)
    Options.Size = UDim2.new(0, 270, 0, 400)

    UIListLayout.Parent = Options
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    obj.__index = obj
    obj.gui = Section
    
    table.insert(library.tabs[self.name], Section)
    return obj
end

function section:AddButton(name, callback, ...)
    local Button = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")

    Button.Name = name
    Button.Parent = self.gui.Options
    Button.BackgroundColor3 = Color3.fromRGB(37, 41, 44)
    Button.Position = UDim2.new(0, 0, 0.821705401, 0)
    Button.Size = UDim2.new(0, 270, 0, 19)
    Button.SizeConstraint = Enum.SizeConstraint.RelativeXX
    Button.AutoButtonColor = false
    Button.Font = Enum.Font.Gotham
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14.000
    Button.Text = name
    Button.ZIndex = 1

    UICorner.CornerRadius = UDim.new(0, 3)
    UICorner.Parent = Button

    self.gui.Size = self.gui.Size + UDim2.new(0, 0, 0, (Button.Size.Y.Offset + 6))
    library:Connection(Button, "Activated", function(...)
        callback(...)
    end)
end

function section:AddDropdown(name, default, options, flag, callback)
    local dropdownopened = false
    local DropdownFrame = Instance.new("Frame")
    local DropdownName = Instance.new("TextLabel")
    local Dropdowns = Instance.new("Frame")
    local Default = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")
    local Choices = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local Default_2 = Instance.new("TextLabel")
    local Open = Instance.new("TextButton")
    local keyboard_arrow_right = Instance.new("ImageButton")
    library.flags[flag] = default
    --Properties:

    DropdownFrame.Name = "Dropdown Frame"
    DropdownFrame.Parent = self.gui.Options
    DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropdownFrame.BackgroundTransparency = 1.000
    DropdownFrame.Position = UDim2.new(0, 0, 0.480620146, 0)
    DropdownFrame.Size = UDim2.new(0, 100, 0, 39)
    DropdownFrame.ZIndex = 999
    DropdownFrame.Visible = true

    DropdownName.Name = "Dropdown Name"
    DropdownName.Parent = DropdownFrame
    DropdownName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropdownName.BackgroundTransparency = 1.000
    DropdownName.Position = UDim2.new(0, 0, 0, 2)
    DropdownName.Size = UDim2.new(0, 71, 0, 17)
    DropdownName.Font = Enum.Font.Gotham
    DropdownName.Text = name
    DropdownName.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownName.TextSize = 13
    DropdownName.TextXAlignment = Enum.TextXAlignment.Left

    Dropdowns.Name = "Dropdowns"
    Dropdowns.Parent = DropdownFrame
    Dropdowns.BackgroundColor3 = Color3.fromRGB(37, 41, 44)
    Dropdowns.Position = UDim2.new(0, 0, 0, 22)
    Dropdowns.Size = UDim2.new(0, 270, 0, 19)
    Dropdowns.Visible = true
    Dropdowns.ZIndex = 2

    Default.Name = "Default"
    Default.Parent = Dropdowns
    Default.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Default.BackgroundTransparency = 1.000
    Default.Position = UDim2.new(0, 7, 0, 2)
    Default.Size = UDim2.new(0, 71, 0, 17)
    Default.Font = Enum.Font.GothamSemibold
    Default.Text = default or "Default"
    Default.TextColor3 = Color3.fromRGB(255, 255, 255)
    Default.TextSize = 13.000
    Default.TextWrapped = true
    Default.ZIndex = 2
    Default.TextXAlignment = Enum.TextXAlignment.Left

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Dropdowns

    Choices.Name = "Choices"
    Choices.Parent = Dropdowns
    Choices.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Choices.BackgroundTransparency = 1.000
    Choices.Position = UDim2.new(0, 7, 0, 18)
    Choices.Size = UDim2.new(0, 258, 0, 103)
    Choices.Visible = true

    UIListLayout.Parent = Choices
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 1)

    Open.Name = "Open"
    Open.Parent = DropdownFrame
    Open.BackgroundColor3 = Color3.fromRGB(255, 170, 127)
    Open.BackgroundTransparency = 1.000
    Open.Position = UDim2.new(2.51999998, 0, 0.647058845, 0)
    Open.Size = UDim2.new(0, 18, 0, 16)
    Open.Font = Enum.Font.SourceSans
    Open.Text = ""
    Open.TextColor3 = Color3.fromRGB(255, 255, 255)
    Open.TextSize = 20.000
    Open.BackgroundTransparency = 1

    keyboard_arrow_right.Name = "keyboard_arrow_right"
    keyboard_arrow_right.Parent = Open
    keyboard_arrow_right.BackgroundTransparency = 1.000
    keyboard_arrow_right.LayoutOrder = 15
    keyboard_arrow_right.Rotation = 90
    keyboard_arrow_right.Size = UDim2.new(1, 0, 1, 0)
    keyboard_arrow_right.ZIndex = 2
    keyboard_arrow_right.AutoButtonColor = false
    keyboard_arrow_right.Image = "rbxassetid://3926305904"
    keyboard_arrow_right.ImageRectOffset = Vector2.new(964, 284)
    keyboard_arrow_right.ImageRectSize = Vector2.new(36, 36)

    self.gui.Size = self.gui.Size + UDim2.new(0, 0, 0, (DropdownFrame.Size.Y.Offset + 8))

    for _, option in next, options do
        local TextButton = Instance.new("TextButton")

        TextButton.Parent = Choices
        TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.BackgroundTransparency = 1.000
        TextButton.Font = Enum.Font.Gotham
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextSize = 13.000
        TextButton.TextTransparency = 1
        TextButton.Text = option
        TextButton.ZIndex = 2
        TextButton.Size = UDim2.fromOffset(TextButton.TextBounds.X, TextButton.TextBounds.Y)
        TextButton.TextXAlignment = Enum.TextXAlignment.Left
    end

    library:Connection(keyboard_arrow_right, "Activated", function()

        if not dropdownopened then -- Check if it has not been opened yet
            -- Rotate the arrow
            local tween = TweenService:Create(keyboard_arrow_right, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Rotation = 270
            })
            tween:Play()
            
            -- Tween the size of the box
            task.spawn(function()
                local tween = TweenService:Create(Dropdowns, TweenInfo.new(.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Size = Dropdowns.Size + UDim2.new(0, 0, 0, #options * 14)
                })
                tween:Play()
            end)
           
           
            -- Make the choices avaliable and detect when clicked
            for _, choice in pairs(Choices:GetChildren()) do
                if choice:IsA("TextButton") or choice:IsA("TextLabel") then
                    task.spawn(function()
                        tween = TweenService:Create(choice, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            TextTransparency = 0
                        })
                        tween:Play()

                        library:Connection(choice, "Activated", function()
                            if library.flags[flag] ~= choice.Text then
                                library.flags[flag] = choice.Text
                                Default.Text = choice.Text
                            end

                            if callback then
                                callback()
                            end
                        end)
                    end)
                end
            end

            
        else
            local options = Choices:GetChildren()

            task.spawn(function()
                local tween = TweenService:Create(keyboard_arrow_right, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Rotation = 90
                })
                tween:Play()
            end)
           
            task.spawn(function()
                tween = TweenService:Create(Dropdowns, TweenInfo.new(.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 270, 0, 19)
                })
                tween:Play()
            end)
            
            for _, choice in pairs(Choices:GetChildren()) do
                if choice:IsA("TextButton") then
                    task.spawn(function()
                        tween = TweenService:Create(choice, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            TextTransparency = 1
                        })
                        tween:Play()
                    end)
                end
            end
        end

        dropdownopened = not dropdownopened
    end)
end

function section:AddMultiDropdown(name, default, options, flag, callback)
    local dropdownopened = false
    local DropdownFrame = Instance.new("Frame")
    local DropdownName = Instance.new("TextLabel")
    local Dropdowns = Instance.new("Frame")
    local Default = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")
    local Choices = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local Default_2 = Instance.new("TextLabel")
    local Open = Instance.new("TextButton")
    local keyboard_arrow_right = Instance.new("ImageButton")

    
    library.flags[flag] = {
    } 
    --Properties:

    DropdownFrame.Name = "Dropdown Frame"
    DropdownFrame.Parent = self.gui.Options
    DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropdownFrame.BackgroundTransparency = 1.000
    DropdownFrame.Position = UDim2.new(0, 0, 0.480620146, 0)
    DropdownFrame.Size = UDim2.new(0, 100, 0, 39)
    DropdownFrame.ZIndex = 999

    DropdownName.Name = "Dropdown Name"
    DropdownName.Parent = DropdownFrame
    DropdownName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropdownName.BackgroundTransparency = 1.000
    DropdownName.Position = UDim2.new(0, 0, 0, 2)
    DropdownName.Size = UDim2.new(0, 71, 0, 17)
    DropdownName.Font = Enum.Font.Gotham
    DropdownName.Text = name
    DropdownName.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownName.TextSize = 13
    DropdownName.TextXAlignment = Enum.TextXAlignment.Left

    Dropdowns.Name = "Dropdowns"
    Dropdowns.Parent = DropdownFrame
    Dropdowns.BackgroundColor3 = Color3.fromRGB(37, 41, 44)
    Dropdowns.Position = UDim2.new(0, 0, 0, 22)
    Dropdowns.Size = UDim2.new(0, 270, 0, 19)
    Dropdowns.ZIndex = 2

    Default.Name = "Default"
    Default.Parent = Dropdowns
    Default.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Default.BackgroundTransparency = 1.000
    Default.Position = UDim2.new(0, 7, 0, 2)
    Default.Size = UDim2.new(0, 245, 0, 17)
    Default.Font = Enum.Font.GothamSemibold
    Default.Text = default or "Default"
    Default.TextColor3 = Color3.fromRGB(255, 255, 255)
    Default.TextSize = 13.000
    Default.TextWrapped = true
    Default.ZIndex = 2
    Default.TextXAlignment = Enum.TextXAlignment.Left

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Dropdowns

    Choices.Name = "Choices"
    Choices.Parent = Dropdowns
    Choices.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Choices.BackgroundTransparency = 1.000
    Choices.Position = UDim2.new(0, 7, 0, 18)
    Choices.Size = UDim2.new(0, 258, 0, 103)

    UIListLayout.Parent = Choices
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 1)

    Open.Name = "Open"
    Open.Parent = DropdownFrame
    Open.BackgroundColor3 = Color3.fromRGB(255, 170, 127)
    Open.BackgroundTransparency = 1.000
    Open.Position = UDim2.new(2.51999998, 0, 0.647058845, 0)
    Open.Size = UDim2.new(0, 18, 0, 16)
    Open.Font = Enum.Font.SourceSans
    Open.Text = ""
    Open.TextColor3 = Color3.fromRGB(255, 255, 255)
    Open.TextSize = 20.000
    Open.ZIndex = 2
    Open.BackgroundTransparency = 1

    
    keyboard_arrow_right.Name = "keyboard_arrow_right"
    keyboard_arrow_right.Parent = Open
    keyboard_arrow_right.BackgroundTransparency = 1.000
    keyboard_arrow_right.LayoutOrder = 15
    keyboard_arrow_right.Rotation = 90
    keyboard_arrow_right.Size = UDim2.new(1, 0, 1, 0)
    keyboard_arrow_right.ZIndex = 2
    keyboard_arrow_right.AutoButtonColor = false
    keyboard_arrow_right.Image = "rbxassetid://3926305904"
    keyboard_arrow_right.ImageRectOffset = Vector2.new(964, 284)
    keyboard_arrow_right.ImageRectSize = Vector2.new(36, 36)
    keyboard_arrow_right.Selectable = false
    
    self.gui.Size = self.gui.Size + UDim2.new(0, 0, 0, (DropdownFrame.Size.Y.Offset + 8))

    for _, option in next, options do
        local TextButton = Instance.new("TextButton")

        TextButton.Parent = Choices
        TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.BackgroundTransparency = 1.000
        TextButton.Font = Enum.Font.Gotham
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextSize = 13.000
        TextButton.TextTransparency = 1
        TextButton.Text = option
        TextButton.ZIndex = 3
        TextButton.Size = UDim2.fromOffset(TextButton.TextBounds.X, TextButton.TextBounds.Y)
        TextButton.TextXAlignment = Enum.TextXAlignment.Left
    end

    library:Connection(keyboard_arrow_right, "Activated", function()

        if not dropdownopened then -- Check if it has not been opened yet
            -- Rotate the arrow
            task.spawn(function()
                local tween = TweenService:Create(keyboard_arrow_right, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Rotation = 270
                })
                tween:Play()
            end)
            
            -- Tween the size of the box
            task.spawn(function()
                local tween = TweenService:Create(Dropdowns, TweenInfo.new(.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Size = Dropdowns.Size + UDim2.new(0, 0, 0, #options * 14)
                })
                tween:Play()
            end)
           
           
            -- Make the choices avaliable and detect when clicked
            for _, choice in pairs(Choices:GetChildren()) do
                if choice:IsA("TextButton") or choice:IsA("TextLabel") then
                    task.spawn(function()
                        tween = TweenService:Create(choice, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            TextTransparency = 0
                        })
                        tween:Play()

                        library:Connection(choice, "Activated", function()
                            Default.Text = ""


                            if not library.flags[flag][choice.Text] then
                                library.flags[flag][choice.Text] = true
                            else
                                library.flags[flag][choice.Text] = nil
                            end

                            
                            local count = 0
                            for _, v in pairs(library.flags[flag]) do
                                count = count + 1
                                if count == 1 then
                                    Default.Text = _
                                else
                                    Default.Text = Default.Text..", ".._
                                end
                            end

                            if count == 0 then
                                Default.Text = default
                            end

                            if callback then
                                callback()
                            end
                            --Default.Size = UDim.fromOffset(Default.TextBounds.X, Default.TextBounds.Y)
                        end)
                    end)
                end
            end

            
        else
            local options = Choices:GetChildren()
            task.spawn(function()
                local tween = TweenService:Create(keyboard_arrow_right, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Rotation = 90
                })
                tween:Play()
            end)
           
            task.spawn(function()
                tween = TweenService:Create(Dropdowns, TweenInfo.new(.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 270, 0, 19)
                })
                tween:Play()
            end)
            

            for _, choice in pairs(Choices:GetChildren()) do
                if choice:IsA("TextButton") then
                    task.spawn(function()
                        tween = TweenService:Create(choice, TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            TextTransparency = 1
                        })
                        tween:Play()
                    end)
                end
            end
        end

        dropdownopened = not dropdownopened
    end)
end

function section:AddToggle(name, flag, callback)
    local Toggle = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")
    local Text = Instance.new("TextLabel")
    local Icon = Instance.new("ImageButton")

    Toggle.Name = "Toggle"
    Toggle.Parent = self.gui.Options
    Toggle.Size = UDim2.new(0, 18, 0, 18)
    Toggle.BackgroundColor3 = Color3.fromRGB(28, 31, 34)
    Toggle.AutoButtonColor = false
    Toggle.Font = Enum.Font.SciFi
    Toggle.Text = ""
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.TextSize = 20.000

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Toggle

    Text.Name = "Text"
    Text.Parent = Toggle
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.BackgroundTransparency = 1.000
    Text.Position = UDim2.new(1.3, 0, 0, 3)
    Text.Font = Enum.Font.Gotham
    Text.Text = name
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.TextSize = 13.000
    Text.Size = UDim2.fromOffset(Text.TextBounds.X, Text.TextBounds.Y)
    Text.TextXAlignment = Enum.TextXAlignment.Left

   
    self.gui.Size = self.gui.Size + UDim2.new(0, 0, 0, (Toggle.Size.Y.Offset + 6))
    library.flags[flag] = false
    local tween
    library:Connection(Toggle, "Activated", function(...)
        library.flags[flag] = not library.flags[flag]

        local tweeninfo = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
      
        if library.flags[flag] then
            tween = TweenService:Create(Toggle, tweeninfo, {
                BackgroundColor3 = library.color
            })
            tween:Play()

            tween.Completed:Connect(function(...)
                if callback then
                    callback(...)
                end
            end) 
        else
            tween = TweenService:Create(Toggle, tweeninfo, {
                BackgroundColor3 = Color3.fromRGB(28, 31, 34)
            })
            tween:Play()
        end
    end)
end

function section:AddSlider(name, max, flag, callback)
    
    local SliderFrame = Instance.new("Frame")
    local Name = Instance.new("TextLabel")
    local Slider = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local SelectedAmount = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Button = Instance.new("TextButton")
    local UICorner_3 = Instance.new("UICorner")

    --Properties:

    SliderFrame.Name = "Slider Frame"
    SliderFrame.Parent = self.gui.Options
    SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderFrame.BackgroundTransparency = 1.000
    SliderFrame.Position = UDim2.new(0, 0, 0.178294569, 0)
    SliderFrame.Size = UDim2.new(0, 100, 0, 34)

    Name.Name = "Name"
    Name.Parent = SliderFrame
    Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Name.BackgroundTransparency = 1.000
    Name.Position = UDim2.new(0, 0, 0, 2)
    Name.Size = UDim2.new(0, 51, 0, 17)
    Name.Font = Enum.Font.Gotham
    Name.Text = name.." (0)"
    Name.TextColor3 = Color3.fromRGB(255, 255, 255)
    Name.TextSize = 13.000
    Name.TextXAlignment = Enum.TextXAlignment.Left

    Slider.Name = "Slider"
    Slider.Parent = SliderFrame
    Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Slider.BackgroundTransparency = 0.800
    Slider.Position = UDim2.new(0, 0, 0, 25)
    Slider.Size = UDim2.new(0, 270, 0, 2)
    Slider.Visible = true

    UICorner.Parent = Slider

    SelectedAmount.Name = "SelectedAmount"
    SelectedAmount.Parent = SliderFrame
    SelectedAmount.BackgroundColor3 = Color3.fromRGB(255, 170, 127)
    SelectedAmount.Position = UDim2.new(0, 0, 0, 22)
    SelectedAmount.Size = UDim2.new(0, 10, 0, 6)
    SelectedAmount.Visible = true

    UICorner_2.Parent = SelectedAmount

    Button.Name = "Button"
    Button.Parent = Slider
    Button.BackgroundColor3 = Color3.fromRGB(255, 170, 127)
    Button.Position = UDim2.new(0, 0, 0, -7)
    Button.Size = UDim2.new(0, 14, 0, 14)
    Button.Font = Enum.Font.SourceSans
    Button.TextColor3 = Color3.fromRGB(0, 0, 0)
    Button.TextSize = 14.000
    Button.TextTransparency = 1.000
    Button.AutoButtonColor = false
    UICorner_3.Parent = Button
    self.gui.Size = self.gui.Size + UDim2.new(0, 0, 0, (SliderFrame.Size.Y.Offset + 6))

    local dragging
    library:Connection(Button, "MouseButton1Down", function()
        dragging = true
    end)

    library:Connection(UIS, "InputChanged", function(input, gpe)
        if dragging then
            local pos = UIS:GetMouseLocation() + Vector2.new(0, 36) -- gui insert
            local relativepos = pos - Slider.AbsolutePosition
            local percent = math.clamp(relativepos.X/Slider.AbsoluteSize.X, 0, .95)
            
            task.spawn(function()
                local tween = TweenService:Create(SelectedAmount, TweenInfo.new(.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, math.clamp((Button.AbsolutePosition - SelectedAmount.AbsolutePosition).X, 0, 270) + 10, 0, 6)
                })
                tween:Play()
            end)
           
            task.spawn(function()
                local tween = TweenService:Create(Button, TweenInfo.new(.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Position = UDim2.new(percent, 0, 0, -7)
                })
                tween:Play()
            end)
           

            library.flags[flag] = math.floor((percent*max)+.5)
            Name.Text = name.." ("..math.floor((percent*max)+.5)..")"
            Name.Size = UDim2.fromOffset(Name.TextBounds.X, 17)
        end
    end)

    library:Connection(UIS, "InputEnded", function(input, gpe)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            if callback then
                callback()
            end
        end
    end)
end

function section:AddColorToggle(name, flag, callback)

end

function section:AddDoubleColorToggle(name, flag, callback)

end

function section:AddKeybind(name, flag, callback)
    local Keybind = Instance.new("TextLabel")
    local BindButton = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")

    Keybind.Name = name
    Keybind.Parent = self.gui.Options
    Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Keybind.BackgroundTransparency = 1.000
    Keybind.Position = UDim2.new(0, 0, 1.36434114, 0)
    Keybind.Size = UDim2.new(0, 51, 0, 18)
    Keybind.Font = Enum.Font.Gotham
    Keybind.Text = name
    Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
    Keybind.TextSize = 13.000
    Keybind.TextXAlignment = Enum.TextXAlignment.Left

    BindButton.Name = "Bind Button"
    BindButton.Parent = Keybind
    BindButton.BackgroundColor3 = Color3.fromRGB(37, 41, 44)
    BindButton.BackgroundTransparency = 1.000
    BindButton.BorderColor3 = Color3.fromRGB(20, 22, 24)
    BindButton.Position = UDim2.new(4.56862736, 0, 0, 0)
    BindButton.Size = UDim2.new(0, 38, 0, 18)
    BindButton.Font = Enum.Font.Gotham
    BindButton.Text = "[N/A]"
    BindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    BindButton.TextSize = 13.000
    BindButton.TextXAlignment = Enum.TextXAlignment.Right

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = BindButton
    self.gui.Size = self.gui.Size + UDim2.new(0, 0, 0, (Keybind.Size.Y.Offset + 6))

    local listening = false
    library.flags[flag] = ""
    library:Connection(BindButton, "Activated", function(...)
        BindButton.Text = "[...]"
        listening = true
    end)

    library:Connection(UIS, "InputBegan", function(input, gpe)
        if not gpe and listening then
            library.flags[flag] = input.KeyCode
            BindButton.Text = "["..string.sub(tostring(input.KeyCode), 14).."]"
            listening = false
        elseif input.KeyCode == library.flags[flag] then
            if callback then
                callback()
            end
        end
    end)
end

function section:AddToggleKeybind(name, flag, keybind_flag, callback)
    local Keybind = Instance.new("TextLabel")
    local BindButton = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")
    local Toggle = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")
    local Text = Instance.new("TextLabel")
    local Icon = Instance.new("ImageButton")

    --Properties:

    Keybind.Name = "Keybind"
    Keybind.Parent = self.gui.Options
    Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Keybind.BackgroundTransparency = 1.000
    Keybind.Position = UDim2.new(0, 0, 1.36434114, 0)
    Keybind.Size = UDim2.new(0, 51, 0, 18)
    Keybind.Font = Enum.Font.Gotham
    Keybind.Text = ""
    Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
    Keybind.TextSize = 13.000
    Keybind.TextXAlignment = Enum.TextXAlignment.Left

    BindButton.Name = "Bind Button"
    BindButton.Parent = Keybind
    BindButton.BackgroundColor3 = Color3.fromRGB(37, 41, 44)
    BindButton.BackgroundTransparency = 1.000
    BindButton.BorderColor3 = Color3.fromRGB(20, 22, 24)
    BindButton.Position = UDim2.new(4.56862736, 0, 0, 0)
    BindButton.Size = UDim2.new(0, 38, 0, 18)
    BindButton.Font = Enum.Font.Gotham
    BindButton.Text = "[N/A]"
    BindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    BindButton.TextSize = 13.000
    BindButton.TextXAlignment = Enum.TextXAlignment.Right

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = BindButton

    Toggle.Name = "Toggle"
    Toggle.Parent = Keybind
    Toggle.BackgroundColor3 = Color3.fromRGB(28, 31, 34)
    Toggle.Size = UDim2.new(0, 18, 0, 18)
    Toggle.AutoButtonColor = false
    Toggle.Font = Enum.Font.SciFi
    Toggle.Text = ""
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.TextSize = 20.000

    UICorner_2.CornerRadius = UDim.new(0, 4)
    UICorner_2.Parent = Toggle

    Text.Name = "Text"
    Text.Parent = Toggle
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.BackgroundTransparency = 1.000
    Text.Position = UDim2.new(1.3, 0, 0, 3)
    Text.Font = Enum.Font.Gotham
    Text.Text = name
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.TextSize = 13.000
    Text.Size = UDim2.fromOffset(Text.TextBounds.X, Text.TextBounds.Y)
    Text.TextXAlignment = Enum.TextXAlignment.Left
    self.gui.Size = self.gui.Size + UDim2.new(0, 0, 0, (Keybind.Size.Y.Offset + 6))

    library:Connection(Toggle, "Activated", function(...)
        library.flags[flag] = not library.flags[flag]

        local tweeninfo = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
      
        if library.flags[flag] then
            tween = TweenService:Create(Toggle, tweeninfo, {
                BackgroundColor3 = library.color
            })
            tween:Play()
        else
            tween = TweenService:Create(Toggle, tweeninfo, {
                BackgroundColor3 = Color3.fromRGB(28, 31, 34)
            })
            tween:Play()
        end
    end)

    local listening = false
    library.flags[keybind_flag] = ""
    library:Connection(BindButton, "Activated", function(...)
        BindButton.Text = "[...]"
        listening = true
    end)

    library:Connection(UIS, "InputBegan", function(input, gpe)
        if not gpe and listening then
            library.flags[keybind_flag] = input.KeyCode
            BindButton.Text = "["..string.sub(tostring(input.KeyCode), 14).."]"
            listening = false
        elseif input.KeyCode == library.flags[keybind_flag] and library.flags[flag] then
            if callback then
                callback()
            end
        end
    end)
end

return library