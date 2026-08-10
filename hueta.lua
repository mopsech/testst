-- ========================================
-- ===== NEVERLOSE UI LIBRARY + PLANET HUB =====
-- ========================================

do
	local Constant = 'LPH_'..'NO_VIRTUALIZE';
	getfenv()[Constant] = getfenv()[Constant] or function(f) return f end;
end;

local NeverLose = {};

NeverLose.BuiltInRegular = Font.new('rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json',Enum.FontWeight.Regular,Enum.FontStyle.Normal);
NeverLose.BuiltInBold = Font.new('rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json',Enum.FontWeight.Bold,Enum.FontStyle.Normal);
NeverLose.GlobalSignals = {};

local cloneref: cloneref = cloneref or function(f) return f end;
local TweenService: TweenService = cloneref(game:GetService('TweenService'));
local UserInputService: UserInputService = cloneref(game:GetService('UserInputService'));
local TextService: TextService = cloneref(game:GetService('TextService'));
local RunService: RunService = cloneref(game:GetService('RunService'));
local Players: Players = cloneref(game:GetService('Players'));
local HttpService: HttpService = cloneref(game:GetService('HttpService'));
local LocalPlayer: Player = Players.LocalPlayer;
local CoreGui: PlayerGui = (gethui and gethui()) or (get_hidden_gui and get_hidden_gui()) or cloneref(game:FindFirstChild('CoreGui')) or cloneref(LocalPlayer.PlayerGui);
local Mouse: Mouse = LocalPlayer:GetMouse();
local CurrentCamera: Camera = cloneref(workspace.CurrentCamera);
local ProtectGui = protect_gui or protectgui or (syn and syn.protect_gui) or function(s) return s; end;
local GlobalWindow = Instance.new('ScreenGui');
local ManualTween = TweenInfo.new(0.1);
local SlowyTween = TweenInfo.new(0.175);
local FastTween = TweenInfo.new(0.05);
local VSlowTween = TweenInfo.new(0.5,Enum.EasingStyle.Quint);
local Encryption = {};

NeverLose.RandomString = LPH_NO_VIRTUALIZE(function()
	return string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4))..string.rep(string.char(math.random(1,7)),math.random(1,4));
end);

ProtectGui(GlobalWindow);

GlobalWindow.Name = NeverLose.RandomString();
GlobalWindow.IgnoreGuiInset = true;
GlobalWindow.ZIndexBehavior = Enum.ZIndexBehavior.Global;
GlobalWindow.ResetOnSpawn = false;
GlobalWindow.Parent = CoreGui;
NeverLose.ScreenGui = GlobalWindow;
NeverLose.AccentColor = Color3.fromRGB(78, 127, 252);
NeverLose.RegisiteryColor = {};

function NeverLose:AddSignal(RBXSignal)
	if NeverLose.UnloadEnabled then
		table.insert(NeverLose.GlobalSignals,RBXSignal);	
	end;

	return RBXSignal;
end;

NeverLose.IsStudio = RunService:IsStudio();
NeverLose.IsMobile = UserInputService.TouchEnabled;

NeverLose.CreateInput = LPH_NO_VIRTUALIZE(function(self , Frame , Callback)
	local Button = Instance.new('ImageButton',Frame);

	Button.ZIndex = Frame.ZIndex + 10;
	Button.Size = UDim2.fromScale(1,1);
	Button.BackgroundTransparency = 1;
	Button.ImageTransparency = 1;
	Button.Image = "rbxasset://textuers/translateIcon.png";

	if Callback then
		local bth_signal = Button.MouseButton1Click:Connect(Callback);

		return bth_signal;
	end;

	return Button;
end);

NeverLose.PlayAnimate = LPH_NO_VIRTUALIZE(function(Self , Info , Property)
	local Tween = TweenService:Create(Self , Info or TweenInfo.new(0.25) , Property);

	Tween:Play();

	return Tween;
end);

function NeverLose:RollingEffect(parent)
	local UIGradient = Instance.new("UIGradient")

	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.5), NumberSequenceKeypoint.new(1.00, 0.00)}
	UIGradient.Parent = parent

	return UIGradient;
end;

function NeverLose:MarkLoad(LoaderFrame)
	local LoadingFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local IconFrame = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local UIStroke_2 = Instance.new("UIStroke")
	local Icon = Instance.new("TextLabel")

	LoadingFrame.Name = NeverLose.RandomString();
	LoadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	LoadingFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 13)
	LoadingFrame.BackgroundTransparency = 0.500
	LoadingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadingFrame.BorderSizePixel = 0
	LoadingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
	LoadingFrame.ZIndex = 100

	UICorner.Parent = LoadingFrame

	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(45, 48, 58)
	UIStroke.Parent = LoadingFrame

	IconFrame.Name = NeverLose.RandomString();
	IconFrame.Parent = LoadingFrame
	IconFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	IconFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
	IconFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	IconFrame.BorderSizePixel = 0
	IconFrame.ClipsDescendants = true
	IconFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	IconFrame.Size = UDim2.new(0.300000012, 0, 0.300000012, 0)
	IconFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
	IconFrame.ZIndex = 101

	UICorner_2.Parent = IconFrame

	UIStroke_2.Transparency = 0.650
	UIStroke_2.Color = Color3.fromRGB(45, 48, 58)
	UIStroke_2.Parent = IconFrame

	Icon.Name = NeverLose.RandomString();
	Icon.Parent = IconFrame
	Icon.AnchorPoint = Vector2.new(0.5, 0.5)
	Icon.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
	Icon.BackgroundTransparency = 1.000
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderSizePixel = 0
	Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
	Icon.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
	Icon.ZIndex = 102
	Icon.FontFace = NeverLose.BuiltInBold
	Icon.Text = "arrow-spin-clockwise"
	Icon.TextColor3 = Color3.fromRGB(78, 127, 252)
	Icon.TextSize = 30.000
	Icon.TextTransparency = 0.250
	Icon.TextWrapped = true

	local lib = {};

	lib.SetValue = LPH_NO_VIRTUALIZE(function(value)
		if lib.Thread then
			task.cancel(lib.Thread);
			lib.Thread = nil;
		end;

		if value then
			LoadingFrame.Parent = LoaderFrame;

			NeverLose.PlayAnimate(LoadingFrame,SlowyTween,{
				BackgroundTransparency = 0.500
			})	

			NeverLose.PlayAnimate(UIStroke,SlowyTween,{
				Transparency = 0.650
			})	

			NeverLose.PlayAnimate(IconFrame,SlowyTween,{
				BackgroundTransparency = 0,
				Size = UDim2.new(0.300000012, 0, 0.300000012, 0)
			})	

			NeverLose.PlayAnimate(UIStroke_2,SlowyTween,{
				Transparency = 0.650
			})	

			NeverLose.PlayAnimate(Icon,SlowyTween,{
				TextTransparency = 0.250
			})	

			lib.Thread = task.spawn(function()
				while true do task.wait()
					NeverLose.PlayAnimate(Icon,SlowyTween,{
						Rotation = Icon.Rotation + 45
					})
				end;
			end);
		else
			NeverLose.PlayAnimate(LoadingFrame,SlowyTween,{
				BackgroundTransparency = 1
			})	

			NeverLose.PlayAnimate(UIStroke,SlowyTween,{
				Transparency = 1
			})	

			NeverLose.PlayAnimate(IconFrame,SlowyTween,{
				BackgroundTransparency = 1,
				Size = UDim2.new(0.15, 0, 0.15, 0)
			})	

			NeverLose.PlayAnimate(UIStroke_2,SlowyTween,{
				Transparency = 1
			})	

			NeverLose.PlayAnimate(Icon,SlowyTween,{
				TextTransparency = 1
			})	
		end;
	end);

	lib.SetValue(false);

	return lib;
end;

function NeverLose:CreateShadow(parent , RollingEffect)
	local Shadow = {};

	local UIShadowSafe85 = Instance.new("UIStroke")
	local UIShadowSafe65 = Instance.new("UIStroke")
	local UIShadowSafe50 = Instance.new("UIStroke")
	local UIShadowSafe45 = Instance.new("UIStroke")

	UIShadowSafe85.Thickness = 6.000
	UIShadowSafe85.Transparency = 1
	UIShadowSafe85.Parent = parent

	UIShadowSafe65.Thickness = 5.000
	UIShadowSafe65.Transparency = 1
	UIShadowSafe65.Parent = parent

	UIShadowSafe50.Thickness = 4.000
	UIShadowSafe50.Transparency = 1
	UIShadowSafe50.Parent = parent

	UIShadowSafe45.Thickness = 3.000
	UIShadowSafe45.Transparency = 1
	UIShadowSafe45.Parent = parent

	local RollingEffectThread;
	local r1,r2,r3,r4;

	if RollingEffect then
		r1 = NeverLose:RollingEffect(UIShadowSafe85);
		r2 = NeverLose:RollingEffect(UIShadowSafe65);
		r3 = NeverLose:RollingEffect(UIShadowSafe50);
		r4 = NeverLose:RollingEffect(UIShadowSafe45);
	end;

	Shadow.Render = LPH_NO_VIRTUALIZE(function(self , value)
		if RollingEffectThread then
			task.cancel(RollingEffectThread);
			RollingEffectThread = nil;
		end;

		if value then
			NeverLose.PlayAnimate(UIShadowSafe85 , SlowyTween , {
				Transparency = 0.900
			})

			NeverLose.PlayAnimate(UIShadowSafe65 , SlowyTween , {
				Transparency = 0.900
			})

			NeverLose.PlayAnimate(UIShadowSafe50 , SlowyTween , {
				Transparency = 0.900
			})

			NeverLose.PlayAnimate(UIShadowSafe45 , SlowyTween , {
				Transparency = 0.900
			})

			if RollingEffect then
				RollingEffectThread = task.spawn(function()
					local level = 20;
					while true do task.wait(0.025)
						NeverLose.PlayAnimate(r1 , SlowyTween , {
							Rotation = r1.Rotation + level
						});

						NeverLose.PlayAnimate(r2 , SlowyTween , {
							Rotation = r2.Rotation + level
						});

						NeverLose.PlayAnimate(r3 , SlowyTween , {
							Rotation = r3.Rotation + level
						});

						NeverLose.PlayAnimate(r4 , SlowyTween , {
							Rotation = r4.Rotation + level
						});
					end;
				end);
			end;
		else
			NeverLose.PlayAnimate(UIShadowSafe85 , SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(UIShadowSafe65 , SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(UIShadowSafe50 , SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(UIShadowSafe45 , SlowyTween , {
				Transparency = 1
			})
		end;
	end);

	return Shadow;
end;

NeverLose.ProcessParams = LPH_NO_VIRTUALIZE(function(self , Params , Fixed)
	Params = Params or {};

	local k = Params or {};

	for i,v in next , Fixed do
		rawset(k,i , rawget(Params,i) or v)
	end;

	table.clear(Fixed);

	return k;
end);

function NeverLose.new(Config)
	Config = NeverLose:ProcessParams(Config , {
		Name = "Neverlose",
		Content = "Available Products",
		Process = "Script will automatically load.",
		Default = "",
		Yield = true,
		DefaultVersion = nil,
		OnGetKey = function() end,
		OnRedeem = function() end,
	});

	local LoaderLib = {};
	local LoaderFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local WindowName = Instance.new("TextLabel")
	local WindowContent = Instance.new("TextLabel")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local SubSpace = Instance.new("Frame")
	local InputFrame = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local TextBox = Instance.new("TextBox")
	local KeyFrame = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local UIStroke_2 = Instance.new("UIStroke")
	local Content = Instance.new("TextLabel")
	local Icon = Instance.new("TextLabel")
	local RedeemFrame = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local UIStroke_3 = Instance.new("UIStroke")
	local Content_2 = Instance.new("TextLabel")
	local Icon_2 = Instance.new("TextLabel")
	local Shadow = NeverLose:CreateShadow(LoaderFrame,true);

	LoaderLib.MarkLoad = NeverLose:MarkLoad(LoaderFrame);
	LoaderLib.YieldEvent = Instance.new('BindableEvent',LoaderFrame);

	LoaderFrame.Name = "LOADER="..NeverLose.RandomString();
	LoaderFrame.Parent = NeverLose.ScreenGui
	LoaderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	LoaderFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 13)
	LoaderFrame.BackgroundTransparency = 0.055
	LoaderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoaderFrame.BorderSizePixel = 0
	LoaderFrame.ClipsDescendants = true
	LoaderFrame.Position = UDim2.new(255,255,255,255)
	LoaderFrame.Size = UDim2.new(0, 350, 0, 15)

	UICorner.Parent = LoaderFrame

	WindowName.Name = NeverLose.RandomString();
	WindowName.Parent = LoaderFrame
	WindowName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowName.BackgroundTransparency = 1.000
	WindowName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowName.BorderSizePixel = 0
	WindowName.Position = UDim2.new(0, 15, 0, 4)
	WindowName.Size = UDim2.new(0, 200, 0, 25)
	WindowName.ZIndex = 7
	WindowName.Font = Enum.Font.GothamBold
	WindowName.Text = Config.Name
	WindowName.TextColor3 = Color3.fromRGB(255, 255, 255)
	WindowName.TextSize = 21.000
	WindowName.TextXAlignment = Enum.TextXAlignment.Left

	WindowContent.Name = NeverLose.RandomString();
	WindowContent.Parent = LoaderFrame
	WindowContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowContent.BackgroundTransparency = 1.000
	WindowContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowContent.BorderSizePixel = 0
	WindowContent.Position = UDim2.new(0, 15, 0, 25)
	WindowContent.Size = UDim2.new(0, 200, 0, 15)
	WindowContent.ZIndex = 7
	WindowContent.Font = Enum.Font.GothamBold
	WindowContent.Text = Config.Content
	WindowContent.TextColor3 = Color3.fromRGB(255, 255, 255)
	WindowContent.TextSize = 10.000
	WindowContent.TextTransparency = 0.650
	WindowContent.TextXAlignment = Enum.TextXAlignment.Left

	ScrollingFrame.Parent = LoaderFrame
	ScrollingFrame.Active = true
	ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0)
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0.5, 0, 0, 55)
	ScrollingFrame.Size = UDim2.new(1, -20, 1, -150)
	ScrollingFrame.ZIndex = 7
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame.ScrollBarThickness = 0

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	SubSpace.Name = NeverLose.RandomString();
	SubSpace.Parent = ScrollingFrame
	SubSpace.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SubSpace.BackgroundTransparency = 1.000
	SubSpace.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SubSpace.BorderSizePixel = 0

	InputFrame.Name = "InputFrame"
	InputFrame.Parent = LoaderFrame
	InputFrame.AnchorPoint = Vector2.new(0.5, 1)
	InputFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
	InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	InputFrame.BorderSizePixel = 0
	InputFrame.Position = UDim2.new(0.5, 0, 1, -55)
	InputFrame.Size = UDim2.new(1, -25, 0, 35)
	InputFrame.ZIndex = 10

	UICorner_2.Parent = InputFrame

	UIStroke.Transparency = 0.650
	UIStroke.Color = Color3.fromRGB(45, 48, 58)
	UIStroke.Parent = InputFrame

	TextBox.Parent = InputFrame
	TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
	TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BackgroundTransparency = 1.000
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextBox.Size = UDim2.new(1, -20, 0, 30)
	TextBox.ZIndex = 17
	TextBox.ClearTextOnFocus = false
	TextBox.Font = Enum.Font.GothamMedium
	TextBox.PlaceholderText = "Product Key"
	TextBox.Text = Config.Default
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.TextSize = 11.000
	TextBox.TextTransparency = 0.350
	TextBox.TextXAlignment = Enum.TextXAlignment.Left

	KeyFrame.Name = NeverLose.RandomString();
	KeyFrame.Parent = LoaderFrame
	KeyFrame.AnchorPoint = Vector2.new(0.5, 1)
	KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
	KeyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	KeyFrame.BorderSizePixel = 0
	KeyFrame.Position = UDim2.new(0.25999999, 0, 1, -10)
	KeyFrame.Size = UDim2.new(0.5, -20, 0, 35)
	KeyFrame.ZIndex = 10

	UICorner_3.Parent = KeyFrame

	UIStroke_2.Transparency = 0.650
	UIStroke_2.Color = Color3.fromRGB(45, 48, 58)
	UIStroke_2.Parent = KeyFrame

	Content.Name = NeverLose.RandomString();
	Content.Parent = KeyFrame
	Content.AnchorPoint = Vector2.new(0, 0.5)
	Content.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
	Content.BackgroundTransparency = 1.000
	Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Content.BorderSizePixel = 0
	Content.Position = UDim2.new(0, 35, 0.5, 0)
	Content.Size = UDim2.new(0, 1, 0, 25)
	Content.ZIndex = 17
	Content.Font = Enum.Font.GothamBold
	Content.Text = "Get Key"
	Content.TextColor3 = Color3.fromRGB(186, 186, 186)
	Content.TextSize = 15.000
	Content.TextTransparency = 0.200
	Content.TextXAlignment = Enum.TextXAlignment.Left

	Icon.Name = NeverLose.RandomString();
	Icon.Parent = KeyFrame
	Icon.AnchorPoint = Vector2.new(0, 0.5)
	Icon.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
	Icon.BackgroundTransparency = 1.000
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderSizePixel = 0
	Icon.Position = UDim2.new(0, 10, 0.5, 0)
	Icon.Size = UDim2.new(0, 20, 0, 20)
	Icon.ZIndex = 17
	Icon.FontFace = NeverLose.BuiltInBold
	Icon.Text = "chain-link"
	Icon.TextColor3 = Color3.fromRGB(78, 127, 252)
	Icon.TextSize = 18.000
	Icon.TextTransparency = 0.250
	Icon.TextWrapped = true

	RedeemFrame.Name = "RedeemFrame"
	RedeemFrame.Parent = LoaderFrame
	RedeemFrame.AnchorPoint = Vector2.new(0.5, 1)
	RedeemFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
	RedeemFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RedeemFrame.BorderSizePixel = 0
	RedeemFrame.Position = UDim2.new(0.74000001, 0, 1, -10)
	RedeemFrame.Size = UDim2.new(0.5, -20, 0, 35)
	RedeemFrame.ZIndex = 10

	UICorner_4.Parent = RedeemFrame

	UIStroke_3.Transparency = 0.650
	UIStroke_3.Color = Color3.fromRGB(45, 48, 58)
	UIStroke_3.Parent = RedeemFrame

	Content_2.Name = NeverLose.RandomString();
	Content_2.Parent = RedeemFrame
	Content_2.AnchorPoint = Vector2.new(0, 0.5)
	Content_2.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
	Content_2.BackgroundTransparency = 1.000
	Content_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Content_2.BorderSizePixel = 0
	Content_2.Position = UDim2.new(0, 35, 0.5, 0)
	Content_2.Size = UDim2.new(0, 1, 0, 25)
	Content_2.ZIndex = 17
	Content_2.Font = Enum.Font.GothamBold
	Content_2.Text = "Login"
	Content_2.TextColor3 = Color3.fromRGB(186, 186, 186)
	Content_2.TextSize = 15.000
	Content_2.TextTransparency = 0.200
	Content_2.TextXAlignment = Enum.TextXAlignment.Left

	Icon_2.Name = NeverLose.RandomString();
	Icon_2.Parent = RedeemFrame
	Icon_2.AnchorPoint = Vector2.new(0, 0.5)
	Icon_2.BackgroundColor3 = Color3.fromRGB(186, 186, 186)
	Icon_2.BackgroundTransparency = 1.000
	Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon_2.BorderSizePixel = 0
	Icon_2.Position = UDim2.new(0, 10, 0.5, 0)
	Icon_2.Size = UDim2.new(0, 20, 0, 20)
	Icon_2.ZIndex = 17
	Icon_2.FontFace = NeverLose.BuiltInBold
	Icon_2.Text = "gift-card"
	Icon_2.TextColor3 = Color3.fromRGB(78, 127, 252)
	Icon_2.TextSize = 18.000
	Icon_2.TextTransparency = 0.250
	Icon_2.TextWrapped = true

	LoaderLib.Renderer = {};

	-- НАСТРОЙКА КНОПКИ "Get Key"
	local keyPressed = false
	NeverLose:AddSignal(NeverLose:CreateInput(KeyFrame,function()
		if keyPressed then return end
		keyPressed = true
		
		-- Меняем текст
		Content.Text = "Text copied!"
		Content.TextSize = 11
		Content.TextColor3 = Color3.fromRGB(100, 255, 100)
		Icon.Text = "check"
		
		-- Копируем ссылку в буфер обмена
		local link = "https://t.me/planethubgithub"
		setclipboard(link)
		
		-- Возвращаем через 2 секунды
		task.delay(2, function()
			Content.Text = "Get Key"
			Content.TextSize = 15
			Content.TextColor3 = Color3.fromRGB(186, 186, 186)
			Icon.Text = "chain-link"
			keyPressed = false
		end)
		
		return Config.OnGetKey();
	end))

	local ratelimit = false;
	NeverLose:AddSignal(NeverLose:CreateInput(RedeemFrame,function()
		if ratelimit then
			return;
		end;

		ratelimit = true;

		local check,rason = Config.OnRedeem(TextBox.Text);

		if check then
			TextBox.TextEditable = false;

			LoaderLib.MarkLoad.SetValue(true);

			task.wait(0.1);

			return LoaderLib.YieldEvent:Fire(TextBox.Text);
		else
			if rason then
				TextBox.Text = tostring(rason);
				task.wait(0.75);
				TextBox.Text = "";
			else
				TextBox.Text = "";
			end;
		end;

		ratelimit = false;
	end))

	NeverLose:AddSignal(KeyFrame.MouseEnter:Connect(function()
		NeverLose.PlayAnimate(KeyFrame,SlowyTween,{
			BackgroundColor3 = Color3.fromRGB(35, 38, 47)
		})
	end));

	NeverLose:AddSignal(KeyFrame.MouseLeave:Connect(function()
		NeverLose.PlayAnimate(KeyFrame,SlowyTween,{
			BackgroundColor3 = Color3.fromRGB(20, 22, 27)
		})
	end));

	NeverLose:AddSignal(RedeemFrame.MouseEnter:Connect(function()
		NeverLose.PlayAnimate(RedeemFrame,SlowyTween,{
			BackgroundColor3 = Color3.fromRGB(35, 38, 47)
		})
	end));

	NeverLose:AddSignal(RedeemFrame.MouseLeave:Connect(function()
		NeverLose.PlayAnimate(RedeemFrame,SlowyTween,{
			BackgroundColor3 = Color3.fromRGB(20, 22, 27)
		})
	end));

	NeverLose:AddSignal(InputFrame.MouseEnter:Connect(function()
		NeverLose.PlayAnimate(InputFrame,SlowyTween,{
			BackgroundColor3 = Color3.fromRGB(35, 38, 47)
		})
	end));

	NeverLose:AddSignal(InputFrame.MouseLeave:Connect(function()
		NeverLose.PlayAnimate(InputFrame,SlowyTween,{
			BackgroundColor3 = Color3.fromRGB(20, 22, 27)
		})
	end));

	LoaderLib.SetRender = LPH_NO_VIRTUALIZE(function(self , value)
		if value then
			LoaderFrame.Position = UDim2.new(0.5,0,0.5,0)

			NeverLose.PlayAnimate(LoaderFrame,VSlowTween , {
				BackgroundTransparency = 0.055,
				Size = UDim2.new(0, 350, 0, UIListLayout.AbsoluteContentSize.Y + 160)
			});

			NeverLose.PlayAnimate(WindowName,SlowyTween , {
				TextTransparency = 0
			})

			NeverLose.PlayAnimate(WindowContent,SlowyTween , {
				TextTransparency = 0.650
			})

			NeverLose.PlayAnimate(InputFrame,SlowyTween , {
				BackgroundTransparency = 0.05
			})

			NeverLose.PlayAnimate(UIStroke,SlowyTween , {
				Transparency = 0.650
			})

			NeverLose.PlayAnimate(TextBox,SlowyTween , {
				TextTransparency = 0.350
			})

			NeverLose.PlayAnimate(KeyFrame,SlowyTween , {
				BackgroundTransparency = 0.05
			})

			NeverLose.PlayAnimate(UIStroke_2,SlowyTween , {
				Transparency = 0.650
			})

			NeverLose.PlayAnimate(Content,SlowyTween , {
				TextTransparency = 0.200
			})

			NeverLose.PlayAnimate(Icon,SlowyTween , {
				TextTransparency = 0.250
			})

			NeverLose.PlayAnimate(RedeemFrame,SlowyTween , {
				BackgroundTransparency = 0.05
			})

			NeverLose.PlayAnimate(UIStroke_3,SlowyTween , {
				Transparency = 0.650
			})

			NeverLose.PlayAnimate(Content_2,SlowyTween , {
				TextTransparency = 0.200
			})

			NeverLose.PlayAnimate(Icon_2,SlowyTween , {
				TextTransparency = 0.250
			})

			Shadow:Render(true);
		else
			NeverLose.PlayAnimate(LoaderFrame,SlowyTween , {
				BackgroundTransparency = 1
			});

			NeverLose.PlayAnimate(WindowName,SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(WindowContent,SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(InputFrame,SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(UIStroke,SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(TextBox,SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(KeyFrame,SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(UIStroke_2,SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(Content,SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(Icon,SlowyTween , {
				TextTransparency = 1
			})

			NeverLose.PlayAnimate(RedeemFrame,SlowyTween , {
				BackgroundTransparency = 1
			})

			NeverLose.PlayAnimate(UIStroke_3,SlowyTween , {
				Transparency = 1
			})

			NeverLose.PlayAnimate(Content_2,SlowyTween , {
				TextTransparency = 1
			});

			NeverLose.PlayAnimate(Icon_2,SlowyTween , {
				TextTransparency = 1
			})

			LoaderLib.MarkLoad.SetValue(false);
			Shadow:Render(false);
		end;
	end);

	LoaderLib:SetRender(false);

	task.delay(0.3,LoaderLib.SetRender,LoaderLib,true);

	function LoaderLib:Await()
		return LoaderLib.YieldEvent.Event:Wait();
	end;

	function LoaderLib:Unload()
		LoaderLib:SetRender(false);
		task.wait()
		task.delay(0.45,function()
			NeverLose:Unload()
		end);
		task.wait(0.3);
	end;

	return LoaderLib;
end;

function NeverLose:Unload()
	NeverLose.ScreenGui:Destroy();

	for i,v in next , NeverLose.GlobalSignals do
		pcall(v.Disconnect,v)
	end;

	table.clear(NeverLose);
end;

-- ========================================
-- ===== PLANET HUB v3.0 ULTIMATE =====
-- ========================================

local function breakScope() end
breakScope()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ContentProvider = game:GetService("ContentProvider")
local MaterialService = game:GetService("MaterialService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ЦВЕТА ПО УМОЛЧАНИЮ
local DEFAULT_COLORS = {
    Murder = Color3.fromRGB(255, 60, 60),
    Sheriff = Color3.fromRGB(60, 120, 255),
    Innocent = Color3.fromRGB(150, 80, 240),
    Chams = Color3.fromRGB(138, 43, 226),
    Tracers = Color3.fromRGB(138, 43, 226),
    Trails = Color3.fromRGB(138, 43, 226),
    JumpCircles = Color3.fromRGB(138, 43, 226),
    Aura = Color3.fromRGB(133, 220, 255),
    ChinaHat = Color3.fromRGB(0, 255, 255),
}

local Settings = {
    MurderESP = false, MurderColor = DEFAULT_COLORS.Murder,
    SheriffESP = false, SheriffColor = DEFAULT_COLORS.Sheriff,
    InnocentESP = false, InnocentColor = DEFAULT_COLORS.Innocent,
    ChamsEnabled = false, ChamsColor = DEFAULT_COLORS.Chams,
    TracersEnabled = false, TracersColor = DEFAULT_COLORS.Tracers,
    JumpCircles = false, JumpCirclesColor = DEFAULT_COLORS.JumpCircles,
    Trails = false, TrailsColor = DEFAULT_COLORS.Trails,
    RGBHumanoid = false, XRayEnabled = false,
    BloomEnabled = false, ColorCorrectionEnabled = false, VignetteEnabled = false,
    ChinaHatEnabled = false, ChinaHatStyle = "Classic", ChinaHatRainbow = false,
    ChinaHatRadius = 2.4, ChinaHatHeight = 1.6, ChinaHatRainbowSpeed = 5,
    ChinaHatTransparency = 0.3, ChinaHatColor = DEFAULT_COLORS.ChinaHat,
    ChinaHatReflectance = 0, ChinaHatSides = 25,
    AuraEnabled = false, AuraColor = DEFAULT_COLORS.Aura,
    OrbizEnabled = false, JerkEnabled = false,
    TexturePackEnabled = false,
    CustomSkyId = "",
    StretchEnabled = false, StretchFactor = 0.75,
    FlyEnabled = false, FlySpeed = 50,
    BHopEnabled = false, BHopSpeed = 30,
    SpinBotEnabled = false, SpinBotSpeed = 9999,
    NoclipEnabled = false, AntiFlingEnabled = false, WallHopEnabled = false,
    FovAimbotEnabled = false, FovRadius = 120,
    KillAllEnabled = false,
    ShootButtonEnabled = false, SheriffAutoShootEnabled = false,
    FlingMurderer = false, FlingSheriff = false,
    GrabGunEnabled = false,
    AimSmoothness = 0.5, AimPredict = true, AimWallCheck = true,
    AimHitChance = 80, AimTargetPart = "Head",
    AutoFarmEnabled = false, AutoFarmSpeed = 20,
    AutoFarmCoinLimit = 40, AutoFarmCoinDelay = 0.15,
    AutoRespawn = true, AntiAFKEnabled = false,
    AnimPackEnabled = false, AnimPack = "",
    Binds = {},
}

local Cache = {
    FlyKeys = {F=0, B=0, L=0, R=0},
    FlyRunning = false, FlyBodyGyro = nil, FlyBodyVelocity = nil,
    FlyKeyConn = nil, FlyKeyEndConn = nil, FlyConn = nil,
    BHopConn = nil, BHopBV = nil, BHopActive = false,
    Highlights = {},
    ChamsPartsList = {},
    PostEffects = {},
    JumpTracking = {wasJumping = false},
    RGBConnection = nil,
    AutoFarmConn = nil,
    CurrentTween = nil,
    XRayParts = {},
    Tracers = {},
    TrailAttachments = {},
    FovCircle = nil,
    FovConnection = nil,
    mainConn = nil,
    WallHopConnection = nil,
    SheriffAutoShootConnection = nil,
    ChinaHatParts = {},
    ChinaHatConnection = nil,
    ChinaHatDrawings = {},
    TextureState = {},
    TextureVariantsBuilt = false,
    AuraParticles = {},
    AuraCache = {},
    JerkConnection = nil,
    SpinConn = nil,
    OrbizFolder = nil,
    OrbizParticles = {},
    OrbizConnection = nil,
    KillAllConn = nil,
    KillAllRemote = nil,
    ShootButton = nil,
    GrabGunRunning = false,
    afkConn = nil,
    noclipConn = nil,
    BindConnections = {},
    BindPopup = nil,
    StretchConnection = nil,
}

-- ХЕЛПЕРЫ
local function safeDisconnect(conn)
    if conn and typeof(conn) == "RBXScriptConnection" then
        pcall(function() conn:Disconnect() end)
    end
end

local function notify(title, content, duration)
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = content,
            Duration = duration or 3,
        })
    end)
end

local function removeCore()
    pcall(function()
        if workspace:FindFirstChild("Core") then
            workspace.Core:Destroy()
        end
        if LocalPlayer.Character then
            local core = LocalPlayer.Character:FindFirstChild("Core")
            if core then core:Destroy() end
        end
    end)
end

local function checkKnife(p)
    if not p or not p.Character then return false end
    for _, item in ipairs(p.Character:GetDescendants()) do
        if item:IsA("Tool") then
            local n = item.Name:lower()
            if n:find("knife") or n:find("blade") or n:find("dagger") or n:find("butcher") then return true end
        end
    end
    local bp = p:FindFirstChild("Backpack")
    if bp then
        for _, item in ipairs(bp:GetChildren()) do
            if item:IsA("Tool") then
                local n = item.Name:lower()
                if n:find("knife") or n:find("blade") or n:find("dagger") or n:find("butcher") then return true end
            end
        end
    end
    return false
end

local function checkGun(p)
    if not p or not p.Character then return false end
    for _, item in ipairs(p.Character:GetDescendants()) do
        if item:IsA("Tool") then
            local n = item.Name:lower()
            if n:find("gun") or n:find("pistol") or n:find("revolver") or n:find("weapon") then return true end
        end
    end
    local bp = p:FindFirstChild("Backpack")
    if bp then
        for _, item in ipairs(bp:GetChildren()) do
            if item:IsA("Tool") then
                local n = item.Name:lower()
                if n:find("gun") or n:find("pistol") or n:find("revolver") or n:find("weapon") then return true end
            end
        end
    end
    return false
end

local function getRole(player)
    if checkKnife(player) then return "Убийца" end
    if checkGun(player) then return "Шериф" end
    return "Невинный"
end

local function getRoleColor(player)
    local r = getRole(player)
    if r == "Убийца" then return Settings.MurderColor end
    if r == "Шериф" then return Settings.SheriffColor end
    return Settings.InnocentColor
end

local function isPlayerVisible(player)
    if not player or not player.Character then return false end
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return false end
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, player.Character}
    local result = Workspace:Raycast(myHRP.Position, hrp.Position - myHRP.Position, raycastParams)
    return not result
end

local function equipGun()
    if not LocalPlayer.Character then return false end
    for _, item in ipairs(LocalPlayer.Character:GetDescendants()) do
        if item:IsA("Tool") then
            local n = item.Name:lower()
            if n:find("gun") or n:find("pistol") or n:find("revolver") then
                pcall(function() LocalPlayer.Character.Humanoid:EquipTool(item) end)
                return true
            end
        end
    end
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if bp then
        for _, item in ipairs(bp:GetChildren()) do
            if item:IsA("Tool") then
                local n = item.Name:lower()
                if n:find("gun") or n:find("pistol") or n:find("revolver") then
                    pcall(function() LocalPlayer.Character.Humanoid:EquipTool(item) end)
                    return true
                end
            end
        end
    end
    return false
end

-- ФУНКЦИЯ НАСТРОЙКИ КЛАВИШ FLY
local function setupFlyKeys()
    safeDisconnect(Cache.FlyKeyConn); safeDisconnect(Cache.FlyKeyEndConn)
    Cache.FlyKeyConn = UserInputService.InputBegan:Connect(function(input, gp)
        if gp or not Cache.FlyRunning then return end
        local k = input.KeyCode
        if k == Enum.KeyCode.W then Cache.FlyKeys.F = 1
        elseif k == Enum.KeyCode.S then Cache.FlyKeys.B = 1
        elseif k == Enum.KeyCode.A then Cache.FlyKeys.L = 1
        elseif k == Enum.KeyCode.D then Cache.FlyKeys.R = 1 end
    end)
    Cache.FlyKeyEndConn = UserInputService.InputEnded:Connect(function(input, gp)
        if gp or not Cache.FlyRunning then return end
        local k = input.KeyCode
        if k == Enum.KeyCode.W then Cache.FlyKeys.F = 0
        elseif k == Enum.KeyCode.S then Cache.FlyKeys.B = 0
        elseif k == Enum.KeyCode.A then Cache.FlyKeys.L = 0
        elseif k == Enum.KeyCode.D then Cache.FlyKeys.R = 0 end
    end)
end

-- ФУНКЦИИ ДВИЖЕНИЯ
local function stopFly()
    Cache.FlyRunning = false
    if Cache.FlyBodyGyro then pcall(function() Cache.FlyBodyGyro:Destroy() end); Cache.FlyBodyGyro = nil end
    if Cache.FlyBodyVelocity then pcall(function() Cache.FlyBodyVelocity:Destroy() end); Cache.FlyBodyVelocity = nil end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.PlatformStand = false
    end
    Cache.FlyKeys = {F=0, B=0, L=0, R=0}
    safeDisconnect(Cache.FlyConn); Cache.FlyConn = nil
    removeCore()
end

local function startFly()
    if Cache.FlyRunning then return end
    local char = LocalPlayer.Character
    if not char then return end
    local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    if not torso then return end
    Cache.FlyRunning = true
    Cache.FlyKeys = {F=0, B=0, L=0, R=0}
    Cache.FlyBodyGyro = Instance.new("BodyGyro", torso)
    Cache.FlyBodyGyro.P = 9e4
    Cache.FlyBodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    Cache.FlyBodyGyro.cframe = torso.CFrame
    Cache.FlyBodyVelocity = Instance.new("BodyVelocity", torso)
    Cache.FlyBodyVelocity.velocity = Vector3.new(0, 0.1, 0)
    Cache.FlyBodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
    char.Humanoid.PlatformStand = true
    safeDisconnect(Cache.FlyConn)
    Cache.FlyConn = RunService.RenderStepped:Connect(function()
        if not Cache.FlyRunning or not LocalPlayer.Character then stopFly(); return end
        removeCore()
        local cam = workspace.CurrentCamera
        local forward = cam.CFrame.LookVector
        local right = cam.CFrame.RightVector
        local move = Vector3.new(
            (Cache.FlyKeys.R - Cache.FlyKeys.L) * right.X + (Cache.FlyKeys.F - Cache.FlyKeys.B) * forward.X,
            (Cache.FlyKeys.R - Cache.FlyKeys.L) * right.Y + (Cache.FlyKeys.F - Cache.FlyKeys.B) * forward.Y,
            (Cache.FlyKeys.R - Cache.FlyKeys.L) * right.Z + (Cache.FlyKeys.F - Cache.FlyKeys.B) * forward.Z
        ) * Settings.FlySpeed
        if move.Magnitude > 0 then Cache.FlyBodyVelocity.velocity = move
        else Cache.FlyBodyVelocity.velocity = Vector3.new(0, 0.1, 0) end
        Cache.FlyBodyGyro.cframe = cam.CFrame
    end)
    setupFlyKeys()
    notify("Fly", "Включен (WASD)", 2)
end

local function toggleFly(value)
    Settings.FlyEnabled = value
    if value then startFly() else stopFly() end
end

-- BHOP
local function stopBHop()
    Cache.BHopActive = false
    safeDisconnect(Cache.BHopConn); Cache.BHopConn = nil
    if Cache.BHopBV then pcall(function() Cache.BHopBV:Destroy() end); Cache.BHopBV = nil end
end

local function startBHop()
    if not LocalPlayer.Character then return end
    if Cache.BHopActive then stopBHop() end
    local char = LocalPlayer.Character
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end
    Cache.BHopActive = true
    Cache.BHopBV = Instance.new("BodyVelocity")
    Cache.BHopBV.MaxForce = Vector3.new(1e5, 0, 1e5)
    Cache.BHopBV.Velocity = Vector3.new(0, 0, 0)
    Cache.BHopBV.Parent = hrp
    local lastJump = 0
    Cache.BHopConn = RunService.Stepped:Connect(function()
        if not Cache.BHopActive then stopBHop(); return end
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp then return end
        if not Cache.BHopBV or not Cache.BHopBV.Parent then
            Cache.BHopBV = Instance.new("BodyVelocity")
            Cache.BHopBV.MaxForce = Vector3.new(1e5, 0, 1e5)
            Cache.BHopBV.Velocity = Vector3.new(0, 0, 0)
            Cache.BHopBV.Parent = hrp
        end
        local moveDir = hum.MoveDirection
        local isMoving = moveDir.Magnitude > 0.1
        local onGround = (hum:GetState() == Enum.HumanoidStateType.Running or hum:GetState() == Enum.HumanoidStateType.Landed)
        if isMoving then
            local horizontal = Vector3.new(moveDir.X, 0, moveDir.Z)
            if horizontal.Magnitude > 0.01 then Cache.BHopBV.Velocity = horizontal.Unit * Settings.BHopSpeed end
            if onGround and tick() - lastJump > 0.15 then hum:ChangeState(Enum.HumanoidStateType.Jumping); lastJump = tick() end
        else Cache.BHopBV.Velocity = Vector3.new(0, 0, 0) end
    end)
    notify("BHop", "Включен", 2)
end

local function toggleBHop(value)
    Settings.BHopEnabled = value
    if value then startBHop() else stopBHop() end
end

-- SPIN BOT
local SpinBot = {Enabled = false, Speed = 9999}
local function setupSpinBot()
    safeDisconnect(Cache.SpinConn); Cache.SpinConn = nil
    if not SpinBot.Enabled then return end
    Cache.SpinConn = RunService.Heartbeat:Connect(function(dt)
        if not LocalPlayer.Character then return end
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(SpinBot.Speed * dt), 0) end
    end)
end

local function toggleSpinBot(value)
    SpinBot.Enabled = value
    setupSpinBot()
    notify("Spin Bot", value and "Включен" or "Выключен", 2)
end

-- WALL HOP
local function toggleWallHop(value)
    Settings.WallHopEnabled = value
    safeDisconnect(Cache.WallHopConnection); Cache.WallHopConnection = nil
    if value then
        Cache.WallHopConnection = RunService.Heartbeat:Connect(function()
            if not LocalPlayer.Character then return end
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        notify("Wall Hop", "Включен (зажми Space)", 2)
    else
        notify("Wall Hop", "Выключен", 2)
    end
end

-- NOCLIP
local function setupNoclip(value)
    if value then
        if not Cache.noclipConn then
            Cache.noclipConn = RunService.Stepped:Connect(function()
                if not LocalPlayer.Character then return end
                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end)
        end
    else
        if Cache.noclipConn then Cache.noclipConn:Disconnect(); Cache.noclipConn = nil end
    end
end

-- ANTI FLING
local function setupAntiFling()
    safeDisconnect(Cache.antiFlingConn); Cache.antiFlingConn = nil
    if not Settings.AntiFlingEnabled then return end
    Cache.antiFlingConn = RunService.Heartbeat:Connect(function()
        if not Settings.AntiFlingEnabled then return end
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                for _, part in ipairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then part.CanCollide = false end
                end
            end
        end
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            if hrp.AssemblyLinearVelocity.Magnitude > 200 then hrp.AssemblyLinearVelocity = Vector3.new(0,0,0) end
            if hrp.AssemblyAngularVelocity.Magnitude > 20 then hrp.AssemblyAngularVelocity = Vector3.new(0,0,0) end
        end
    end)
end

-- VISUALS
local function createOrUpdateHighlight(player, color)
    if not player or not player.Character then return end
    local char = player.Character
    local hl = char:FindFirstChild("PH_ESP")
    if not hl then hl = Instance.new("Highlight"); hl.Name = "PH_ESP"; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; hl.Parent = char end
    hl.FillColor = color; hl.OutlineColor = color; hl.FillTransparency = 0.4; hl.OutlineTransparency = 0; hl.Enabled = true
    Cache.Highlights[player.UserId] = hl
end

local function removeHighlight(player)
    if not player or not player.Character then return end
    local hl = player.Character:FindFirstChild("PH_ESP")
    if hl then pcall(function() hl:Destroy() end) end
    Cache.Highlights[player.UserId] = nil
end

local function clearAllHighlights()
    for _, hl in pairs(Cache.Highlights) do if hl then pcall(function() hl:Destroy() end) end end
    Cache.Highlights = {}
end

-- CHAMS
local function cacheCharacterParts(player)
    if not player or not player.Character then return end
    local list = {}
    for _, part in ipairs(player.Character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            list[part] = {ogMaterial=part.Material, ogColor=part.Color, ogTransparency=part.Transparency, ogCastShadow=part.CastShadow}
        end
    end
    Cache.ChamsPartsList[player.UserId] = list
end

local function applyChams(player)
    if not player or not player.Character then return end
    local char = player.Character
    if not Cache.ChamsPartsList[player.UserId] then cacheCharacterParts(player) end
    local chamsColor = Settings.ChamsColor
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            if not Cache.ChamsPartsList[player.UserId] then Cache.ChamsPartsList[player.UserId] = {} end
            if not Cache.ChamsPartsList[player.UserId][part] then
                Cache.ChamsPartsList[player.UserId][part] = {ogMaterial=part.Material, ogColor=part.Color, ogTransparency=part.Transparency, ogCastShadow=part.CastShadow}
            end
            part.Material = Enum.Material.ForceField
            part.Color = chamsColor
            part.Transparency = 0.0
            part.CastShadow = false
        end
    end
end

local function removeChams(player)
    if not player or not player.Character then return end
    local char = player.Character
    local list = Cache.ChamsPartsList[player.UserId]
    if not list then return end
    for part, data in pairs(list) do
        if part and part.Parent then
            pcall(function() part.Material = data.ogMaterial; part.Color = data.ogColor; part.Transparency = data.ogTransparency; part.CastShadow = data.ogCastShadow end)
        end
    end
    Cache.ChamsPartsList[player.UserId] = nil
end

local function clearAllChams()
    for userId, _ in pairs(Cache.ChamsPartsList) do
        local p = Players:GetPlayerByUserId(userId)
        if p then removeChams(p) end
    end
    Cache.ChamsPartsList = {}
end

local function updateChamsForAll()
    if Settings.ChamsEnabled then for _, p in ipairs(Players:GetPlayers()) do cacheCharacterParts(p); applyChams(p) end
    else clearAllChams() end
end

-- TRACERS
local function createTracer(player)
    if not player or player == LocalPlayer then return end
    if Cache.Tracers[player.UserId] then return end
    local line = Drawing.new("Line")
    line.Thickness = 2; line.Transparency = 0.8; line.Visible = false
    line.Color = getRoleColor(player)
    Cache.Tracers[player.UserId] = line
end

local function updateTracers()
    if not Settings.TracersEnabled then
        for _, line in pairs(Cache.Tracers) do line.Visible = false end
        return
    end
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
    for userId, line in pairs(Cache.Tracers) do
        local player = Players:GetPlayerByUserId(userId)
        if not player or not player.Character then line.Visible = false continue end
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then line.Visible = false continue end
        local sp, onScreen = Camera:WorldToViewportPoint(hrp.Position)
        if not onScreen then line.Visible = false continue end
        line.From = center; line.To = Vector2.new(sp.X, sp.Y); line.Visible = true
        line.Color = getRoleColor(player)
    end
end

local function clearAllTracers()
    for userId, line in pairs(Cache.Tracers) do pcall(function() line:Remove() end) end
    Cache.Tracers = {}
end

-- TRAILS
local function createLocalPlayerTrail()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if Cache.TrailAttachments.trail and Cache.TrailAttachments.trail.Parent then return end
    local att1 = Instance.new("Attachment"); att1.Position = Vector3.new(-1,0,0); att1.Parent = hrp
    local att2 = Instance.new("Attachment"); att2.Position = Vector3.new(1,0,0); att2.Parent = hrp
    local trail = Instance.new("Trail")
    trail.Attachment0 = att1; trail.Attachment1 = att2; trail.Lifetime = 0.8; trail.MinLength = 0
    trail.FaceCamera = true; trail.LightEmission = 1; trail.LightInfluence = 0
    trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,1)})
    trail.Color = ColorSequence.new(Settings.TrailsColor)
    trail.Parent = hrp
    Cache.TrailAttachments = {trail=trail, att1=att1, att2=att2}
end

local function removeLocalPlayerTrail()
    if Cache.TrailAttachments.trail then pcall(function() Cache.TrailAttachments.trail:Destroy() end) end
    if Cache.TrailAttachments.att1 then pcall(function() Cache.TrailAttachments.att1:Destroy() end) end
    if Cache.TrailAttachments.att2 then pcall(function() Cache.TrailAttachments.att2:Destroy() end) end
    Cache.TrailAttachments = {}
end

-- JUMP CIRCLES
local function getGroundY(origin)
    local rayOrigin = origin
    local rayDirection = Vector3.new(0, -50, 0)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    local char = LocalPlayer.Character
    if char then raycastParams.FilterDescendantsInstances = {char} end
    local result = Workspace:Raycast(rayOrigin, rayDirection, raycastParams)
    if result then return result.Position.Y end
    return origin.Y - 3
end

local function createJumpCircle(originPos)
    local groundY = getGroundY(originPos)
    local ringPos = Vector3.new(originPos.X, groundY + 0.08, originPos.Z)
    local ring = Instance.new("Part")
    ring.Shape = Enum.PartType.Cylinder
    ring.Size = Vector3.new(0.08, 0.5, 0.5)
    ring.Material = Enum.Material.Neon
    ring.Color = Settings.JumpCirclesColor
    ring.Transparency = 0
    ring.Anchored = true
    ring.CanCollide = false
    ring.CastShadow = false
    ring.CFrame = CFrame.new(ringPos) * CFrame.Angles(0, 0, math.rad(90))
    ring.Parent = Workspace
    local light = Instance.new("PointLight")
    light.Brightness = 4; light.Color = Settings.JumpCirclesColor; light.Range = 20; light.Parent = ring
    local t0 = tick(); local duration = 0.7
    local conn
    conn = RunService.Heartbeat:Connect(function()
        if not ring or not ring.Parent then safeDisconnect(conn); return end
        local p = (tick() - t0) / duration
        if p >= 1 then pcall(function() ring:Destroy() end); safeDisconnect(conn); return end
        local diameter = 0.5 + p * 6
        ring.Size = Vector3.new(0.08, diameter, diameter)
        ring.Transparency = p
        ring.CFrame = CFrame.new(ringPos) * CFrame.Angles(0, 0, math.rad(90))
        light.Brightness = 4 * (1 - p)
    end)
end

-- RGB HUMANOID
local function setupRGBHumanoid()
    safeDisconnect(Cache.RGBConnection); Cache.RGBConnection = nil
    if not Settings.RGBHumanoid then
        if LocalPlayer.Character then
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.Material = Enum.Material.Plastic; part.Color = Color3.fromRGB(255,255,255); part.Transparency = 0 end
            end
        end
        return
    end
    Cache.RGBConnection = RunService.Heartbeat:Connect(function()
        if not LocalPlayer.Character then return end
        local color = Color3.fromHSV(tick() % 1, 1, 1)
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Material = Enum.Material.ForceField
                part.Color = color
                part.Transparency = 0.3
            end
        end
    end)
end

-- XRAY
local function setupXRay()
    if Settings.XRayEnabled then
        for _, part in ipairs(Workspace:GetDescendants()) do
            if part:IsA("BasePart") and not part:IsA("Terrain") then
                Cache.XRayParts[part] = part.LocalTransparencyModifier
                part.LocalTransparencyModifier = 0.6
            end
        end
    else
        for part, val in pairs(Cache.XRayParts) do
            if part and part.Parent then pcall(function() part.LocalTransparencyModifier = val end) end
        end
        Cache.XRayParts = {}
    end
end

-- POST EFFECTS
local function setupBloom(en) Lighting.Brightness = en and 1.5 or 1 end
local function setupColorCorrection(en) Lighting.Ambient = en and Settings.AuraColor or Color3.fromRGB(0,0,0); Lighting.OutdoorAmbient = en and Settings.AuraColor or Color3.fromRGB(0,0,0) end

local function setupVignette(en)
    if en then
        if Cache.PostEffects.vignette then return end
        local sg = Instance.new("ScreenGui"); sg.Name = "VignetteEffect"; sg.ResetOnSpawn = false; sg.IgnoreGuiInset = true
        local f = Instance.new("Frame"); f.Size = UDim2.new(1,0,1,0); f.BackgroundColor3 = Color3.fromRGB(0,0,0); f.BackgroundTransparency = 0.5; f.BorderSizePixel = 0; f.Parent = sg
        sg.Parent = LocalPlayer:WaitForChild("PlayerGui")
        Cache.PostEffects.vignette = sg
    else
        if Cache.PostEffects.vignette then pcall(function() Cache.PostEffects.vignette:Destroy() end) end
        Cache.PostEffects.vignette = nil
    end
end

-- CHINA HAT
local tau = math.pi * 2

local function createChinaHatDrawings()
    for i = 1, #Cache.ChinaHatDrawings do
        pcall(function() Cache.ChinaHatDrawings[i][1]:Remove(); Cache.ChinaHatDrawings[i][2]:Remove() end)
    end
    Cache.ChinaHatDrawings = {}
    for i = 1, Settings.ChinaHatSides do
        Cache.ChinaHatDrawings[i] = {Drawing.new('Line'), Drawing.new('Triangle')}
        Cache.ChinaHatDrawings[i][1].ZIndex = 2; Cache.ChinaHatDrawings[i][1].Thickness = 2
        Cache.ChinaHatDrawings[i][2].ZIndex = 1; Cache.ChinaHatDrawings[i][2].Filled = true
    end
end

local function hatRemoveClassic()
    if Cache.ChinaHatParts[LocalPlayer.Character] then
        pcall(function() Cache.ChinaHatParts[LocalPlayer.Character]:Destroy() end)
        Cache.ChinaHatParts[LocalPlayer.Character] = nil
    end
end

local function hatAddClassic(char)
    task.wait(0.1)
    local head = char:WaitForChild("Head", 5)
    if not head then return end
    hatRemoveClassic()
    local hat = Instance.new("Part")
    hat.Name = "ChineseHat"
    hat.Transparency = Settings.ChinaHatTransparency
    hat.Color = Settings.ChinaHatColor
    hat.Material = Enum.Material.Neon
    hat.CanCollide = false
    hat.Reflectance = Settings.ChinaHatReflectance
    local mesh = Instance.new("SpecialMesh")
    mesh.MeshId = "rbxassetid://1033714"
    mesh.Scale = Vector3.new(Settings.ChinaHatRadius, Settings.ChinaHatHeight, Settings.ChinaHatRadius)
    mesh.Parent = hat
    local weld = Instance.new("WeldConstraint"); weld.Part0 = head; weld.Part1 = hat; weld.Parent = hat
    hat.CFrame = head.CFrame * CFrame.new(0, 1.1, 0)
    hat.Parent = char
    Cache.ChinaHatParts[char] = hat
end

local function hatUpdateClassic()
    for char, hat in pairs(Cache.ChinaHatParts) do
        if hat and hat.Parent and char == LocalPlayer.Character then
            hat.Transparency = Settings.ChinaHatTransparency
            hat.Reflectance = Settings.ChinaHatReflectance
            if Settings.ChinaHatRainbow then
                hat.Color = Color3.fromHSV(tick() % Settings.ChinaHatRainbowSpeed / Settings.ChinaHatRainbowSpeed, 1, 1)
            else
                hat.Color = Settings.ChinaHatColor
            end
            local mesh = hat:FindFirstChildOfClass("SpecialMesh")
            if mesh then mesh.Scale = Vector3.new(Settings.ChinaHatRadius, Settings.ChinaHatHeight, Settings.ChinaHatRadius) end
        end
    end
end

local function hatUpdateDrawing()
    local pass = Settings.ChinaHatEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('Head') ~= nil and (Camera.CFrame.p - Camera.Focus.p).magnitude > 1 and LocalPlayer.Character.Humanoid.Health > 0
    for i = 1, #Cache.ChinaHatDrawings do
        local line, triangle = Cache.ChinaHatDrawings[i][1], Cache.ChinaHatDrawings[i][2]
        if pass then
            local color
            if Settings.ChinaHatRainbow then
                color = Color3.fromHSV((tick() % Settings.ChinaHatRainbowSpeed / Settings.ChinaHatRainbowSpeed - (i / #Cache.ChinaHatDrawings)) % 1, 0.5, 1)
            else
                color = Settings.ChinaHatColor
            end
            local pos = LocalPlayer.Character.Head.Position + Vector3.new(0, 0.75, 0)
            local topWorld = pos + Vector3.new(0, 0.75, 0)
            local last, next = (i / Settings.ChinaHatSides) * tau, ((i + 1) / Settings.ChinaHatSides) * tau
            local lastWorld = pos + (Vector3.new(math.cos(last), 0, math.sin(last)) * Settings.ChinaHatRadius)
            local nextWorld = pos + (Vector3.new(math.cos(next), 0, math.sin(next)) * Settings.ChinaHatRadius)
            local lastScreen = Camera:WorldToViewportPoint(lastWorld)
            local nextScreen = Camera:WorldToViewportPoint(nextWorld)
            local topScreen = Camera:WorldToViewportPoint(topWorld)
            line.From = Vector2.new(lastScreen.X, lastScreen.Y); line.To = Vector2.new(nextScreen.X, nextScreen.Y)
            line.Color = color; line.Transparency = 1 - Settings.ChinaHatTransparency; line.Visible = true
            triangle.PointA = Vector2.new(topScreen.X, topScreen.Y); triangle.PointB = line.From; triangle.PointC = line.To
            triangle.Color = color; triangle.Transparency = 0.35; triangle.Visible = true
        else
            line.Visible = false; triangle.Visible = false
        end
    end
end

local function toggleChinaHat(value)
    Settings.ChinaHatEnabled = value
    if value then
        createChinaHatDrawings()
        if Settings.ChinaHatStyle == "Classic" and LocalPlayer.Character then hatAddClassic(LocalPlayer.Character) end
        if Cache.ChinaHatConnection then safeDisconnect(Cache.ChinaHatConnection) end
        Cache.ChinaHatConnection = RunService.Heartbeat:Connect(function()
            if Settings.ChinaHatStyle == "Classic" then hatUpdateClassic()
            else hatUpdateDrawing() end
        end)
        notify("China Hat", "Включен (" .. Settings.ChinaHatStyle .. ")", 2)
    else
        hatRemoveClassic()
        for i = 1, #Cache.ChinaHatDrawings do pcall(function() Cache.ChinaHatDrawings[i][1].Visible = false; Cache.ChinaHatDrawings[i][2].Visible = false end) end
        if Cache.ChinaHatConnection then safeDisconnect(Cache.ChinaHatConnection); Cache.ChinaHatConnection = nil end
        notify("China Hat", "Выключен", 2)
    end
end

-- ORBIZ
local function createOrbiz()
    if Cache.OrbizFolder then Cache.OrbizFolder:Destroy() end
    if Cache.OrbizConnection then Cache.OrbizConnection:Disconnect() end
    Cache.OrbizParticles = {}
    if not Settings.OrbizEnabled then return end
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local folder = Instance.new("Folder")
    folder.Name = "Orbiz3D"
    folder.Parent = workspace
    Cache.OrbizFolder = folder

    local COUNT = 800
    for i = 1, COUNT do
        local part = Instance.new("Part")
        part.Shape = Enum.PartType.Ball
        part.Size = Vector3.new(0.2 + math.random() * 0.3, 0.2 + math.random() * 0.3, 0.2 + math.random() * 0.3)
        part.BrickColor = BrickColor.new("Bright violet")
        part.Material = Enum.Material.Neon
        part.Transparency = 0.2 + math.random() * 0.5
        part.Anchored = true
        part.CanCollide = false
        part.Parent = folder
        local range = 80
        part.Position = root.Position + Vector3.new((math.random()-0.5)*range*2, math.random()*50+20, (math.random()-0.5)*range*2)
        table.insert(Cache.OrbizParticles, {part=part, speed=0.2+math.random()*0.8, driftX=(math.random()-0.5)*0.5, driftZ=(math.random()-0.5)*0.5, startY=part.Position.Y})
    end

    Cache.OrbizConnection = RunService.Heartbeat:Connect(function()
        if not Settings.OrbizEnabled then return end
        local rootPos = root and root.Position or Vector3.new(0,0,0)
        local range = 80
        for _, data in pairs(Cache.OrbizParticles) do
            local part = data.part
            if not part or not part.Parent then continue end
            local pos = part.Position
            pos = pos - Vector3.new(0, data.speed * 0.08, 0)
            pos = pos + Vector3.new(data.driftX * 0.03, 0, data.driftZ * 0.03)
            if pos.Y < rootPos.Y - 10 then
                pos = Vector3.new(rootPos.X + (math.random()-0.5)*range*2, rootPos.Y + 30 + math.random()*40, rootPos.Z + (math.random()-0.5)*range*2)
                part.Transparency = 0.2 + math.random() * 0.5
                part.Size = Vector3.new(0.2 + math.random() * 0.4, 0.2 + math.random() * 0.4, 0.2 + math.random() * 0.4)
            end
            part.Position = pos
        end
    end)
end

-- AURA
local AURA_IDS = {
    angel = "97658130917593", starlight = "134645216613107", heavenly = "139300897520961",
    ribbon = "132069507632161", sakura = "81755778619404", wind = "80694081850877",
    flow = "119913533725648", star = "73754563740680"
}
local AURA_ORDER = {"angel", "starlight", "heavenly", "ribbon", "sakura", "wind", "flow", "star"}
local AuraSelected = {}
for _, name in ipairs(AURA_ORDER) do AuraSelected[name] = false end

local function clearAura()
    for _, p in ipairs(Cache.AuraParticles) do pcall(function() p:Destroy() end) end
    Cache.AuraParticles = {}
end

local function loadAura(name)
    if Cache.AuraCache[name] then return Cache.AuraCache[name] end
    local id = AURA_IDS[name]
    if not id then return nil end
    local success, result = pcall(game.GetObjects, game, "rbxassetid://"..id)
    if success and result and result[1] then Cache.AuraCache[name] = result[1]; return result[1] end
    return nil
end

local function colorAura(model, color)
    local seq = ColorSequence.new(color)
    for _, descendant in ipairs(model:GetDescendants()) do
        if descendant:IsA("PointLight") then descendant.Color = color
        elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Beam") or descendant:IsA("Trail") then
            descendant.Color = seq
        end
    end
end

local function applyAura()
    clearAura()
    if not Settings.AuraEnabled then return end
    local char = LocalPlayer.Character
    if not char then return end
    for _, name in ipairs(AURA_ORDER) do
        if AuraSelected[name] then
            local aura_model = loadAura(name)
            if aura_model then
                colorAura(aura_model, Settings.AuraColor)
                local cloned = aura_model:Clone()
                for _, part in ipairs(cloned:GetChildren()) do
                    local target = char:FindFirstChild(part.Name)
                    if target and target:IsA("BasePart") then
                        for _, child in ipairs(part:GetChildren()) do
                            child.Parent = target
                            table.insert(Cache.AuraParticles, child)
                        end
                    end
                end
                cloned:Destroy()
            end
        end
    end
end

-- TEXTURE PACK
local TEXTURE_VARIANTS = {
    Brick = {BaseMaterial=Enum.Material.Brick, Texture='rbxassetid://10777285622'},
    Concrete = {BaseMaterial=Enum.Material.Concrete, Texture='rbxassetid://15622710576'},
    CorrodedMetal = {BaseMaterial=Enum.Material.CorrodedMetal, Texture='rbxassetid://78612695839404'},
    Grass = {BaseMaterial=Enum.Material.Grass, Texture='rbxassetid://9267183930'},
    Metal = {BaseMaterial=Enum.Material.Metal, Texture='rbxassetid://121650613091353'},
    Sand = {BaseMaterial=Enum.Material.Sand, Texture='rbxassetid://12624140843'},
    Slate = {BaseMaterial=Enum.Material.Slate, Texture='rbxassetid://8676746437'},
    Wood = {BaseMaterial=Enum.Material.Wood, Texture='rbxassetid://3258599312'},
    WoodPlanks = {BaseMaterial=Enum.Material.WoodPlanks, Texture='rbxassetid://8676581022'},
}
local TEXTURE_VARIANT_BY_MATERIAL = {
    [Enum.Material.Brick]='Brick', [Enum.Material.Concrete]='Concrete', [Enum.Material.CorrodedMetal]='CorrodedMetal',
    [Enum.Material.Grass]='Grass', [Enum.Material.Metal]='Metal', [Enum.Material.Sand]='Sand',
    [Enum.Material.Slate]='Slate', [Enum.Material.Wood]='Wood', [Enum.Material.WoodPlanks]='WoodPlanks',
}

local function ensureTextureVariants()
    if Cache.TextureVariantsBuilt then return end
    for name, data in pairs(TEXTURE_VARIANTS) do
        local variant = MaterialService:FindFirstChild(name)
        if not variant then variant = Instance.new('MaterialVariant'); variant.Name = name; variant.Parent = MaterialService end
        pcall(function()
            variant.BaseMaterial = data.BaseMaterial
            variant.ColorMap = data.Texture; variant.MetalnessMap = data.Texture; variant.NormalMap = data.Texture; variant.RoughnessMap = data.Texture
            variant.MaterialPattern = Enum.MaterialPattern.Regular
            variant.StudsPerTile = 5
        end)
    end
    Cache.TextureVariantsBuilt = true
end

local function rememberTexturePart(part)
    if not Cache.TextureState[part] then Cache.TextureState[part] = {Color=part.Color, Material=part.Material, MaterialVariant=part.MaterialVariant} end
    return Cache.TextureState[part]
end

local function shouldSkipTexturePart(part)
    if not part:IsDescendantOf(workspace) then return true end
    if part.Name == 'LarpticWeather' or part.Name == 'Part' then return true end
    local parent = part.Parent
    if parent and (parent:IsA('Tool') or parent:IsA('Accessory')) then return true end
    local model = part:FindFirstAncestorOfClass('Model')
    if model and game.Players:GetPlayerFromCharacter(model) then return true end
    return false
end

local function applyTexturePack()
    if not Settings.TexturePackEnabled then return end
    ensureTextureVariants()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA('BasePart') and not shouldSkipTexturePart(obj) then
            rememberTexturePart(obj)
            local variantName = TEXTURE_VARIANT_BY_MATERIAL[obj.Material]
            if variantName then pcall(function() obj.MaterialVariant = variantName end) end
        end
    end
end

local function clearTexturePack()
    for part, state in pairs(Cache.TextureState) do
        if part and part.Parent and state then
            pcall(function() part.Color = state.Color; part.Material = state.Material; part.MaterialVariant = state.MaterialVariant or '' end)
        end
    end
    Cache.TextureState = {}
    for name, _ in pairs(TEXTURE_VARIANTS) do
        local variant = MaterialService:FindFirstChild(name)
        if variant and variant:IsA('MaterialVariant') then pcall(function() variant:Destroy() end) end
    end
    Cache.TextureVariantsBuilt = false
end

-- STRETCH
local function applyStretch(state)
    Settings.StretchEnabled = state
    if not state then
        if Cache.StretchConnection then pcall(function() Cache.StretchConnection:Disconnect() end); Cache.StretchConnection = nil end
        pcall(function() workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame end)
        return
    end
    if not Cache.StretchConnection then
        Cache.StretchConnection = RunService.RenderStepped:Connect(function()
            local camera = workspace.CurrentCamera
            if camera then camera.CFrame = camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, Settings.StretchFactor, 0, 0, 0, 1) end
        end)
    end
end

-- SKYBOX
local SKYBOX_ASSETS = {
    ["Black Storm"] = {Bk="rbxassetid://15502511288", Dn="rbxassetid://15502508460", Ft="rbxassetid://15502510289", Lf="rbxassetid://15502507918", Rt="rbxassetid://15502509398", Up="rbxassetid://15502511911"},
    ["HD"] = {Bk="http://www.roblox.com/asset/?id=16553658937", Dn="http://www.roblox.com/asset/?id=16553660713", Ft="http://www.roblox.com/asset/?id=16553662144", Lf="http://www.roblox.com/asset/?id=16553664042", Rt="http://www.roblox.com/asset/?id=16553665766", Up="http://www.roblox.com/asset/?id=16553667750"},
    ["Snow"] = {Bk="http://www.roblox.com/asset/?id=155657655", Dn="http://www.roblox.com/asset/?id=155674246", Ft="http://www.roblox.com/asset/?id=155657609", Lf="http://www.roblox.com/asset/?id=155657671", Rt="http://www.roblox.com/asset/?id=155657619", Up="http://www.roblox.com/asset/?id=155674931"},
    ["Blue Space"] = {Bk="rbxassetid://15536110634", Dn="rbxassetid://15536112543", Ft="rbxassetid://15536116141", Lf="rbxassetid://15536114370", Rt="rbxassetid://15536118762", Up="rbxassetid://15536117282"},
    ["Realistic"] = {Bk="rbxassetid://653719502", Dn="rbxassetid://653718790", Ft="rbxassetid://653719067", Lf="rbxassetid://653719190", Rt="rbxassetid://653718931", Up="rbxassetid://653719321"},
    ["Stormy"] = {Bk="http://www.roblox.com/asset/?id=18703245834", Dn="http://www.roblox.com/asset/?id=18703243349", Ft="http://www.roblox.com/asset/?id=18703240532", Lf="http://www.roblox.com/asset/?id=18703237556", Rt="http://www.roblox.com/asset/?id=18703235430", Up="http://www.roblox.com/asset/?id=18703232671"},
    ["Pink"] = {Bk="rbxassetid://12216109205", Dn="rbxassetid://12216109875", Ft="rbxassetid://12216109489", Lf="rbxassetid://12216110170", Rt="rbxassetid://12216110471", Up="rbxassetid://12216108877"},
    ["Sunset"] = {Bk="rbxassetid://600830446", Dn="rbxassetid://600831635", Ft="rbxassetid://600832720", Lf="rbxassetid://600886090", Rt="rbxassetid://600833862", Up="rbxassetid://600835177"},
    ["Space"] = {Bk="http://www.roblox.com/asset/?id=166509999", Dn="http://www.roblox.com/asset/?id=166510057", Ft="http://www.roblox.com/asset/?id=166510116", Lf="http://www.roblox.com/asset/?id=166510092", Rt="http://www.roblox.com/asset/?id=166510131", Up="http://www.roblox.com/asset/?id=166510114"},
    ["Roblox Default"] = {Bk="rbxasset://textures/sky/sky512_bk.tex", Dn="rbxasset://textures/sky/sky512_dn.tex", Ft="rbxasset://textures/sky/sky512_ft.tex", Lf="rbxasset://textures/sky/sky512_lf.tex", Rt="rbxasset://textures/sky/sky512_rt.tex", Up="rbxasset://textures/sky/sky512_up.tex"},
    ["Red Night"] = {Bk="http://www.roblox.com/asset/?id=401664839", Dn="http://www.roblox.com/asset/?id=401664862", Ft="http://www.roblox.com/asset/?id=401664960", Lf="http://www.roblox.com/asset/?id=401664881", Rt="http://www.roblox.com/asset/?id=401664901", Up="http://www.roblox.com/asset/?id=401664936"},
    ["Pink Skies"] = {Bk="http://www.roblox.com/asset/?id=151165214", Dn="http://www.roblox.com/asset/?id=151165197", Ft="http://www.roblox.com/asset/?id=151165224", Lf="http://www.roblox.com/asset/?id=151165191", Rt="http://www.roblox.com/asset/?id=151165206", Up="http://www.roblox.com/asset/?id=151165227"},
    ["Purple Sunset"] = {Bk="rbxassetid://264908339", Dn="rbxassetid://264907909", Ft="rbxassetid://264909420", Lf="rbxassetid://264909758", Rt="rbxassetid://264908886", Up="rbxassetid://264907379"},
    ["Blue Night"] = {Bk="http://www.roblox.com/asset/?id=12064107", Dn="http://www.roblox.com/asset/?id=12064152", Ft="http://www.roblox.com/asset/?id=12064121", Lf="http://www.roblox.com/asset/?id=12063984", Rt="http://www.roblox.com/asset/?id=12064115", Up="http://www.roblox.com/asset/?id=12064131"},
    ["Summer"] = {Bk="rbxassetid://16648590964", Dn="rbxassetid://16648617436", Ft="rbxassetid://16648595424", Lf="rbxassetid://16648566370", Rt="rbxassetid://16648577071", Up="rbxassetid://16648598180"},
    ["Galaxy"] = {Bk="rbxassetid://15983968922", Dn="rbxassetid://15983966825", Ft="rbxassetid://15983965025", Lf="rbxassetid://15983967420", Rt="rbxassetid://15983966246", Up="rbxassetid://15983964246"},
    ["Minecraft"] = {Bk="rbxassetid://8735166756", Dn="http://www.roblox.com/asset/?id=8735166707", Ft="http://www.roblox.com/asset/?id=8735231668", Lf="http://www.roblox.com/asset/?id=8735166755", Rt="http://www.roblox.com/asset/?id=8735166751", Up="http://www.roblox.com/asset/?id=8735166729"},
}

local function setupSky(skyName)
    local sb = SKYBOX_ASSETS[skyName]
    if not sb then
        local skyId = tostring(skyName):gsub("%s+",""):gsub("rbxassetid://","")
        if skyId:match("^%d+$") then
            local url = "rbxassetid://" .. skyId
            for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
            local sky = Instance.new("Sky")
            sky.SkyboxBk = url; sky.SkyboxDn = url; sky.SkyboxFt = url; sky.SkyboxLf = url; sky.SkyboxRt = url; sky.SkyboxUp = url
            sky.Parent = Lighting
            notify("Небо", "Загружено: " .. skyId, 2)
        else notify("Небо", "Неизвестный скибокс", 2) end
        return
    end
    task.spawn(function() ContentProvider:PreloadAsync({sb.Bk, sb.Dn, sb.Ft, sb.Lf, sb.Rt, sb.Up}) end)
    local sky = Lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky")
    sky.Name = "Sky"; sky.Parent = Lighting
    sky.SkyboxBk = sb.Bk; sky.SkyboxDn = sb.Dn; sky.SkyboxFt = sb.Ft; sky.SkyboxLf = sb.Lf; sky.SkyboxRt = sb.Rt; sky.SkyboxUp = sb.Up
    notify("Небо", "Загружено: " .. skyName, 2)
end

-- COMBAT
local function getClosestMurderInFov()
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local bestP, bestDist = nil, math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        if not checkKnife(player) then continue end
        if not player.Character then continue end
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        local sp, onScreen = Camera:WorldToScreenPoint(hrp.Position)
        if not onScreen or sp.Z < 0 then continue end
        local d = (center - Vector2.new(sp.X, sp.Y)).Magnitude
        if d <= Settings.FovRadius and d < bestDist then bestDist = d; bestP = player end
    end
    return bestP
end

local function createFovCircle()
    if Cache.FovCircle then pcall(function() Cache.FovCircle:Remove() end) end
    local c = Drawing.new("Circle")
    c.Radius = Settings.FovRadius; c.Color = Color3.fromRGB(255,255,255); c.Thickness = 1.5; c.Transparency = 0.7; c.Filled = false; c.Visible = false; c.NumSides = 64
    Cache.FovCircle = c
end

local function setupFovAimbot()
    safeDisconnect(Cache.FovConnection); Cache.FovConnection = nil
    if Cache.FovCircle then Cache.FovCircle.Visible = false end
    if not Settings.FovAimbotEnabled then return end
    if not Cache.FovCircle then createFovCircle() end
    local circle = Cache.FovCircle
    Cache.FovConnection = RunService.RenderStepped:Connect(function()
        if not Settings.FovAimbotEnabled then circle.Visible = false; return end
        local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        circle.Position = center; circle.Radius = Settings.FovRadius; circle.Visible = true
        local target = getClosestMurderInFov()
        if target then
            circle.Color = Color3.fromRGB(255,50,50); circle.Thickness = 2.0
            local hrp = target.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local vel = hrp.AssemblyLinearVelocity
                local predictedPos = hrp.Position + (vel * 0.1)
                Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, predictedPos, Camera.CFrame.UpVector)
            end
        else
            circle.Color = Color3.fromRGB(255,255,255); circle.Thickness = 1.5
        end
    end)
end

-- KILL ALL
local function FindKillRemote()
    for _, child in ipairs(ReplicatedStorage:GetDescendants()) do
        if child:IsA("RemoteEvent") then
            local name = child.Name:lower()
            if name:find("kill") or name:find("attack") or name:find("damage") or name:find("murder") or name:find("slash") or name:find("stab") then
                Cache.KillAllRemote = child; return
            end
        end
    end
    for _, child in ipairs(ReplicatedStorage:GetDescendants()) do
        if child:IsA("RemoteEvent") then Cache.KillAllRemote = child; return end
    end
end
FindKillRemote()

local function KillAllPlayers()
    if not Cache.KillAllRemote then return end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            pcall(function() Cache.KillAllRemote:FireServer(player) end)
            pcall(function() Cache.KillAllRemote:FireServer(player.Character) end)
            pcall(function() Cache.KillAllRemote:FireServer(player.Character.HumanoidRootPart) end)
        end
    end
end

local function setupKillAll()
    safeDisconnect(Cache.KillAllConn); Cache.KillAllConn = nil
    if not Settings.KillAllEnabled then return end
    Cache.KillAllConn = RunService.Stepped:Connect(function() if Settings.KillAllEnabled then KillAllPlayers() end end)
end

-- FLING
local function flingPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then notify("Флинг", "Игрок не найден!", 2); return end
    local Character = LocalPlayer.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart or (Character and Character:FindFirstChild("HumanoidRootPart"))
    local TCharacter = targetPlayer.Character
    if not TCharacter then return end
    local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart or TCharacter:FindFirstChild("HumanoidRootPart")
    local THead = TCharacter:FindFirstChild("Head")
    if Character and Humanoid and RootPart then
        if THumanoid and THumanoid.Sit then notify("Флинг", targetPlayer.Name .. " сидит!", 2); return end
        notify("Флинг", "Выбиваем: " .. targetPlayer.DisplayName, 2)
        if THead then workspace.CurrentCamera.CameraSubject = THead
        elseif THumanoid and TRootPart then workspace.CurrentCamera.CameraSubject = THumanoid end
        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
        local SFBasePart = function(BasePart)
            local TimeToWait = 2 local Time = tick() local Angle = 0
            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100
                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                end
            until Time + TimeToWait < tick()
        end
        workspace.FallenPartsDestroyHeight = 0/0
        local BV = Instance.new("BodyVelocity")
        BV.Parent = RootPart 
        BV.Velocity = Vector3.new() 
        BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        if TRootPart then SFBasePart(TRootPart) elseif THead then SFBasePart(THead) end
        BV:Destroy() 
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid
    end
end

local function getMurdererFling()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            if checkKnife(p) then return p end
        end
    end
    return nil
end

local function getSheriffFling()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            if checkGun(p) then return p end
        end
    end
    return nil
end

-- GRAB GUN
local grabbingGun = false
local function grabGunImproved()
    if grabbingGun then return end
    if not LocalPlayer.Character then return end
    local char = LocalPlayer.Character
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not char or not hrp then notify("Grab Gun", "Персонаж не найден", 2); return end
    local bp = LocalPlayer:FindFirstChild("Backpack")
    local isMurderer = checkKnife(LocalPlayer)
    if isMurderer then notify("Grab Gun", "Ты убийца, пушка не нужна!", 2); return end
    local function hasGun()
        local currentBp = LocalPlayer:FindFirstChild("Backpack")
        return (char:FindFirstChild("Gun") or char:FindFirstChild("Revolver")) or (currentBp and (currentBp:FindFirstChild("Gun") or currentBp:FindFirstChild("Revolver")))
    end
    if hasGun() then notify("Grab Gun", "У тебя уже есть пушка!", 2); return end
    local gunDrop = workspace:FindFirstChild("GunDrop", true) or workspace:FindFirstChild("DroppedGun", true)
    local handle = gunDrop and (gunDrop:FindFirstChild("Handle", true) or gunDrop:FindFirstChildOfClass("Part", true) or gunDrop)
    if not handle then notify("Grab Gun", "Пушки нет на карте!", 2); return end
    grabbingGun = true
    local originalCFrame = hrp.CFrame
    local targetCFrame = handle:IsA("Model") and handle:GetPivot() or handle.CFrame
    hrp.CFrame = targetCFrame * CFrame.new(0, -1, 0)
    if firetouchinterest then
        pcall(function()
            firetouchinterest(hrp, handle, 0)
            task.wait(0.02)
            firetouchinterest(hrp, handle, 1)
        end)
    end
    task.wait(0.15)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        hrp.CFrame = originalCFrame
    end
    task.wait(0.1)
    if hasGun() then notify("Grab Gun", "Пушка подобрана!", 2) else notify("Grab Gun", "Не удалось подобрать пушку!", 2) end
    grabbingGun = false
end

-- SHOOT BUTTON
local function createGunBeam(startPos, endPos, color, duration)
    duration = duration or 0.2
    color = color or Color3.fromRGB(180, 50, 255)
    local distance = (startPos - endPos).Magnitude
    if distance < 1 then return end
    local beam = Instance.new("Part")
    beam.Name = "GunBeam"
    beam.Size = Vector3.new(0.15, 0.15, distance)
    beam.CFrame = CFrame.lookAt(startPos, endPos) * CFrame.new(0, 0, -distance / 2)
    beam.Anchored = true
    beam.CanCollide = false
    beam.Material = Enum.Material.Neon
    beam.Color = color
    beam.Transparency = 0.1
    beam.Parent = workspace
    local light = Instance.new("PointLight")
    light.Color = color; light.Brightness = 10; light.Range = 15; light.Parent = beam
    task.spawn(function()
        for i = 1, 10 do
            task.wait(duration / 10)
            beam.Transparency = beam.Transparency + 0.09
            beam.Size = Vector3.new(beam.Size.X * 0.95, beam.Size.Y * 0.95, beam.Size.Z)
        end
        beam:Destroy()
    end)
    return beam
end

local function createShootButton()
    if Cache.ShootButton then pcall(function() Cache.ShootButton:Destroy() end) end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ShootButton"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = UDim2.new(0.5, -50, 0.6, 0)
    button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    button.BackgroundTransparency = 0.15
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = "Выстрел"
    button.TextSize = 18
    button.Font = Enum.Font.GothamBold
    button.BorderSizePixel = 2
    button.BorderColor3 = Color3.fromRGB(60, 60, 60)
    button.BorderTransparency = 0.3
    button.Parent = screenGui
    button.ClipsDescendants = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = button
    local isDragging = false
    local dragStart = nil
    local startPos = nil
    local clickStartPos = nil
    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
            dragStart = input.Position
            clickStartPos = input.Position
            startPos = button.Position
            button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            button.BackgroundTransparency = 0.1
        end
    end)
    button.InputChanged:Connect(function(input)
        if not dragStart then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position - dragStart
            if delta.Magnitude > 10 then isDragging = true end
            if isDragging then
                button.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end
    end)
    button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            button.BackgroundTransparency = 0.15
            if clickStartPos and (input.Position - clickStartPos).Magnitude < 10 then
                task.spawn(function()
                    if not LocalPlayer.Character then return end
                    if not equipGun() then notify("Выстрел", "Оружие не найдено", 2); return end
                    local target, targetDist = nil, math.huge
                    local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if not myHRP then return end
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character and checkKnife(player) and isPlayerVisible(player) then
                            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                local dist = (myHRP.Position - hrp.Position).Magnitude
                                if dist < targetDist then targetDist = dist; target = player end
                            end
                        end
                    end
                    if not target then notify("Выстрел", "Убийца не найден", 2); return end
                    local tHRP = target.Character:FindFirstChild("HumanoidRootPart")
                    if not tHRP then return end
                    local beamStart = Camera.CFrame.Position
                    local vel = tHRP.AssemblyLinearVelocity
                    local predictedPos = tHRP.Position + (vel * 0.1)
                    createGunBeam(beamStart, predictedPos, Color3.fromRGB(180, 50, 255), 0.2)
                    Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, predictedPos)
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.MouseButton1, false, game)
                        task.wait(0.05)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.MouseButton1, false, game)
                    end)
                end)
            end
            isDragging = false
            dragStart = nil
            clickStartPos = nil
        end
    end)
    Cache.ShootButton = screenGui
    return screenGui
end

-- SHERIFF AUTO SHOOT
local function getTargetPart(target)
    local char = target.Character
    if not char then return nil end
    if Settings.AimTargetPart == "Head" then
        return char:FindFirstChild("Head")
    elseif Settings.AimTargetPart == "HumanoidRootPart" then
        return char:FindFirstChild("HumanoidRootPart")
    else
        return char:FindFirstChild("HumanoidRootPart")
    end
end

local function smoothAim(current, target, smoothness)
    return current + (target - current) * smoothness
end

local function isVisible(targetPart)
    if not Settings.AimWallCheck then return true end
    local char = LocalPlayer.Character
    if not char then return true end
    local origin = char:FindFirstChild("HumanoidRootPart")
    if not origin then return true end
    if not targetPart then return false end
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {char, targetPart.Parent}
    local result = workspace:Raycast(origin.Position, (targetPart.Position - origin.Position), raycastParams)
    return result == nil
end

local function sheriffAutoShootLoop()
    while Settings.SheriffAutoShootEnabled do
        task.wait(0.03)
        if not LocalPlayer.Character then continue end
        if not checkGun(LocalPlayer) then continue end
        local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not myHRP then continue end
        local target, targetDist = nil, math.huge
        for _, player in ipairs(Players:GetPlayers()) do
            if player == LocalPlayer then continue end
            if not player.Character then continue end
            if not checkKnife(player) then continue end
            local targetPart = getTargetPart(player)
            if not targetPart then continue end
            if not isVisible(targetPart) then continue end
            local dist = (myHRP.Position - targetPart.Position).Magnitude
            if dist < targetDist and dist <= 100 then targetDist = dist; target = player end
        end
        if target then
            local targetPart = getTargetPart(target)
            if not targetPart then continue end
            local targetPos = targetPart.Position
            if Settings.AimPredict then
                local vel = targetPart.AssemblyLinearVelocity
                targetPos = targetPos + (vel * 0.12)
            end
            local current = Camera.CFrame.Position
            local lookAt = CFrame.lookAt(current, targetPos)
            if Settings.AimSmoothness < 1 then
                local smoothPos = smoothAim(current, lookAt.Position, Settings.AimSmoothness)
                local smoothLook = CFrame.lookAt(smoothPos, targetPos)
                Camera.CFrame = smoothLook
            else
                Camera.CFrame = lookAt
            end
            createGunBeam(Camera.CFrame.Position, targetPos, Color3.fromRGB(180, 50, 255), 0.15)
            pcall(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.MouseButton1, false, game)
                task.wait(0.05)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.MouseButton1, false, game)
            end)
            task.wait(0.25)
        end
    end
end

-- FARM
local function getCurrentCoins()
    local ok, res = pcall(function()
        local gui = LocalPlayer.PlayerGui:FindFirstChild("MainGUI")
        if not gui then return 0 end
        local gameGui = gui:FindFirstChild("Game")
        if not gameGui then return 0 end
        local coinBags = gameGui:FindFirstChild("CoinBags")
        if not coinBags then return 0 end
        local container = coinBags:FindFirstChild("Container")
        if not container then return 0 end
        local coin = container:FindFirstChild("Coin")
        if not coin then return 0 end
        local currencyFrame = coin:FindFirstChild("CurrencyFrame")
        if not currencyFrame then return 0 end
        local icon = currencyFrame:FindFirstChild("Icon")
        if not icon then return 0 end
        local coinsText = icon:FindFirstChild("Coins")
        if not coinsText then return 0 end
        return coinsText.Text
    end)
    return ok and (tonumber(res) or 0) or 0
end

local function getValidCoins()
    local coins = {}
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return coins end
    for _, map in pairs(Workspace:GetChildren()) do
        local container = map:FindFirstChild("CoinContainer")
        if container then
            for _, coin in pairs(container:GetChildren()) do
                if coin.Name == "Coin_Server" and coin:IsA("BasePart") and coin:FindFirstChild("TouchInterest") then
                    table.insert(coins, {part=coin, distance=(hrp.Position-coin.Position).Magnitude})
                end
            end
        end
    end
    table.sort(coins, function(a,b) return a.distance < b.distance end)
    return coins
end

local function tweenToCoin(coin)
    if not coin or not coin.Parent or not coin:FindFirstChild("TouchInterest") then return false end
    local char = LocalPlayer.Character
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return false end
    local target = coin.Position + Vector3.new(0, 2, 0)
    if (hrp.Position - target).Magnitude < 5 then return true end
    if Cache.CurrentTween then pcall(function() Cache.CurrentTween:Cancel() end) end
    Cache.CurrentTween = TweenService:Create(hrp,
        TweenInfo.new((hrp.Position-target).Magnitude / Settings.AutoFarmSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {CFrame = CFrame.new(target)}
    )
    hum.Sit = true
    Cache.CurrentTween:Play()
    local done = false
    local c
    c = Cache.CurrentTween.Completed:Connect(function() done = true; safeDisconnect(c) end)
    local t0 = tick()
    while not done and Settings.AutoFarmEnabled do
        task.wait(0.1)
        if not coin or not coin.Parent or not coin:FindFirstChild("TouchInterest") then
            if Cache.CurrentTween then pcall(function() Cache.CurrentTween:Cancel() end) end
            hum.Sit = false
            return false
        end
        if tick() - t0 > 30 then
            if Cache.CurrentTween then pcall(function() Cache.CurrentTween:Cancel() end) end
            hum.Sit = false
            return false
        end
    end
    hum.Sit = false
    return done
end

local function collectCoin(coin)
    if not coin or not coin.Parent then return end
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    pcall(function()
        firetouchinterest(hrp, coin, 0)
        task.wait(0.05)
        firetouchinterest(hrp, coin, 1)
    end)
end

local function farmLoop()
    while Settings.AutoFarmEnabled do
        if not LocalPlayer.Character then task.wait(1) continue end
        local coins = getCurrentCoins()
        if coins >= Settings.AutoFarmCoinLimit then
            if Settings.AutoRespawn then
                notify("Авто фарм", "Респавн... (" .. coins .. " монет)", 2)
                local char = LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then hum.Health = 0 end
                end
                task.wait(5)
                continue
            else
                Settings.AutoFarmEnabled = false
                notify("Авто фарм", "Сумка полна - остановлено", 3)
                break
            end
        end
        local validCoins = getValidCoins()
        if #validCoins == 0 then task.wait(2) continue end
        local ok = tweenToCoin(validCoins[1].part)
        if ok and Settings.AutoFarmEnabled then
            collectCoin(validCoins[1].part)
            task.wait(Settings.AutoFarmCoinDelay)
        end
        task.wait(0.1)
    end
    Cache.AutoFarmConn = nil
end

local function setupAutoFarm()
    if Settings.AutoFarmEnabled then
        if not LocalPlayer.Character then return end
        Cache.AutoFarmConn = task.spawn(farmLoop)
        notify("Авто фарм", "Запущен", 3)
    else
        if LocalPlayer.Character then
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.Sit = false end
        end
        if Cache.CurrentTween then
            pcall(function() Cache.CurrentTween:Cancel() end)
            Cache.CurrentTween = nil
        end
    end
end

-- ANIMATION PACKS
local ANIM_PACKS = {
    ["Adidas Sports"] = {WalkAnim=18537392113, RunAnim=18537384940, JumpAnim=18537380791, FallAnim=18537367238, SwimIdle=18537387180, Swim=18537389531, Animation1=18537376492, Animation2=18537371272, ClimbAnim=18537363391},
    ["Adidas Community"] = {WalkAnim=122150855457006, RunAnim=82598234841035, JumpAnim=75290611992385, FallAnim=98600215928904, SwimIdle=109346520324160, Swim=133308483266208, Animation1=122257458498464, Animation2=102357151005774, ClimbAnim=88763136693023},
    ["Adidas Aura"] = {WalkAnim=83842218823011, RunAnim=118320322718866, JumpAnim=109996626521204, FallAnim=95603166884636, SwimIdle=94922130551805, Swim=134530128383903, Animation1=110211186840347, Animation2=114191137265065, ClimbAnim=97824616490448},
    ["Wicked Popular"] = {WalkAnim=92072849924640, RunAnim=72301599441680, JumpAnim=104325245285198, FallAnim=121152442762481, Animation1=118832222982049, ClimbAnim=131326830509784, SwimIdle=113199415118199, Swim=99384245425157, Animation2=76049494037641},
    Elder = {WalkAnim=10921111375, RunAnim=10921104374, JumpAnim=10921107367, FallAnim=10921105765, SwimIdle=10921110146, Swim=10921108971, ClimbAnim=10921100400, Animation1=10921101664, Animation2=10921102574},
    Zombie = {WalkAnim=10921355261, RunAnim=616163682, JumpAnim=10921351278, FallAnim=10921350320, SwimIdle=10921353442, Swim=10921352344, Animation1=10921344533, Animation2=10921345304, ClimbAnim=10921343576},
    Mage = {WalkAnim=10921152678, RunAnim=10921148209, JumpAnim=10921149743, FallAnim=10921148939, SwimIdle=10921151661, Swim=10921150788, ClimbAnim=10921143404, Animation1=10921144709, Animation2=10921145797},
    ["Catwalk Glam"] = {WalkAnim=109168724482748, RunAnim=81024476153754, JumpAnim=116936326516985, FallAnim=92294537340807, SwimIdle=98854111361360, Swim=134591743181628, ClimbAnim=119377220967554, Animation1=133806214992291, Animation2=94970088341563},
    Astronaut = {WalkAnim=10921046031, RunAnim=10921039308, JumpAnim=10921042494, FallAnim=10921040576, SwimIdle=10921045006, Swim=10921044000, ClimbAnim=10921032124, Animation1=10921034824, Animation2=10921036806},
    ["Wicked 'Dancing Through Life'"] = {WalkAnim=73718308412641, RunAnim=135515454877967, JumpAnim=78508480717326, FallAnim=78147885297412, SwimIdle=129183123083281, Swim=110657013921774, ClimbAnim=129447497744818, Animation1=92849173543269, Animation2=132238900951109},
    Werewolf = {WalkAnim=10921342074, RunAnim=10921336997, JumpAnim=nil, FallAnim=10921337907, SwimIdle=10921341319, Swim=10921340419, ClimbAnim=10921329322, Animation1=10921330408, Animation2=10921333667},
    Superhero = {WalkAnim=10921298616, RunAnim=10921291831, JumpAnim=10921294559, FallAnim=10921293373, SwimIdle=10921297391, Swim=10921295495, ClimbAnim=10921286911, Animation1=10921288909, Animation2=10921290167},
    Toy = {WalkAnim=10921312010, RunAnim=10921306285, JumpAnim=10921308158, FallAnim=10921307241, SwimIdle=10921310341, Swim=10921309319, ClimbAnim=10921300839, Animation1=10921301576, Animation2=nil},
    ["No Boundaries"] = {WalkAnim=18747074203, RunAnim=18747070484, JumpAnim=18747069148, FallAnim=18747062535, SwimIdle=18747071682, Swim=18747073181, ClimbAnim=18747060903, Animation1=18747067405, Animation2=18747063918},
    NFL = {WalkAnim=110358958299415, RunAnim=117333533048078, JumpAnim=119846112151352, FallAnim=129773241321032, SwimIdle=79090109939093, Swim=132697394189921, ClimbAnim=134630013742019, Animation1=92080889861410, Animation2=74451233229259},
    ["Amazon Unboxed"] = {WalkAnim=90478085024465, RunAnim=134824450619865, JumpAnim=121454505477205, FallAnim=94788218468396, SwimIdle=129126268464847, Swim=105962919001086, ClimbAnim=121145883950231, Animation1=98281136301627, Animation2=nil},
    Vampire = {WalkAnim=10921326949, RunAnim=10921320299, JumpAnim=10921322186, FallAnim=10921321317, SwimIdle=10921325443, Swim=10921324408, ClimbAnim=10921314188, Animation1=10921315373, Animation2=nil},
    Ninja = {Run=656118852, Walk=656121766, Jump=656117878, Fall=656115606, Swim=656119721, SwimIdle=656121397, Climb=656114359, Idle={656117400,656118341,886742569}},
    Robot = {Run=616091570, Walk=616095330, Jump=616090535, Fall=616087089, Swim=616092998, SwimIdle=616094091, Climb=616086039, Idle={616088211,616089559,885531463}},
    Levitation = {Run=616010382, Walk=616013216, Jump=616008936, Fall=616005863, Swim=616011509, SwimIdle=616012453, Climb=616003713, Idle={616006778,616008087,886862142}},
    Stylish = {Run=616140816, Walk=616146177, Jump=616139451, Fall=616134815, Swim=616143378, SwimIdle=616144772, Climb=616133594, Idle={616136790,616138447,886888594}},
    Bubbly = {Run=910025107, Walk=910034870, Jump=910016857, Fall=910001910, Swim=910028158, SwimIdle=910030921, Climb=909997997, Idle={910004836,910009958,1018536639}},
    Cartoon = {Run=742638842, Walk=742640026, Jump=742637942, Fall=742637151, Swim=742639220, SwimIdle=742639812, Climb=742636889, Idle={742637544,742638445,885477856}},
}

local ANIM_PACK_NAMES = {}
for name in pairs(ANIM_PACKS) do table.insert(ANIM_PACK_NAMES, name) end
table.sort(ANIM_PACK_NAMES)

local function applyAnimPack(packName)
    local pack = ANIM_PACKS[packName]
    if not pack then return false end
    local char = LocalPlayer.Character
    if not char then return false end
    local animate = char:FindFirstChild("Animate")
    if not animate then return false end
    local function setAnim(obj, id) if obj and id then obj.AnimationId = "rbxassetid://" .. tostring(id) end end
    local function ensureAnim(folder, name)
        if not folder then return nil end
        local a = folder:FindFirstChild(name)
        if not a then a = Instance.new("Animation"); a.Name = name; a.Parent = folder end
        return a
    end
    local runObj = ensureAnim(animate:FindFirstChild("run"), "RunAnim")
    local walkObj = ensureAnim(animate:FindFirstChild("walk"), "WalkAnim")
    local jumpObj = ensureAnim(animate:FindFirstChild("jump"), "JumpAnim")
    local fallObj = ensureAnim(animate:FindFirstChild("fall"), "FallAnim")
    local climbObj = ensureAnim(animate:FindFirstChild("climb"), "ClimbAnim")
    local swimObj = ensureAnim(animate:FindFirstChild("swim"), "Swim")
    local swimIdleObj = ensureAnim(animate:FindFirstChild("swimidle"), "SwimIdle")
    local idleFolder = animate:FindFirstChild("idle")
    setAnim(walkObj, pack.WalkAnim or pack.Walk)
    setAnim(runObj, pack.RunAnim or pack.Run)
    setAnim(jumpObj, pack.JumpAnim or pack.Jump)
    setAnim(fallObj, pack.FallAnim or pack.Fall)
    setAnim(climbObj, pack.ClimbAnim or pack.Climb)
    setAnim(swimObj, pack.Swim)
    setAnim(swimIdleObj, pack.SwimIdle or pack.Swim)
    if idleFolder then
        local a1 = idleFolder:FindFirstChild("Animation1")
        local a2 = idleFolder:FindFirstChild("Animation2")
        if pack.Animation1 then setAnim(a1, pack.Animation1) end
        if pack.Animation2 then setAnim(a2, pack.Animation2) end
        if pack.Idle then
            if a1 and pack.Idle[1] then setAnim(a1, pack.Idle[1]) end
            if a2 and pack.Idle[2] then setAnim(a2, pack.Idle[2] or pack.Idle[1]) end
        end
    end
    animate.Disabled = true; task.wait(0.06); animate.Disabled = false
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then pcall(function() hum:ChangeState(Enum.HumanoidStateType.Landed); task.wait(0.03); hum:ChangeState(Enum.HumanoidStateType.Running) end) end
    Settings.AnimPack = packName
    return true
end

-- ОСНОВНОЙ ЦИКЛ
local function updateVisuals()
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then
            if Settings.ChamsEnabled then applyChams(player)
            elseif Cache.ChamsPartsList[player.UserId] then removeChams(player) end
            continue
        end
        if not player.Character then continue end
        local role = getRole(player)
        if Settings.MurderESP and role == "Убийца" then
            createOrUpdateHighlight(player, Settings.MurderColor)
        elseif Settings.SheriffESP and role == "Шериф" then
            createOrUpdateHighlight(player, Settings.SheriffColor)
        elseif Settings.InnocentESP and role == "Невинный" then
            createOrUpdateHighlight(player, Settings.InnocentColor)
        else
            removeHighlight(player)
        end
        if Settings.ChamsEnabled then
            applyChams(player)
        elseif Cache.ChamsPartsList[player.UserId] then
            removeChams(player)
        end
    end
end

local function startMainUpdate()
    safeDisconnect(Cache.mainConn); Cache.mainConn = nil
    Cache.mainConn = RunService.Heartbeat:Connect(function()
        removeCore()
        if Settings.MurderESP or Settings.SheriffESP or Settings.InnocentESP or Settings.ChamsEnabled or Settings.Trails or Settings.TracersEnabled then
            updateVisuals()
        end
        if Settings.TracersEnabled then updateTracers() end
        if Settings.JumpCircles then
            if LocalPlayer.Character then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hum and hrp then
                    local isJumping = hum:GetState() == Enum.HumanoidStateType.Jumping
                    if isJumping and not Cache.JumpTracking.wasJumping then createJumpCircle(hrp.Position) end
                    Cache.JumpTracking.wasJumping = isJumping
                end
            end
        end
    end)
end

-- ========================================
-- ===== СОЗДАНИЕ НЕVERLOSE GUI =====
-- ========================================

-- ОБЪЯВЛЯЕМ ПЕРЕМЕННУЮ ДЛЯ МЕНЮ
local Window = nil
local menuOpen = false

-- ФУНКЦИЯ СОЗДАНИЯ МЕНЮ
local function createMenu()
    if Window then return end
    
    Window = NeverLose:CreateWindow({
        Name = "Planet Hub",
        Content = "v3.0 Ultimate",
        Logo = NeverLose.GlobalLogo,
        Size = UDim2.fromOffset(800, 600),
        Enable3DRenderer = false,
        Keybind = Enum.KeyCode.J
    })
    
    -- Visuals Tab
    local VisualsTab = Window:AddTab({Name = "Visuals", Icon = "eye"})
    
    local ESPSection = VisualsTab:AddSection({Name = "ESP", Position = "Left"})
    ESPSection:AddToggle({Default = Settings.MurderESP, Flag = "MurderESP", Callback = function(v) Settings.MurderESP = v; startMainUpdate() end})
    ESPSection:AddColorPicker({Default = Settings.MurderColor, Flag = "MurderColor", Callback = function(c) Settings.MurderColor = c; startMainUpdate() end})
    ESPSection:AddToggle({Default = Settings.SheriffESP, Flag = "SheriffESP", Callback = function(v) Settings.SheriffESP = v; startMainUpdate() end})
    ESPSection:AddColorPicker({Default = Settings.SheriffColor, Flag = "SheriffColor", Callback = function(c) Settings.SheriffColor = c; startMainUpdate() end})
    ESPSection:AddToggle({Default = Settings.InnocentESP, Flag = "InnocentESP", Callback = function(v) Settings.InnocentESP = v; startMainUpdate() end})
    ESPSection:AddColorPicker({Default = Settings.InnocentColor, Flag = "InnocentColor", Callback = function(c) Settings.InnocentColor = c; startMainUpdate() end})
    ESPSection:AddToggle({Default = Settings.TracersEnabled, Flag = "Tracers", Callback = function(v)
        Settings.TracersEnabled = v
        if v then for _,p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then createTracer(p) end end
        else clearAllTracers() end
        startMainUpdate()
    end})
    ESPSection:AddColorPicker({Default = Settings.TracersColor, Flag = "TracersColor", Callback = function(c)
        Settings.TracersColor = c
        for userId, line in pairs(Cache.Tracers) do line.Color = c end
    end})
    
    local ChamsSection = VisualsTab:AddSection({Name = "Chams", Position = "Right"})
    ChamsSection:AddToggle({Default = Settings.ChamsEnabled, Flag = "Chams", Callback = function(v) Settings.ChamsEnabled = v; updateChamsForAll(); startMainUpdate() end})
    ChamsSection:AddColorPicker({Default = Settings.ChamsColor, Flag = "ChamsColor", Callback = function(c) Settings.ChamsColor = c; if Settings.ChamsEnabled then updateChamsForAll() end end})
    ChamsSection:AddToggle({Default = Settings.RGBHumanoid, Flag = "RGBHumanoid", Callback = function(v) Settings.RGBHumanoid = v; setupRGBHumanoid() end})
    
    local EffectsSection = VisualsTab:AddSection({Name = "Effects", Position = "Left"})
    EffectsSection:AddToggle({Default = Settings.JumpCircles, Flag = "JumpCircles", Callback = function(v) Settings.JumpCircles = v; startMainUpdate() end})
    EffectsSection:AddColorPicker({Default = Settings.JumpCirclesColor, Flag = "JumpCirclesColor", Callback = function(c) Settings.JumpCirclesColor = c end})
    EffectsSection:AddToggle({Default = Settings.Trails, Flag = "Trails", Callback = function(v) Settings.Trails = v; if v then createLocalPlayerTrail() else removeLocalPlayerTrail() end; startMainUpdate() end})
    EffectsSection:AddColorPicker({Default = Settings.TrailsColor, Flag = "TrailsColor", Callback = function(c) Settings.TrailsColor = c; if Cache.TrailAttachments.trail then Cache.TrailAttachments.trail.Color = ColorSequence.new(c) end end})
    EffectsSection:AddToggle({Default = Settings.XRayEnabled, Flag = "XRay", Callback = function(v) Settings.XRayEnabled = v; setupXRay() end})
    EffectsSection:AddToggle({Default = Settings.BloomEnabled, Flag = "Bloom", Callback = function(v) Settings.BloomEnabled = v; setupBloom(v) end})
    EffectsSection:AddToggle({Default = Settings.VignetteEnabled, Flag = "Vignette", Callback = function(v) Settings.VignetteEnabled = v; setupVignette(v) end})
    
    local ChinaHatSection = VisualsTab:AddSection({Name = "China Hat", Position = "Right"})
    ChinaHatSection:AddToggle({Default = Settings.ChinaHatEnabled, Flag = "ChinaHat", Callback = function(v) toggleChinaHat(v) end})
    ChinaHatSection:AddColorPicker({Default = Settings.ChinaHatColor, Flag = "ChinaHatColor", Callback = function(c) Settings.ChinaHatColor = c end})
    ChinaHatSection:AddToggle({Default = Settings.ChinaHatRainbow, Flag = "ChinaHatRainbow", Callback = function(v) Settings.ChinaHatRainbow = v end})
    
    local AuraSection = VisualsTab:AddSection({Name = "Aura", Position = "Left"})
    AuraSection:AddToggle({Default = Settings.AuraEnabled, Flag = "Aura", Callback = function(v) Settings.AuraEnabled = v; if v then applyAura() else clearAura() end end})
    AuraSection:AddColorPicker({Default = Settings.AuraColor, Flag = "AuraColor", Callback = function(c) Settings.AuraColor = c; if Settings.AuraEnabled then applyAura() end end})
    for _, name in ipairs(AURA_ORDER) do
        AuraSection:AddToggle({Default = AuraSelected[name], Flag = "Aura_" .. name, Callback = function(v)
            AuraSelected[name] = v
            if Settings.AuraEnabled then applyAura() end
        end})
    end
    
    local WorldSection = VisualsTab:AddSection({Name = "World", Position = "Right"})
    WorldSection:AddToggle({Default = Settings.OrbizEnabled, Flag = "Orbiz", Callback = function(v) Settings.OrbizEnabled = v; createOrbiz() end})
    WorldSection:AddToggle({Default = Settings.TexturePackEnabled, Flag = "TexturePack", Callback = function(v)
        Settings.TexturePackEnabled = v
        if v then applyTexturePack() else clearTexturePack() end
    end})
    
    -- Combat Tab
    local CombatTab = Window:AddTab({Name = "Combat", Icon = "crosshairs"})
    
    local CombatSection = CombatTab:AddSection({Name = "Combat", Position = "Left"})
    CombatSection:AddToggle({Default = Settings.ShootButtonEnabled, Flag = "ShootButton", Callback = function(v)
        Settings.ShootButtonEnabled = v
        if v then createShootButton() else if Cache.ShootButton then pcall(function() Cache.ShootButton:Destroy() end); Cache.ShootButton = nil end end
    end})
    CombatSection:AddToggle({Default = Settings.SheriffAutoShootEnabled, Flag = "SheriffAutoShoot", Callback = function(v)
        Settings.SheriffAutoShootEnabled = v
        safeDisconnect(Cache.SheriffAutoShootConnection); Cache.SheriffAutoShootConnection = nil
        if v then Cache.SheriffAutoShootConnection = task.spawn(sheriffAutoShootLoop) end
    end})
    CombatSection:AddToggle({Default = Settings.KillAllEnabled, Flag = "KillAll", Callback = function(v)
        Settings.KillAllEnabled = v
        if v then if not Cache.KillAllRemote then FindKillRemote() end; setupKillAll() else safeDisconnect(Cache.KillAllConn); end
    end})
    CombatSection:AddToggle({Default = Settings.FlingMurderer, Flag = "FlingMurderer", Callback = function(v)
        Settings.FlingMurderer = v
        if v then local m = getMurdererFling(); if m then flingPlayer(m) else notify("Флинг", "Убийца не найден!", 2); Settings.FlingMurderer = false end end
    end})
    CombatSection:AddToggle({Default = Settings.FlingSheriff, Flag = "FlingSheriff", Callback = function(v)
        Settings.FlingSheriff = v
        if v then local s = getSheriffFling(); if s then flingPlayer(s) else notify("Флинг", "Шериф не найден!", 2); Settings.FlingSheriff = false end end
    end})
    CombatSection:AddToggle({Default = Settings.GrabGunEnabled, Flag = "GrabGun", Callback = function(v)
        Settings.GrabGunEnabled = v
        if v then grabGunImproved() end
    end})
    
    local AimbotSection = CombatTab:AddSection({Name = "Aimbot", Position = "Right"})
    AimbotSection:AddToggle({Default = Settings.FovAimbotEnabled, Flag = "FovAimbot", Callback = function(v)
        Settings.FovAimbotEnabled = v
        if v then createFovCircle() end
        setupFovAimbot()
    end})
    AimbotSection:AddSlider({Default = 120, Min = 10, Max = 600, Flag = "FovRadius", Callback = function(v)
        Settings.FovRadius = v
        if Cache.FovCircle then Cache.FovCircle.Radius = Settings.FovRadius end
    end})
    AimbotSection:AddSlider({Default = 50, Min = 1, Max = 100, Flag = "AimSmoothness", Callback = function(v) Settings.AimSmoothness = v / 100 end})
    AimbotSection:AddToggle({Default = Settings.AimPredict, Flag = "AimPredict", Callback = function(v) Settings.AimPredict = v end})
    AimbotSection:AddToggle({Default = Settings.AimWallCheck, Flag = "AimWallCheck", Callback = function(v) Settings.AimWallCheck = v end})
    
    -- Movement Tab
    local MovementTab = Window:AddTab({Name = "Movement", Icon = "wind"})
    
    local MovementSection = MovementTab:AddSection({Name = "Movement", Position = "Left"})
    MovementSection:AddToggle({Default = Settings.FlyEnabled, Flag = "Fly", Callback = function(v) toggleFly(v) end})
    MovementSection:AddSlider({Default = 50, Min = 10, Max = 200, Flag = "FlySpeed", Callback = function(v) Settings.FlySpeed = v end})
    MovementSection:AddToggle({Default = Settings.BHopEnabled, Flag = "BHop", Callback = function(v) toggleBHop(v) end})
    MovementSection:AddSlider({Default = 30, Min = 10, Max = 80, Flag = "BHopSpeed", Callback = function(v) Settings.BHopSpeed = v end})
    MovementSection:AddToggle({Default = Settings.SpinBotEnabled, Flag = "SpinBot", Callback = function(v) Settings.SpinBotEnabled = v; toggleSpinBot(v) end})
    MovementSection:AddSlider({Default = 9999, Min = 100, Max = 20000, Flag = "SpinSpeed", Callback = function(v) SpinBot.Speed = v end})
    MovementSection:AddToggle({Default = Settings.NoclipEnabled, Flag = "Noclip", Callback = function(v) Settings.NoclipEnabled = v; setupNoclip(v) end})
    MovementSection:AddToggle({Default = Settings.AntiFlingEnabled, Flag = "AntiFling", Callback = function(v) Settings.AntiFlingEnabled = v; setupAntiFling() end})
    MovementSection:AddToggle({Default = Settings.WallHopEnabled, Flag = "WallHop", Callback = function(v) toggleWallHop(v) end})
    
    -- Farm Tab
    local FarmTab = Window:AddTab({Name = "Farm", Icon = "tractor"})
    
    local FarmSection = FarmTab:AddSection({Name = "Auto Farm", Position = "Left"})
    FarmSection:AddToggle({Default = Settings.AutoFarmEnabled, Flag = "AutoFarm", Callback = function(v) Settings.AutoFarmEnabled = v; setupAutoFarm() end})
    FarmSection:AddToggle({Default = Settings.AutoRespawn, Flag = "AutoRespawn", Callback = function(v) Settings.AutoRespawn = v end})
    FarmSection:AddSlider({Default = 20, Min = 5, Max = 50, Flag = "FarmSpeed", Callback = function(v) Settings.AutoFarmSpeed = v end})
    FarmSection:AddSlider({Default = 40, Min = 10, Max = 100, Flag = "CoinLimit", Callback = function(v) Settings.AutoFarmCoinLimit = v end})
    FarmSection:AddSlider({Default = 15, Min = 5, Max = 50, Flag = "CoinDelay", Callback = function(v) Settings.AutoFarmCoinDelay = v / 100 end})
    
    -- Animations Tab
    local AnimationsTab = Window:AddTab({Name = "Animations", Icon = "music"})
    
    local AnimSection = AnimationsTab:AddSection({Name = "Animation Packs", Position = "Left"})
    AnimSection:AddToggle({Default = Settings.AnimPackEnabled, Flag = "AnimPackEnabled", Callback = function(v)
        Settings.AnimPackEnabled = v
        if v and Settings.AnimPack ~= "" then applyAnimPack(Settings.AnimPack) end
    end})
    
    local AnimGridSection = AnimationsTab:AddSection({Name = "Select Pack", Position = "Right"})
    for _, packName in ipairs(ANIM_PACK_NAMES) do
        AnimGridSection:AddButton({Name = packName, Callback = function()
            Settings.AnimPack = packName
            if Settings.AnimPackEnabled then
                applyAnimPack(packName)
                notify("Анимации", "Применено: " .. packName, 2)
            else
                Settings.AnimPackEnabled = true
                applyAnimPack(packName)
                notify("Анимации", "Применено: " .. packName, 2)
            end
        end})
    end
    
    -- Fun Tab
    local FunTab = Window:AddTab({Name = "Fun", Icon = "smile"})
    
    local FunSection = FunTab:AddSection({Name = "Fun", Position = "Left"})
    FunSection:AddToggle({Default = Settings.JerkEnabled, Flag = "Jerk", Callback = function(v)
        Settings.JerkEnabled = v
        if v then
            if Cache.JerkConnection then Cache.JerkConnection:Disconnect() end
            Cache.JerkConnection = RunService.Heartbeat:Connect(function()
                if not LocalPlayer.Character then return end
                local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.AssemblyLinearVelocity = Vector3.new(math.random(-50,50), math.random(-30,30), math.random(-50,50)) end
            end)
        else
            if Cache.JerkConnection then Cache.JerkConnection:Disconnect() end; Cache.JerkConnection = nil
        end
    end})
    FunSection:AddToggle({Default = Settings.AntiAFKEnabled, Flag = "AntiAFK", Callback = function(v) Settings.AntiAFKEnabled = v; setupAntiAFK() end})
    FunSection:AddButton({Name = "Rejoin", Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end})
end

-- ========================================
-- ===== ЗАПУСК =====
-- ========================================

local Loader = NeverLose.new({
    Name = "Planet Hub",
    Content = "v3.0 Ultimate",
    Process = "Введите ключ для активации",
    Default = "",
    Yield = true,
    DefaultVersion = "Main",
    OnGetKey = function()
        -- Пустая функция, т.к. обработка теперь внутри
    end,
    OnRedeem = function(key)
        if key == "planet" or key == "12345" or key == "1" then
            return true, "Добро пожаловать!"
        else
            return false, "Неверный ключ!"
        end
    end
})

task.spawn(function()
    local result = Loader:Await()
    print("Активировано! Ключ: " .. tostring(result))
    
    -- Создаём меню
    createMenu()
    
    -- Запускаем основные функции
    startMainUpdate()
    createFovCircle()
    createChinaHatDrawings()
    setupFlyKeys()
    
    -- Обработка событий игроков
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            task.wait(0.5)
            if Settings.ChamsEnabled then cacheCharacterParts(player); applyChams(player) end
            if Settings.TracersEnabled and player ~= LocalPlayer then createTracer(player) end
            if Settings.MurderESP or Settings.SheriffESP or Settings.InnocentESP then
                local r = getRole(player)
                if Settings.MurderESP and r == "Убийца" then createOrUpdateHighlight(player, Settings.MurderColor)
                elseif Settings.SheriffESP and r == "Шериф" then createOrUpdateHighlight(player, Settings.SheriffColor)
                elseif Settings.InnocentESP and r == "Невинный" then createOrUpdateHighlight(player, Settings.InnocentColor) end
            end
        end)
    end)

    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(0.5)
        clearAllHighlights()
        clearAllChams()
        clearAllTracers()
        Cache.ChamsPartsList = {}
        removeCore()
        
        for _, player in ipairs(Players:GetPlayers()) do
            if Settings.ChamsEnabled then cacheCharacterParts(player); applyChams(player) end
            if Settings.TracersEnabled and player ~= LocalPlayer then createTracer(player) end
            if Settings.MurderESP or Settings.SheriffESP or Settings.InnocentESP then
                local r = getRole(player)
                if Settings.MurderESP and r == "Убийца" then createOrUpdateHighlight(player, Settings.MurderColor)
                elseif Settings.SheriffESP and r == "Шериф" then createOrUpdateHighlight(player, Settings.SheriffColor)
                elseif Settings.InnocentESP and r == "Невинный" then createOrUpdateHighlight(player, Settings.InnocentColor) end
            end
        end
        
        setupRGBHumanoid()
        Cache.JumpTracking = {wasJumping = false}
        
        if Settings.Trails then task.wait(0.1); createLocalPlayerTrail() end
        if Settings.FlyEnabled then task.wait(0.5); startFly() end
        if Settings.BHopEnabled then startBHop() end
        if Settings.AntiFlingEnabled then setupAntiFling() end
        if Settings.FovAimbotEnabled then setupFovAimbot() end
        if Settings.ShootButtonEnabled then createShootButton() end
        if Settings.WallHopEnabled then toggleWallHop(true) end
        if Settings.SheriffAutoShootEnabled then Cache.SheriffAutoShootConnection = task.spawn(sheriffAutoShootLoop) end
        if Settings.TexturePackEnabled then task.wait(0.3); applyTexturePack() end
        if Settings.ChinaHatEnabled then task.wait(0.2); if Settings.ChinaHatStyle == "Classic" then hatAddClassic(LocalPlayer.Character) end end
        if Settings.AuraEnabled then task.wait(0.3); applyAura() end
        if Settings.OrbizEnabled then task.wait(0.2); createOrbiz() end
        if Settings.KillAllEnabled then task.wait(0.2); if not Cache.KillAllRemote then FindKillRemote() end; setupKillAll() end
        if Settings.AnimPackEnabled and Settings.AnimPack ~= "" then task.wait(0.3); applyAnimPack(Settings.AnimPack) end
    end)

    notify("Planet Hub", "Загружен! Нажми J для открытия меню", 4)
    print("✅ PLANET HUB v3.0 LOADED!")
    
    task.wait(1)
    Loader:Unload()
end)

return Loader
