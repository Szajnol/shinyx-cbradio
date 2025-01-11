ESX = exports["es_extended"]:getSharedObject()

RegisterCommand('cbradio', function ()
    cbRadio()
end)

local toggled = false

RegisterNUICallback('changeChannel', function(data,cb)
    print(data)
    exports['pma-voice']:setRadioChannel(data)
end)

RegisterNUICallback('nuiFocus', function(data,cb)
    exports['hud']:showUI()
    SetNuiFocus(false, false)
end)

function cbRadio()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if DoesEntityExist(vehicle) then
        toggled = true
        SetNuiFocus(true, true)
        exports['hud']:hideUI()
        SendNUIMessage({
            action = 'toggleRadio'
        })
    else
        ESX.ShowNotification('Jesteś poza pojazdem')
    end
    
end

lib.onCache('vehicle', function(value)
    inVeh = value and true or false
    if inVeh == false and toggled == true then
        exports['pma-voice']:setRadioChannel(0)
        SendNUIMessage({
            action = 'editRadio'
        })
    end
end)