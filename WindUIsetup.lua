local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/bWideitch/WindUI/refs/heads/main/dist/main.lua"))()
local Players = cloneref(game:GetService("Players"))
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
                {Title = "TikTok", Callback = function() setclipboard(TikTok_Link) end}
            }
        })

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

    -- Misc tab
    do
        tabs.Misc = Window:Tab({Title = "Misc", Icon = "settings"})
        tabs.Misc:Button({
            Title = "Copy Place Id",
            Callback = function() setclipboard(game.PlaceId) end
        })
        tabs.Misc:Button({
            Title = "Copy Job Id",
            Callback = function() setclipboard(game.JobId) end
        })

        local Job_id = ""
        tabs.Misc:Divider()
        
        tabs.Misc:Input({
            Title = "Input JobId",
            Desc = "Input a JobId, its like the Id of a specific Server of the game that is active, so you can join later.",
            Callback = function(a)
                Job_id = a
            end
        })

        local function join_server(job_id, msg)
            WindUI:Popup({
                Title = msg,
                Buttons = {
                    {
                        Title = "Yes.",
                        Callback = function()
                            if #Players:GetPlayers() == 1 then
                                game.Players.LocalPlayer:Kick("WILD HUB PRIME: Teleporting...") end
                            local s, r = pcall(function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, job_id, Players.LocalPlayer) end)
                            if not s then
                                WindUI:Notify({
                                    Title = "an error ocurred!",
                                    Desc = "The error was copied to your clipboard."
                                })
                                setclipboard(r)
                            end
                        end
                    },
                    {
                        Title = "Nevermind."
                    }
                }
            })
        end

        tabs.Misc:Button({
            Title = "Join Server",
            Callback = function()
                join_server(Job_id, "Are you sure you want to join this server?")
            end
        })
        tabs.Misc:Button({
            Title = "Rejoin Server",
            Callback = function()
                join_server(game.JobId, "Are you sure you want rejoin in the game?")
            end
        })

        tabs.Misc:Divider()

        tabs.Misc:Toggle({
            Title = "Toggle 3D Rendering",
            Desc = "You can toggle 3D Rendering to save GPU work",
            Value = true,
            Callback = function(a)
                game:GetService("RunService"):Set3dRenderingEnabled(a)
            end
        })

        local antiafk=false
        tabs.Misc:Toggle({
            Title = "Anti AFK",
            Desc = "Prevents you from getting kicked from inactivity.",
            Callback = function(v) antiafk=v end
        })
        tabs.Misc:Button({
            Title = "Exit game",
            Desc = "Shut down your current client, making you leave the game instantly and very fast",
            Callback = function()
                WindUI:Popup({
                    Title = "Are you sure you want to shut down your client?",
                    Buttons = {
                        {Title="Yes.", Callback = function() game:Shutdown() end},
                        {Title="Nevermind."}
                    }
                })
            end
        })
        tabs.Misc:Button({
            Title = "Freeze game",
            Desc = "It will make your game freeze with a lethal code",
            Callback = function()
                WindUI:Popup({
                    Title = "Are you sure you want to freeze your client?",
                    Buttons = {
                        {Title="Yes.", Callback = function() while true do end end},
                        {Title="Nevermind."}
                    }
                })
            end
        })

        tabs.Misc:Divider()

        local fui, fn = 1, "Roblox"
        tabs.Misc:Input({
            Title = "Input fake UserId",
            Desc = "Spoof your UserId!",
            Value = "1",
            Placeholder = "1",
            Callback = function(a)
                local b = tonumber(a)
                if not b then
                    WindUI:Notify({
                        Title = "Invalid UserId.",
                        Desc = "UserId should be a number!"
                    })
                end
                fui = b
            end
        })
        tabs.Misc:Input({
            Title = "Input fake UserName",
            Desc = "Spoof your UserName!",
            Value = "Roblox",
            Placeholder = "Roblox",
            Callback = function(a)
                fn = a
            end
        })
        tabs.Misc:Button({
            Title = "Spoof UserId",
            Callback = function() Players.LocalPlayer.UserId = fui end
        })
        tabs.Misc:Button({
            Title = "Spoof UserName",
            Callback = function() Players.LocalPlayer.Name = fn end
        })
        tabs.Misc:Button({
            Title = "Spoof DisplayName",
            Callback = function() Players.LocalPlayer.DisplayName = fn end
        })

        Players.LocalPlayer.Idled:Connect(function()
            if antiafk then
                mouse2press(3850, 2170)
                mouse2release(3850, 2170)
            end
        end)
    end

    Window:SelectTab(tabs.Intro)

    return tabs
end

if getgenv().WildHubLoaded then error("Wild Hub is already loaded.", 0) end

return idk
