local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[20].json"

local mensagens = {
    "Oi Usuario do meu script :)",
    "Você sabia que o Nexor Hub tbm funciona em outro jogos?",
    "Veja na Aba *🎲 Lista* o nome de todos os jogos compatíveis."
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
