local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[9].json"

local mensagens = {
    "Aviso Rápido!!",
    "Esse final de semanva, vamos esta atualizando o Nexor Hub",
    "Vamos corrijir todos os bugs, e adicionar novas opções!!"
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
