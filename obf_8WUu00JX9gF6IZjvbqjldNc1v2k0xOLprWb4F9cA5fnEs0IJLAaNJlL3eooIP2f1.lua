-- Load KeyGuardian Library
local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()

-- KeyGuardian Configuration
local trueData = "edbd9cf80b3146abbce4b06e00f9201d"
local falseData = "b426978b0da347c5bf7c0561126369ca"

KeyGuardLibrary.Set({
    publicToken = "95ec1c520e564ce39d4935a54a3e98e1",
    privateToken = "ca1f10f1178c44f489e038e01571cf40",
    trueData = trueData,
    falseData = falseData,
})

-- User Key Input
local key = getgenv().Key -- User provides their key by setting getgenv().Key

if not key or key == "" then
    game.Players.LocalPlayer:Kick("No key provided. Please enter a valid key.")
    return
end

-- Validate Key
local success, response = pcall(function()
    return KeyGuardLibrary.validateDefaultKey(key)
end)

if not success then
    game.Players.LocalPlayer:Kick("An error occurred during key validation. Please try again.")
    return
end

if response == trueData then
    -- If the key is valid, load the script
   print("skibidi")
elseif response == falseData then
    -- If the key is invalid, kick the player
    game.Players.LocalPlayer:Kick("Invalid Key. Please try again.")
else
    -- Handle unexpected response
    game.Players.LocalPlayer:Kick("Unexpected response during key validation.")
end