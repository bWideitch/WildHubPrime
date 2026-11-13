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
            RichText = true,
            Desc = '<font size="19"><b>Have fun using Wild Hub!</b></font><br/><u>you can use it to make your gaming experience crazyy</u>'
        })
        tabs.Intro:Divider()
        
        local Youtube_Link = ""
        local TikTok_Link = ""
        tabs.Intro:Paragraph({
            Title = "Follow Wild Wide on Social Media!",
            Desc = "Sneak peeks and showcases will be shown on my socials!",
            Buttons = {
                {Title = "Youtube", Callback = function() setclipboard(Youtube_Link) end},
                {Title = "TikTok", Callback = function() setclipboard(TikTok_Link) end},
                
            }
        })
        task.wait()
        
        LStack:Paragraph({
            Title = "» THIS SCRIPT DON'T HAVE KEY SYSTEM",
            RichText = true,
            Desc = '• if you see this same script with a key system please <font size="15"><b>report</b></font> it'
        })
    
        local LSts = LStack:Section({
            Title = "Share Wild Hub with people you know!",
            Desc = "I would be grateful if you contribute on the popularity of Wild Hub!",
            Opened = true
        })
        LSts:Code({
            Title = "Share it's loadstring!",
            Code = 'loadstring(game:HttpGet("URL"))()'
        })
    
        RStack:Paragraph({
            Title = "What was OG Wild Hub?",
            Desc = "OG Wild Hub didnt had \"prime\" on its name, it was a good script, unfortunately i lost motivation to my project and i fully lost its source code, lost a script hub with big potential..."
        })
    end
    
    return tabs
end

return idk
