local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[16].json"

local mensagens = {
    "Oi Galera!! :)",
    "Alguem que for do servidor do Nexor Hub",
    "Porem nos ajudar, aplicando inpulsos na comunidade?"
}

local function CopiarLink(link)
    if type(setclipboard) == "function" then
        pcall(function()
            setclipboard(link)
        end)
    end
end

local Rekonise = "discord.com/invite/rgrSMDrrM5"
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
