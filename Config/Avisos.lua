local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[17].json"

local mensagens = {
    "Oi Galera!! :)",
    "Entre no novo servidor do Nexor Hub!!",
    "O link do servidor já foi copiado."
}

local function CopiarLink(link)
    if type(setclipboard) == "function" then
        pcall(function()
            setclipboard(link)
        end)
    end
end

local Rekonise = "https://discord.gg/hfDB7DamDS"
CopiarLink(Rekonise)

pcall(function()
    if not isfile(avisoFile) then
        for _, msg in ipairs(mensagens) do
            if msg ~= "" then
                TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
                task.wait(1)
            end
        end
        writefile(avisoFile, "executado")
    else
        warn("Aviso já foi executado, não será enviado novamente.")
    end
end)
