local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[6].json"

local mensagens = {
    "Estou aprimorando a tecnologia do Nexor",
    "Em breve você vai poder conversar com o Nexor dentro do próprio script.",
    "Nova atualização chegando em breve.",
    "Fique ligado para mais novidades!"
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
