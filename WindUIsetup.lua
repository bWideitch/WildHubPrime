local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/bWideitch/WindUI/refs/heads/main/dist/main.lua"))()
local ts = game:GetService("TweenService")
local idk = setmetatable({}, {__index = WindUI})
function idk:Setup(Window)
    local tabs = {}
    
    -- Welcome tab
    do
        tabs.Intro = Window:Tab({
            Title = "Welcome",
            Icon = "sparkles"
        })
    
        local Hstack = tabs.Intro:HStack()
        local LStack = Hstack:VStack()
        local RStack = Hstack:VStack()
        
        Hstack:Paragraph({
            Title = "Hello user!",
            Desc = 'Ur welcome if ur not a guy named "aabbaaii"!'
        })
        LStack:Image({
            Image = getcustomasset("WildHub Prime/assets/Ts.jpg"),
            AspectRatio = "16:9",
            Radius = 12
        })
    
        RStack:Paragraph({
            Title = "What do we have?",
            Desc = [[This is Wild Hub... but prime!
            • Basically this is a full revamp of the old Wild Hub script, a much better version that will actually have updates and no coderot!
            • We dont have a discord server anymore, the old one is abandoned, our only Social Media will be Youtube and TikTok]]
        })
    end

    -- Gui toggle button
    local button = Instance.new("ImageButton")
    button.Name = "WHP:ToggleButton"
    button.Size = UDim2.fromOffset(80, 80)
    button.Position = UDim2.new(0.5, 0, 0.5, 0)
    button.AnchorPoint = Vector2.new(0.5, 0.5)
    button.BackgroundTransparency = 1
    button.AutoButtonColor = false
    button.Image = getcustomasset("WildHub Prime/assets/Logo.png")
    button.ScaleType = Enum.ScaleType.Fit
    button.Parent = WindUI.ScreenGui

    local og_size = button.Size

    button.MouseButton1Up:Connect(function()
        Window:Toggle()
        local expand = TweenService:Create(button, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = originalSize + UDim2.fromOffset(10, 10)
        })

        local shrink = TweenService:Create(button, TweenInfo.new(0.15,     Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = og_size
        })

        expand:Play()
        expand.Completed:Wait()
        shrink:Play()
    end)
    
    return tabs
end

return idk
