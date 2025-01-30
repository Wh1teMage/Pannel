local Players = game:GetService('Players')
local TweenService = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')

local PannelMethods       = {}
local CommandFabric       = {}
local CommandHelperFabric = {}

local Utility   = {}
local Draggable = {}
local Hooks     = {}

local function CreatePannel()

	local Luminary = Instance.new("ScreenGui")
	Luminary.Name = "Luminary"
	Luminary.ResetOnSpawn = false
	Luminary.Parent = Players.LocalPlayer.PlayerGui

	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.AnchorPoint = Vector2.new(0.50, 1.00)
	Main.Size = UDim2.new(0.00, 500.00, 0.00, 65.00)
	Main.Position = UDim2.new(0.41, 129.00, 0.57, 57.00)
	Main.BorderSizePixel = 0
	Main.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)
	Main.Parent = Luminary

	local MainStroke = Instance.new("UIStroke")
	MainStroke.Name = "MainStroke"
	MainStroke.Color = Color3.new(0.39, 0.39, 0.39)
	MainStroke.Parent = Main

	local MainCorner = Instance.new("UICorner")
	MainCorner.Name = "MainCorner"
	MainCorner.CornerRadius = UDim.new(0.00, 5.00)
	MainCorner.Parent = Main

	local CommandInput = Instance.new("TextBox")
	CommandInput.Name = "CommandInput"
	CommandInput.BorderSizePixel = 0
	CommandInput.BackgroundColor3 = Color3.new(0.20, 0.20, 0.20)
	CommandInput.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	CommandInput.AnchorPoint = Vector2.new(0.50, 1.00)
	CommandInput.TextSize = 14
	CommandInput.Size = UDim2.new(0.00, 490.00, 0.00, 30.00)
	CommandInput.TextColor3 = Color3.new(1.00, 1.00, 1.00)
	CommandInput.Text = ""
	CommandInput.TextXAlignment = Enum.TextXAlignment.Left
	CommandInput.Position = UDim2.new(0.50, 0.00, 1.00, -5.00)
	CommandInput.ClearTextOnFocus = false
	CommandInput.Parent = Main

	local CommandInputStroke = Instance.new("UIStroke")
	CommandInputStroke.Name = "CommandInputStroke"
	CommandInputStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	CommandInputStroke.Color = Color3.new(0.39, 0.39, 0.39)
	CommandInputStroke.Parent = CommandInput

	local CommandInputCorner = Instance.new("UICorner")
	CommandInputCorner.Name = "CommandInputCorner"
	CommandInputCorner.CornerRadius = UDim.new(0.00, 5.00)
	CommandInputCorner.Parent = CommandInput

	local CommandInputPadding = Instance.new("UIPadding")
	CommandInputPadding.Name = "CommandInputPadding"
	CommandInputPadding.PaddingLeft = UDim.new(0.00, 5.00)
	CommandInputPadding.Parent = CommandInput

	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.BorderSizePixel = 0
	Title.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)
	Title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.TextSize = 16
	Title.Size = UDim2.new(0.00, 250.00, 0.00, 20.00)
	Title.Text = "Luminary"
	Title.TextColor3 = Color3.new(1.00, 1.00, 1.00)
	Title.Position = UDim2.new(0.00, 0.00, 0.00, 4.00)
	Title.Parent = Main

	local TitlePadding = Instance.new("UIPadding")
	TitlePadding.Name = "TitlePadding"
	TitlePadding.PaddingLeft = UDim.new(0.00, 7.00)
	TitlePadding.Parent = Title

	local CloseButton = Instance.new("TextButton")
	CloseButton.Name = "CloseButton"
	CloseButton.BorderSizePixel = 0
	CloseButton.AutoButtonColor = false
	CloseButton.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)
	CloseButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	CloseButton.TextSize = 30
	CloseButton.Size = UDim2.new(0.00, 20.00, 0.00, 20.00)
	CloseButton.TextColor3 = Color3.new(1.00, 1.00, 1.00)
	CloseButton.Text = "×"
	CloseButton.Position = UDim2.new(0.00, 475.00, 0.00, 4.00)
	CloseButton.Visible = false
	CloseButton.Parent = Main

	local CloseButtonCorner = Instance.new("UICorner")
	CloseButtonCorner.Name = "CloseButtonCorner"
	CloseButtonCorner.CornerRadius = UDim.new(0.00, 5.00)
	CloseButtonCorner.Parent = CloseButton

	local CommandsHolder = Instance.new("Frame")
	CommandsHolder.Name = "CommandsHolder"
	CommandsHolder.Visible = false
	CommandsHolder.Size = UDim2.new(0.00, 500.00, 0.00, 40.00)
	CommandsHolder.Position = UDim2.new(0.00, 0.00, 0.00, -44.00)
	CommandsHolder.BorderSizePixel = 0
	CommandsHolder.BackgroundTransparency = 0.5
	CommandsHolder.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)
	CommandsHolder.Parent = Main

	local CommandsHolderStroke = Instance.new("UIStroke")
	CommandsHolderStroke.Name = "CommandsHolderStroke"
	CommandsHolderStroke.Color = Color3.new(0.39, 0.39, 0.39)
	CommandsHolderStroke.Parent = CommandsHolder

	local CommandsHolderCorner = Instance.new("UICorner")
	CommandsHolderCorner.Name = "CommandsHolderCorner"
	CommandsHolderCorner.CornerRadius = UDim.new(0.00, 5.00)
	CommandsHolderCorner.Parent = CommandsHolder

	local CommandsHolderScrolling = Instance.new("ScrollingFrame")
	CommandsHolderScrolling.Name = "CommandsHolderScrolling"
	CommandsHolderScrolling.ScrollingDirection = Enum.ScrollingDirection.Y
	CommandsHolderScrolling.BorderSizePixel = 0
	CommandsHolderScrolling.CanvasSize = UDim2.new(0.00, 500.00, 0.00, 300.00)
	CommandsHolderScrolling.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)
	CommandsHolderScrolling.Size = UDim2.new(0.00, 500.00, 0.00, 30.00)
	CommandsHolderScrolling.ScrollBarImageColor3 = Color3.new(0.39, 0.39, 0.39)
	CommandsHolderScrolling.ScrollBarThickness = 1
	CommandsHolderScrolling.BackgroundTransparency = 1
	CommandsHolderScrolling.Position = UDim2.new(0.00, 0.00, 0.00, 5.00)
	CommandsHolderScrolling.Parent = CommandsHolder

	local CommandsHolderScrollingListLayout = Instance.new("UIListLayout")
	CommandsHolderScrollingListLayout.Name = "CommandsHolderScrollingListLayout"
	CommandsHolderScrollingListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	CommandsHolderScrollingListLayout.Padding = UDim.new(0.00, 3.00)
	CommandsHolderScrollingListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	CommandsHolderScrollingListLayout.Parent = CommandsHolderScrolling

	local Templates = Instance.new("Folder")
	Templates.Name = "Templates"
	Templates.Parent = Main

	local CommandHolder = Instance.new("Frame")
	CommandHolder.Name = "CommandHolder"
	CommandHolder.Visible = false
	CommandHolder.Size = UDim2.new(0.00, 490.00, 0.00, 30.00)
	CommandHolder.BorderSizePixel = 0
	CommandHolder.BackgroundTransparency = 0.25
	CommandHolder.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)
	CommandHolder.Parent = Templates

	local PrintCommandsHolderCorner = Instance.new("UICorner")
	PrintCommandsHolderCorner.Name = "PrintCommandsHolderCorner"
	PrintCommandsHolderCorner.CornerRadius = UDim.new(0.00, 5.00)
	PrintCommandsHolderCorner.Parent = CommandHolder

	local PrintText = Instance.new("TextLabel")
	PrintText.Name = "PrintText"
	PrintText.ZIndex = 2
	PrintText.BorderSizePixel = 0
	PrintText.RichText = true
	PrintText.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)
	PrintText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	PrintText.TextXAlignment = Enum.TextXAlignment.Left
	PrintText.TextSize = 15
	PrintText.Size = UDim2.new(0.00, 490.00, 0.00, 30.00)
	PrintText.Text = "<font color = \'rgb(255, 255, 255)\'>Print</font> <font color = \'rgb(175, 175, 175)\'>{String}</font> <font color = \'rgb(100, 100, 100)\'>| </font><font color = \'rgb(175, 175, 175)\'>Prints A String.</font>"
	PrintText.TextColor3 = Color3.new(1.00, 1.00, 1.00)
	PrintText.BackgroundTransparency = 1
	PrintText.Parent = CommandHolder

	local PrintPadding = Instance.new("UIPadding")
	PrintPadding.Name = "PrintPadding"
	PrintPadding.PaddingLeft = UDim.new(0.00, 5.00)
	PrintPadding.Parent = PrintText

	local PrintButton = Instance.new("TextButton")
	PrintButton.Name = "PrintButton"
	PrintButton.ZIndex = 100
	PrintButton.BorderSizePixel = 0
	PrintButton.AutoButtonColor = false
	PrintButton.Size = UDim2.new(0.00, 490.00, 0.00, 30.00)
	PrintButton.Text = ""
	PrintButton.BackgroundTransparency = 1
	PrintButton.Parent = CommandHolder

	local PrintButtonCorner = Instance.new("UICorner")
	PrintButtonCorner.Name = "PrintButtonCorner"
	PrintButtonCorner.CornerRadius = UDim.new(0.00, 5.00)
	PrintButtonCorner.Parent = PrintButton

	local ToolTip = Instance.new("TextLabel")
	ToolTip.Name = "ToolTip"
	ToolTip.TextWrapped = true
	ToolTip.ZIndex = 100
	ToolTip.BorderSizePixel = 0
	ToolTip.RichText = true
	ToolTip.TextYAlignment = Enum.TextYAlignment.Top
	ToolTip.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)
	ToolTip.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ToolTip.AnchorPoint = Vector2.new(0.50, 0.00)
	ToolTip.TextXAlignment = Enum.TextXAlignment.Left
	ToolTip.TextSize = 15
	ToolTip.Text = ""
	ToolTip.TextColor3 = Color3.new(1.00, 1.00, 1.00)
	ToolTip.Parent = Luminary

	local ToolTipCorner = Instance.new("UICorner")
	ToolTipCorner.Name = "ToolTipCorner"
	ToolTipCorner.CornerRadius = UDim.new(0.00, 5.00)
	ToolTipCorner.Parent = ToolTip

	local ToolTipPadding = Instance.new("UIPadding")
	ToolTipPadding.Name = "ToolTipPadding"
	ToolTipPadding.PaddingTop = UDim.new(0.00, 3.00)
	ToolTipPadding.PaddingLeft = UDim.new(0.00, 3.00)
	ToolTipPadding.Parent = ToolTip

	local ToolTipStroke = Instance.new("UIStroke")
	ToolTipStroke.Name = "ToolTipStroke"
	ToolTipStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	ToolTipStroke.Color = Color3.new(0.39, 0.39, 0.39)
	ToolTipStroke.Parent = ToolTip

	local Notifications = Instance.new("Frame")
	Notifications.Name = "Notifications"
	Notifications.Size = UDim2.new(0.00, 346.00, 0.00, 591.00)
	Notifications.BorderColor3 = Color3.new(0.00, 0.00, 0.00)
	Notifications.Position = UDim2.new(0.73, 0.00, 0.00, 0.00)
	Notifications.BorderSizePixel = 0
	Notifications.BackgroundTransparency = 1
	Notifications.BackgroundColor3 = Color3.new(1.00, 1.00, 1.00)
	Notifications.Parent = Luminary

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout.Padding = UDim.new(0.00, 10.00)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Parent = Notifications

	local UIPadding = Instance.new("UIPadding")
	UIPadding.PaddingBottom = UDim.new(0.1, 0.00)
	UIPadding.Parent = Notifications

	local FramesFolder = Instance.new('Folder')
	FramesFolder.Name = 'FramesFolder'
	FramesFolder.Parent = Luminary

    return Luminary
end

type IPannel = {
    ScreenGui: typeof(CreatePannel()),
    CommandHelpersList: {},
    CommandList: {},
} & typeof(PannelMethods) & typeof(CommandFabric) & typeof(Utility)


local function BindPannelInput(self: IPannel)
    local Input = self.ScreenGui.Main.CommandInput :: TextBox

	Input:GetPropertyChangedSignal('Text'):Connect(function()

		local message = string.lower(string.split(Input.Text, ' ')[1])

		if (#message < 1) then
			CommandHelperFabric.ClearCommandHelpers(self)
			CommandHelperFabric.ChangeCommandHelperSize(self)
			return
		end

		for helperName, helper in pairs(CommandHelperFabric.GetHelpers(self)) do
			if (string.find(string.lower(helperName), message)) then continue end
			CommandHelperFabric.DestroyCommandHelper(self, helperName)
		end

		for commandName, command in pairs(self:GetCommands()) do
			if (not string.find(string.lower(commandName), message)) then continue end
			CommandHelperFabric.CreateCommandHelper(self, commandName)
		end

		CommandHelperFabric.ChangeCommandHelperSize(self)

	end)

	local lastInput = os.clock()

	Input.FocusLost:Connect(function()
		lastInput = os.clock()
	end)

	UserInputService.InputBegan:Connect(function(input, event)
		if (input.KeyCode ~= Enum.KeyCode.Tab) then return end

		local splitted = string.split(Input.Text, ' ')

		local message = string.lower(splitted[1])
		local lowest = 9999
		local selected;

		for helperName, helper in pairs(CommandHelperFabric.GetHelpers(self)) do
			if (not string.find(string.lower(helperName), message)) then continue end
			if (helper.AbsolutePosition.Y < lowest) then 
				lowest = helper.AbsolutePosition.Y
				selected = helperName
			end
		end

		if (not selected) then return end

		local additional = ''

		if (#splitted > 1) then
			local params = string.lower(table.concat(splitted, ' ', 2))
			local command = self:GetCommand(selected)

			additional = table.concat(splitted, ' ', 2)
	
			for _, parameter in pairs(command.Arguments) do
				if (not string.find(string.lower(parameter), params)) then continue end
				additional = parameter
				break
			end
		end

		Input:ReleaseFocus()
		task.wait(1/30)

		Input.Text = selected..' '..(additional)

		Input:CaptureFocus()
	end)

	UserInputService.InputBegan:Connect(function(input, event)

		if (input.KeyCode ~= Enum.KeyCode.Return 
			and input.KeyCode ~= Enum.KeyCode.KeypadEnter) then return end

		if (os.clock() - lastInput) > .1 then return end

		local message = Input.Text
		if (#message < 1) then return end

		local separated = string.split(message, ' ') 

		for commandName, command in pairs(self:GetCommands()) do
			if (string.lower(commandName) ~= string.lower(separated[1])) then continue end
			self:GetCommand(commandName).Function(table.unpack(separated, 2))
		end

		Input:ReleaseFocus()

		CommandHelperFabric.ClearCommandHelpers(self)
		CommandHelperFabric.ChangeCommandHelperSize(self)
	end)
end


--** Utility


function Utility:UpdateDrag(Input, Object)
	local Delta = Input.Position - Draggable[Object]['DragStart']

	local StartPosition = Draggable[Object]['StartPosition']
	local info = TweenInfo.new(.25)

	local Position = UDim2.new(Object.Position.X.Scale, StartPosition.X.Offset + Delta.X, 
		Object.Position.Y.Scale, StartPosition.Y.Offset + Delta.Y)

	TweenService:Create(Object, info, {Position = Position}):Play()
end

function Utility:SetupDrag(Object)

	Object.InputBegan:Connect(function(Input)
		if Input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

		Draggable[Object] = {}

		Draggable[Object]['Dragging'] = true
		Draggable[Object]['DragStart'] = Input.Position
		Draggable[Object]['StartPosition'] = Object.Position

		Input.Changed:Connect(function()
			if Input.UserInputState ~= Enum.UserInputState.End then return end
			if (not Draggable[Object]) then return end

			Draggable[Object]['Dragging'] = false 
			table.clear(Draggable[Object])
			Draggable[Object] = nil

		end)

	end)

	UserInputService.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement and 
			Draggable[Object] and
			Draggable[Object]['Dragging'] then

			self:UpdateDrag(Input, Object)
		end
	end)

end

function Utility:CreateHook(name: string, callback: (...any) -> ())
    if (not Hooks[name]) then Hooks[name] = {} end
    table.insert(Hooks[name], callback)
end

function Utility:UpdateHook(name: string, ...)
    if (not Hooks[name]) then return end

    for _, callback in pairs(Hooks[name]) do
        callback(...)
    end
end

function Utility:DestroyHook(name: string)
    if (not Hooks[name]) then return end
    table.clear(Hooks[name])
    Hooks[name] = {}
end


--** Pannel Methods


function PannelMethods.CreateFrame(self: IPannel, name: string)

	local origin = self.ScreenGui.Main

	local Main = origin:Clone()
	Main.Name = name
	Main.AnchorPoint = Vector2.new(0.50, 1.00)
	Main.Size = UDim2.new(0.00, 500.00, 0.00, 0.00)
	Main.Position = UDim2.new(0.41, 129.00, 0.84, 57.00)
	Main.BorderSizePixel = 0
	Main.BackgroundTransparency = 0.2
	Main.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)
	Main.Parent = self.ScreenGui.FramesFolder

	Main.Title.Text = name
	Main.Title.BackgroundTransparency = 1
	Main.CloseButton.BackgroundTransparency = 1

	local CommandsHolder = Main.CommandsHolder
	CommandsHolder.Name = "CommandsHolder"
	CommandsHolder.Size = UDim2.new(0.00, 500.00, 0.00, 0.00)-- UDim2.new(0.00, 0.00, 0.00, 0.00)
	CommandsHolder.Position = UDim2.new(0.00, 0.00, 0.00, 30.00)
	CommandsHolder.BorderSizePixel = 0
	CommandsHolder.BackgroundTransparency = 1
	CommandsHolder.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)

	local CommandsHolderScrolling = Main.CommandsHolder.CommandsHolderScrolling
	CommandsHolderScrolling.Name = "CommandsHolderScrolling"
	CommandsHolderScrolling.ScrollingDirection = Enum.ScrollingDirection.Y
	CommandsHolderScrolling.BorderSizePixel = 0
	CommandsHolderScrolling.CanvasSize = UDim2.new(0.00, 500.00, 0.00, 300.00)
	CommandsHolderScrolling.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)
	CommandsHolderScrolling.Size = UDim2.new(0.00, 500.00, 0.00, 0.00) --UDim2.new(0.00, 0.00, 0.00, 0.00)
	CommandsHolderScrolling.ScrollBarImageColor3 = Color3.new(0.39, 0.39, 0.39)
	CommandsHolderScrolling.ScrollBarThickness = 1
	CommandsHolderScrolling.BackgroundTransparency = 1
	CommandsHolderScrolling.Position = UDim2.new(0.00, 0.00, 0.00, 5.00)

    TweenService:Create(Main, TweenInfo.new(.5), {
        Size = UDim2.new(0.00, 500.00, 0.00, 228.00)
    }):Play()

    
    TweenService:Create(CommandsHolder, TweenInfo.new(.5), {
        Size = UDim2.new(0.00, 500.00, 0.00, 198.00)
    }):Play()

    TweenService:Create(CommandsHolderScrolling, TweenInfo.new(.5), {
        Size = UDim2.new(0.00, 500.00, 0.00, 193.00)
    }):Play()
    

	Main.Templates:Destroy()
	Main.CommandInput:Destroy()
    Main.CloseButton.Visible = true

	for _, obj in pairs(Main.CommandsHolder.CommandsHolderScrolling:GetChildren()) do
		if (not obj:IsA('Frame')) then continue end
		obj:Destroy()
	end

	Main.CloseButton.MouseButton1Down:Connect(function()
		Main:Destroy()
	end)

	Utility:SetupDrag(Main)

	return Main

end


function PannelMethods.CreateNotification(self: IPannel, title: string, text: string, duration: number)

	duration = math.max(duration, 1)

	local Notification1 = Instance.new("Frame")
	Notification1.Name = "Notification1"
	Notification1.AnchorPoint = Vector2.new(1.00, 1.00)
	Notification1.Size = UDim2.new(0.00, 0.00, 0.00, 44.00)
	Notification1.Position = UDim2.new(1.00, 0, 1.00, 0)
	Notification1.BorderSizePixel = 0
	Notification1.BackgroundColor3 = Color3.new(0.16, 0.16, 0.16)
	Notification1.Parent = self.ScreenGui.Notifications

	local NotificationCorner = Instance.new("UICorner")
	NotificationCorner.Name = "NotificationCorner"
	NotificationCorner.CornerRadius = UDim.new(0.00, 5.00)
	NotificationCorner.Parent = Notification1

	local NotificationStroke = Instance.new("UIStroke")
	NotificationStroke.Name = "NotificationStroke"
	NotificationStroke.Color = Color3.new(0.39, 0.39, 0.39)
	NotificationStroke.Parent = Notification1

	local NotificationTitle = Instance.new("TextLabel")
	NotificationTitle.Name = "NotificationTitle"
	NotificationTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
	NotificationTitle.TextSize = 16
	NotificationTitle.Size = UDim2.new(0.00, 300.00, 0.00, 30.00)
	NotificationTitle.Text = title
	NotificationTitle.TextColor3 = Color3.new(1.00, 1.00, 1.00)
	NotificationTitle.BackgroundTransparency = 1
	NotificationTitle.Position = UDim2.new(0.00, 0.00, 0.00, -1.00)
	NotificationTitle.Parent = Notification1

	local NotificationTitlePadding = Instance.new("UIPadding")
	NotificationTitlePadding.Name = "NotificationTitlePadding"
	NotificationTitlePadding.PaddingLeft = UDim.new(0.00, 7.00)
	NotificationTitlePadding.Parent = NotificationTitle

	local NotificationText = Instance.new("TextLabel")
	NotificationText.Name = "NotificationText"
	NotificationText.TextWrapped = true
	NotificationText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	NotificationText.TextXAlignment = Enum.TextXAlignment.Left
	NotificationText.TextSize = 14
	NotificationText.Size = UDim2.new(0.00, 300.00, 0.00, 14.00)
	NotificationText.Text = text
	NotificationText.TextColor3 = Color3.new(0.69, 0.69, 0.69)
	NotificationText.BackgroundTransparency = 1
	NotificationText.Position = UDim2.new(0.00, 0.00, 0.00, 25.00)
	NotificationText.Parent = Notification1

	local NotificationTextPadding = Instance.new("UIPadding")
	NotificationTextPadding.Name = "NotificationTextPadding"
	NotificationTextPadding.PaddingLeft = UDim.new(0.00, 7.00)
	NotificationTextPadding.Parent = NotificationText

    TweenService:Create(Notification1, TweenInfo.new(.5), { 
        Size = UDim2.fromOffset(300, 44)
    } ):Play()

	task.delay(duration-.5, function()
		TweenService:Create(Notification1, TweenInfo.new(.5), { 
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, 44)
		} ):Play()
		task.wait(.5)
		Notification1:Destroy()
	end)

end

function PannelMethods.CreateHolder(self: IPannel, parent: Instance)
	local Templates = self.ScreenGui.Main.Templates
	local Template = Templates.CommandHolder:Clone() :: Frame

	Template.Parent = parent
	Template.Visible = true

	return Template
end


--** Command Helpers


function CommandHelperFabric.ChangeCommandHelperSize(self: IPannel)
	local holder = self.ScreenGui.Main.CommandsHolder
	local scroll = holder.CommandsHolderScrolling

	local info = TweenInfo.new(.3)
	local amount = CommandHelperFabric.GetCommandHelpersAmount(self)

	task.delay(info.Time, function()
		if (CommandHelperFabric.GetCommandHelpersAmount(self) > 0) then return end
		holder.Visible = false
	end)

	TweenService:Create(holder, info, {
		Position = UDim2.fromOffset(0, -14-amount*30),
		Size = UDim2.fromOffset(500, math.min(300, 10+amount*30)),
	}):Play()

	TweenService:Create(scroll, info, {
		Size = UDim2.fromOffset(500, math.min(300, amount*30)),
		CanvasSize = UDim2.fromOffset(500, 10+amount*30),
	}):Play()

	holder.Visible = true
end

function CommandHelperFabric.GetCommandHelpersAmount(self: IPannel)
	local count = 0

	for _, v in pairs(self.CommandHelpersList) do
		count += 1
	end

	return count
end

function CommandHelperFabric.CreateCommandHelper(self: IPannel, name: string)
	if (self.CommandHelpersList[name]) then return end
	local command = self:GetCommand(name)

	local Templates = self.ScreenGui.Main.Templates
	local Template = Templates.CommandHolder:Clone() :: Frame

	local Input = self.ScreenGui.Main.CommandInput

	Template.PrintText.Text = 
		'<font color = "rgb(255, 255, 255)">'..command.Name..'</font>'..
		'<font color = "rgb(175, 175, 175)"> { '..command.Type..' } </font>'..
		'<font color = "rgb(100, 100, 100)">| </font>'..
		'<font color = "rgb(175, 175, 175)">'..command.Description..'</font>'


	Template.PrintButton.MouseButton1Down:Connect(function()
		local separated = string.split(Input.Text, ' ') 
		local additional = ''

		if (#separated > 1) then
			local params = string.lower(table.concat(separated, ' ', 2))

			additional = table.concat(separated, ' ', 2)
	
			for _, parameter in pairs(command.Arguments) do
				if (not string.find(string.lower(parameter), params)) then continue end
				additional = parameter
				break
			end
		end

		Input.Text = command.Name..' '..(additional)
	end)

	self.CommandHelpersList[name] = Template

	Template.Name = name
	Template.Parent = self.ScreenGui.Main.CommandsHolder.CommandsHolderScrolling
	Template.Visible = true
end

function CommandHelperFabric.DestroyCommandHelper(self: IPannel, name: string)
	self.CommandHelpersList[name]:Destroy()
	self.CommandHelpersList[name] = nil
end

function CommandHelperFabric.ClearCommandHelpers(self: IPannel)
	for name, _ in pairs(self.CommandHelpersList) do
		CommandHelperFabric.DestroyCommandHelper(self, name)
	end
end

function CommandHelperFabric.GetHelpers(self: IPannel)
    return self.CommandHelpersList
end


--** Commands


function CommandFabric.CreateCommand(self: IPannel, name: string, type: string, arguments: {string}, description: string, func: (...any) -> ())
	if (self.CommandList[name]) then return end

	local command = {
		Name = name,
		Type = type,
		Arguments = arguments,
		Description = description,
		Function = func
	}

	self.CommandList[name] = command

	return command
end

function CommandFabric.GetCommand(self: IPannel, name: string)
	return self.CommandList[name]
end

function CommandFabric.GetCommands(self: IPannel)
	return self.CommandList
end

function CommandFabric.DestroyCommand(self: IPannel, name: string)
	if (not self.CommandList[name]) then return end
	table.clear(self.CommandList[name])
	self.CommandList[name] = nil
end

function CommandFabric.UseCommand(self: IPannel, name: string, ...)
	if (not self.CommandList[name]) then return end
	self.CommandList[name].Function(...)
end

function CommandFabric.UpdateCommand(self: IPannel, name: string, arguments: {string})
	if (not self.CommandList[name]) then return end
	self.CommandList[name].Arguments = arguments
end


--** Pannel


local PannelUI = {}

function PannelUI.new() : IPannel

    local self = setmetatable({

        ScreenGui = CreatePannel(),
        CommandHelpersList = {},
        CommandList = {},


    }, {
        __index = function(_, i)
            return PannelMethods[i] or CommandFabric[i] or Utility[i]
        end
    })

    BindPannelInput(self)
    Utility:SetupDrag(self.ScreenGui.Main)

    return self
end

return PannelUI
