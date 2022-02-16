local isOpen = false
local packsMain = RageUI.CreateMenu("Packs", "Menu Packs")
packsMain.Closed = function()
    isOpen = false
    RageUI.Visible(packsMain, false)
end

function OpenPacksMenu()
    if isOpen then
        isOpen = false
        RageUI.Visible(packsMain, false)
    else   
        isOpen = true
        RageUI.Visible(packsMain, true)
            Citizen.CreateThread(function()
                while isOpen do
                    Wait(1)
                    RageUI.IsVisible(packsMain, function()
                        for k, v in pairs(Config.Packs) do
                            RageUI.Button(v.Label, description, {}, true, {
                                onSelected = function()
                                    local confirm = KeyBoardInput('Êtes vous sur de vouloir prendre ce pack ?', 'Oui/Non', 7, false)
                                    if confirm == "Oui" then
                                        TriggerServerEvent(v.Events, v.Price)
                                    else
                                        Notifications("Vous n'avez pas confirmé l'ouverture du pack")
                                    end
                                end
                            })
                        end
                    end)
                end
            end)
    end
end

RegisterCommand("packs", function()
    OpenPacksMenu()
end, false)