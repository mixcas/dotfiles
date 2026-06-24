hs.hotkey.bind({ "cmd", "shift" }, ";", function()
  local wez = hs.application.find("WezTerm", true)
  if not wez then
    hs.application.launchOrFocus("WezTerm")
  elseif wez:isFrontmost() then
    wez:hide()
  else
    wez:activate()
  end
end)
