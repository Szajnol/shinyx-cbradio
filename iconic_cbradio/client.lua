
RegisterCommand('cbradio', function ()
    cbRadio()
end)

local toggled = false

RegisterNUICallback('changeChannel', function(data,cb)
    exports['pma-voice']:setRadioChannel(data)
end)

RegisterNUICallback('nuiFocus', function(data,cb)
    SetNuiFocus(false, false)
end)

function cbRadio()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if DoesEntityExist(vehicle) then
        toggled = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'toggleRadio'
        })
    else
        print('Nie ma cie w pojezdzie')
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
