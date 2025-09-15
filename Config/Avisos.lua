local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[11].json"

local mensagens = {
    "Aviso Rápido!!",
    "Nexor Hub, agora esta funcionando normalmente no 99 noites"
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
