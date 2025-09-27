local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[14].json"

local mensagens = {
    "Oi Galera!! :)",
    "Convide 3 pesssoas para usar o Nexor Hub",
    "E ganhe um presente secreto!! 🎁👏🏻🥳"
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
