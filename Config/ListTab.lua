-- [[ Veja abaixo todos os jogos compatíveis com o Nexor Hub Universal ]]

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local MarketplaceService = game:GetService("MarketplaceService")

local NexorLib = {}
NexorLib.__index = NexorLib

NexorLib.Games = {
    2753915549,
    9865958871,
    109983668079237,
    18687417158,
    5956785391,
    111989938562194,
    79546208627805,
    121864768012064,
    8737899170,
    6516141723,
    4924922222
}

NexorLib.UniversalScript = "https://raw.githubusercontent.com/NexorHub/Games/refs/heads/main/Universal/Scripts.lua"

function NexorLib:Init(Rayfield, Window)
    local ListTab = Window:CreateTab("Lista", "dices")
    ListTab:CreateSection("Veja abaixo todos os jogos compatíveis")

    for _, gameId in ipairs(self.Games) do
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
    end

    return ListTab
end

return NexorLib
