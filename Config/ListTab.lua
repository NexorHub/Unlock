-- [[ Veja abaixo todos os jogos compatíveis com o Nexor Hub Universal ]]
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")

local NexorLib = {}
NexorLib.__index = NexorLib

-- IDs dos jogos suportados
NexorLib.Games = {
    12886143095,
    90906407195271,
    104715542330896,
    93978595733734,
    110931811137535,
    16116270224,
    105555311806207,
    75366259315586,
    15092647980,
    127742093697776,
    15101393044,
    9391468976,
    107573139811370,
    90462358603255,
    16732694052,
    18668065416,
    9872472334,
    13772394625,
    17625359962,
    72829404259339,
    10449761463,
    116495829188952,
    16146832113,
    920587237,
    2753915549,
    9865958871,
    109983668079237,
    18687417158,
    142823291,
    5956785391,
    73956553001240,
    4520749081,
    126884695634066,
    103754275310547,
    111989938562194,
    79546208627805,
    121864768012064,
    8737899170,
    6516141723,
    4924922222,
    99567941238278,
}

NexorLib.UniversalScript = "https://raw.githubusercontent.com/NexorHub/Games/refs/heads/main/Universal/Scripts.lua"

function NexorLib:Init(Rayfield, Window)
    local ListTab = Window:CreateTab("Lista", "dices")
    ListTab:CreateSection("Veja abaixo todos os jogos compatíveis e clique para entrar")

    local totalGames = #self.Games
    local loadedCount = 0

    for _, gameId in ipairs(self.Games) do
        task.spawn(function()
            local success, gameInfo = pcall(function()
                return MarketplaceService:GetProductInfo(gameId)
            end)

            if success and gameInfo then
                ListTab:CreateButton({
                    Name = gameInfo.Name,
                    Callback = function()
                        if NexorLib.OnGameSelected then
                            NexorLib.OnGameSelected(gameInfo.Name, gameId)
                        end

                        Players.LocalPlayer.OnTeleport:Connect(function(State)
                            if State == Enum.TeleportState.Started then
                                queue_on_teleport(("loadstring(game:HttpGet('%s'))()"):format(NexorLib.UniversalScript))
                            end
                        end)

                        TeleportService:Teleport(gameId, Players.LocalPlayer)
                    end
                })
            else
                warn("[NexorLib] Falha ao buscar nome para o jogo ID: " .. tostring(gameId))
            end
            loadedCount += 1
            if loadedCount >= totalGames then
                task.wait(0.5)
                local Tabs = Window.Tabs or {}
                for _, tab in pairs(Tabs) do
                    if tab.Title ~= "Lista" then
                        Rayfield:SelectTab(tab)
                        break
                    end
                end
            end
        end)
    end

    return ListTab
end

return NexorLib
