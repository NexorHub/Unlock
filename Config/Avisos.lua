local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[8].json"

local mensagens = {
    "Desafio do dia ✨",
    "Compartilhe o Nexor Hub com 3 amigos",
    "E ganhe uma recarga de 300 dimas no ff"
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
