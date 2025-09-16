local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[12].json"

local mensagens = {
    "Aviso Rápido!!",
    "Você sabia que o Nexor Hub, também funciona em outros jogos?",
    "Veja na aba Lista todos os jogos compatíveis com o Nexor Hub."
}

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
