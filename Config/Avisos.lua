local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[13].json"

local mensagens = {
    "Oi Galera!! :)",
    "Dia 24 e aniversário do Ethus 🥳🎉",
    "Parabéns para mim 👏🏻🥳"
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
