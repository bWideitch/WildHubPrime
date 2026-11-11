local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/bWideitch/WindUI/refs/heads/main/dist/main.lua"))()
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
        
        tabs.Intro:Paragraph({
            Title = "Hello user!",
            Desc = 'Ur welcome if ur not a guy named "aabbaaii"!'
        })
        LStack:Image({
            Image = getcustomasset("WildHubPrime/assets/Ts.jpg"),
            AspectRatio = "1:1",
            Radius = 12
        })
    
        RStack:Paragraph({
            Title = "What do we have?",
            Desc = [[This is Wild Hub... but prime!
            • Basically this is a full revamp of the old Wild Hub script, a much better version that will actually have updates and no coderot!
            • We dont have a discord server anymore, the old one is abandoned, our only Social Media will be Youtube and TikTok]]
        })
    end
    
    return tabs
end

return idk
