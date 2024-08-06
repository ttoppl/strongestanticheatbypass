local runservice = game:GetService("RunService")

function esp(part, text)
    local itemesp = Drawing.new("Text")
    itemesp.Visible = false
    itemesp.Center = true
    itemesp.Outline = true
    itemesp.Font = 2
    itemesp.Color = Color3.fromRGB(255,255,255)
    itemesp.Size = 13

    local renderstepped
    renderstepped = runservice.RenderStepped:Connect(function()
        if part then
            local Pos, onscreen = game.Workspace.CurrentCamera:WorldToViewportPoint(part.Position)
            if onscreen then
                itemesp.Position = Vector2.new(Pos.X, Pos.Y)
                itemesp.Text = text
                itemesp.Visible = true
            else
                itemesp.Visible = false
            end
        else
            renderstepped:Disconnect()
            itemesp.Visible = false
            itemesp:remove()
        end
    end)
end

for _,v in ipairs(game.workspace:GetDescendants()) do
    if v:IsA("BasePart") then
        esp(v, v.Name)
    end
end
