-- Import required services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Create the UI
local function createUI()
    local UI = Instance.new("ScreenGui")
    UI.Name = "YUSAKIHUB"
    UI.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create the main frame
    local Frame = Instance.new("Frame")
    Frame.Name = "Main Frame"
    Frame.Size = UDim2.new(0, 300, 0, 250)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -125)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.new(0, 0, 0)
    Frame.BackgroundTransparency = 0.5
    Frame.Parent = UI

    -- Create the title label
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "Title Label"
    TitleLabel.Size = UDim2.new(0, 200, 0, 40)
    TitleLabel.Position = UDim2.new(0, 0, 0, 0)
    TitleLabel.Text = "YUSAKIHUB"
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.FontSize = Enum.FontSize.Size36
    TitleLabel.TextColor3 = Color3.new(1, 1, 1)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Parent = Frame

    -- Create the fly button
    local FlyButton = Instance.new("TextButton")
    FlyButton.Name = "Fly Button"
    FlyButton.Size = UDim2.new(0, 100, 0, 40)
    FlyButton.Position = UDim2.new(0, 10, 0, 50)
    FlyButton.Text = "Toggle Fly"
    FlyButton.Font = Enum.Font.SourceSans
    FlyButton.FontSize = Enum.FontSize.Size18
    FlyButton.TextColor3 = Color3.new(1, 1, 1)
    FlyButton.BackgroundTransparency = 1
    FlyButton.Parent = Frame

    -- Create the mobile button
    local MobileButton = Instance.new("TextButton")
    MobileButton.Name = "Mobile Button"
    MobileButton.Size = UDim2.new(0, 100, 0, 40)
    MobileButton.Position = UDim2.new(0, 10, 0, 100)
    MobileButton.Text = "Mobile Mode"
    MobileButton.Font = Enum.Font.SourceSans
    MobileButton.FontSize = Enum.FontSize.Size18
    MobileButton.TextColor3 = Color3.new(1, 1, 1)
    MobileButton.BackgroundTransparency = 1
    MobileButton.Parent = Frame

    -- Create the walkspeed slider
    local WalkspeedSlider = Instance.new("Slider")
    WalkspeedSlider.Name = "Walkspeed Slider"
    WalkspeedSlider.Size = UDim2.new(0, 200, 0, 20)
    WalkspeedSlider.Position = UDim2.new(0, 10, 0, 150)
    WalkspeedSlider.Minimum = 16
    WalkspeedSlider.Maximum = 100
    WalkspeedSlider.Value = 16
    WalkspeedSlider.Parent = Frame

    -- Create the modify walkspeed button
    local WalkspeedModifyButton = Instance.new("TextButton")
    WalkspeedModifyButton.Name = "Walkspeed Modify Button"
    WalkspeedModifyButton.Size = UDim2.new(0, 100, 0, 40)
    WalkspeedModifyButton.Position = UDim2.new(0, 10, 0, 180)
    WalkspeedModifyButton.Text = "Modify Walkspeed"
    WalkspeedModifyButton.Font = Enum.Font.SourceSans
    WalkspeedModifyButton.FontSize = Enum.FontSize.Size18
    WalkspeedModifyButton.TextColor3 = Color3.new(1, 1, 1)
    WalkspeedModifyButton.BackgroundTransparency = 1
    WalkspeedModifyButton.Parent = Frame

    -- Create the bring players button
    local BringPlayersButton = Instance.new("TextButton")
    BringPlayersButton.Name = "Bring Players Button"
    BringPlayersButton.Size = UDim2.new(0, 100, 0, 40)
    BringPlayersButton.Position = UDim2.new(0, 150, 0, 50)
    BringPlayersButton.Text = "Bring Players"
    BringPlayersButton.Font = Enum.Font.SourceSans
    BringPlayersButton.FontSize = Enum.FontSize.Size18
    BringPlayersButton.TextColor3 = Color3.new(1, 1, 1)
    BringPlayersButton.BackgroundTransparency = 1
    BringPlayersButton.Parent = Frame

    return UI, FlyButton, WalkspeedSlider, WalkspeedModifyButton, BringPlayersButton
end

-- Fly functionality
local function toggleFly(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end

    local flying = false
    local bodyVelocity = Instance.new("BodyVelocity")

    RunService.RenderStepped:Connect(function()
        if flying then
            bodyVelocity.Velocity = Vector3.new(0, 50, 0)
            bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
            bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
        else
            bodyVelocity:Destroy()
        end
    end)

    return function()
        flying = not flying
        humanoid.PlatformStand = flying
    end
end

-- Initialize UI and functionalities
local UI, FlyButton, WalkspeedSlider, WalkspeedModifyButton, BringPlayersButton = createUI()
UI.Enabled = true

-- Event listeners
FlyButton.MouseButton1Click:Connect(function()
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local toggleFlyFunc = toggleFly(character)
    toggleFlyFunc() -- Call the function to toggle flying
end)

MobileButton.MouseButton1Click:Connect(function()
    -- Implement mobile mode functionality if necessary
end)

WalkspeedModifyButton.MouseButton1Click:Connect(function()
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = WalkspeedSlider.Value
end)

BringPlayersButton.MouseButton1Click:Connect(function()
    local localPlayerPosition = Players.LocalPlayer.Character.HumanoidRootPart.Position
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            player.Character.HumanoidRootPart.Position = localPlayerPosition
        end
    end
end)
