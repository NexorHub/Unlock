local TextChatService = game:GetService("TextChatService")
local avisoFile = "avisos[1].json"

local mensagem1 = "Estou aprimorando a tecnologia do Nexor"
local mensagem2 = "Em breve você vai poder conversar com o Nexor dentro do próprio script."
local mensagem3 = ""
local mensagem4 = ""
pcall(function()
    if not isfile(avisoFile) then
        TextChatService.TextChannels.RBXGeneral:SendAsync(mensagem1)
        task.wait(1)
        TextChatService.TextChannels.RBXGeneral:SendAsync(mensagem2)
        writefile(avisoFile, "executado")
    else
        warn("Aviso já foi executado, não será enviado novamente.")
    end
end)
