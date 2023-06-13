function Tween(CFrame)
    Distance = (CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 250 then
        Speed = 600
    elseif Distance < 500 then
        Speed = 500
    elseif Distance < 1000 then
        Speed = 400
    elseif Distance >= 1000 then
        Speed = 250
    end
    tween =
        game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
        {CFrame = CFrame}
    ):Play()

    return Distance / Speed
end
local function Click()
    game:GetService "VirtualUser":CaptureController()
    game:GetService "VirtualUser":Button1Down(Vector2.new(1280, 672))
end

pcall(
    function()
        while wait(0.1) do
            for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                for _, v2 in pairs(game.Workspace.Enemies:GetChildren()) do
                    if
                        v.Name == "Bandit [Lv. 5]" and v2.Name == "Bandit [Lv. 5]" and v.Humanoid.Health >= 1 and
                            v2.Humanoid.Health >= 1
                     then
                        Distance = (v2.HumanoidRootPart.CFrame.Position - v.HumanoidRootPart.Position).Magnitude
                        print(Distance)
                        if Distance <= 80 then
                            if Distance < 250 then
                                Speed = 600
                            elseif Distance < 500 then
                                Speed = 500
                            elseif Distance < 1000 then
                                Speed = 400
                            elseif Distance >= 1000 then
                                Speed = 250
                            end
                            v.Humanoid:ChangeState(11)
                            v2.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.CanCollide = false
                            v2.Humanoid:ChangeState(11)
                            tween =
                                game:GetService("TweenService"):Create(
                                v.HumanoidRootPart,
                                TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
                                {CFrame = v2.HumanoidRootPart.CFrame}
                            ):Play()
                            Tween(v.HumanoidRootPart.CFrame)
                            Click()
                        end
                    end
                end
            end
        end
    end
)
