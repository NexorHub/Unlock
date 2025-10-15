local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[22997799].json"

local mensagens = {
    "Você sabia que agora pode ganhar dinheiro usando o Nexor Hub?",
    "Faça login por 10 dias  no Nexor Hub!!",
    "E Ganhe entre 100 a 4000 Robux com Gamepass ativa!!"
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
