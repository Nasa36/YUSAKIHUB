-- Import required modules
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Create the UI
local UI = Instance.new("ScreenGui")
UI.Name = "YUSAKIHUB"
UI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the main frame
local Frame = Instance.new("Frame")
Frame.Name = "Main Frame"
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1) -- Cor de fundo para visibilidade
Frame.BackgroundTransparency = 0.3
Frame.Parent = UI

-- Create the title label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title Label"
TitleLabel.Size = UDim2.new(0, 200, 0, 20)
TitleLabel.Position = UDim2.new(0, 50, 0, 10)
TitleLabel.Text = "YUSAKIHUB"
TitleLabel.Font = Enum.Font.SourceSans
TitleLabel.TextSize = 24
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Parent = Frame

-- Create the fly button
local FlyButton = Instance.new("TextButton")
FlyButton.Name = "Fly Button"
FlyButton.Size = UDim2.new(0, 100, 0, 30)
FlyButton.Position = UDim2.new(0, 20, 0, 50)
FlyButton.Text = "Fly"
FlyButton.Font = Enum.Font.SourceSans
FlyButton.TextSize = 18
FlyButton.TextColor3 = Color3.new(1, 1, 1)
FlyButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
FlyButton.Parent = Frame

-- Create the mobile button
local MobileButton = Instance.new("TextButton")
MobileButton.Name = "Mobile Button"
MobileButton.Size = UDim2.new(0, 100, 0, 30)
MobileButton.Position = UDim2.new(0, 20, 0, 90)
MobileButton.Text = "Mobile"
MobileButton.Font = Enum.Font.SourceSans
MobileButton.TextSize = 18
MobileButton.TextColor3 = Color3.new(1, 1, 1)
MobileButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
MobileButton.Parent = Frame

-- Create a simple slider using Frame and TextButton
local SliderFrame = Instance.new("Frame")
SliderFrame.Name = "Walkspeed Slider"
SliderFrame.Size = UDim2.new(0, 200, 0, 20)
SliderFrame.Position = UDim2.new(0, 50, 0, 130)
SliderFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
SliderFrame.Parent = Frame

local SliderButton = Instance.new("TextButton")
SliderButton.Name = "SliderButton"
SliderButton.Size = UDim2.new(0, 20, 1, 0)
SliderButton.Position = UDim2.new(0, 0, 0, 0)
SliderButton.Text = ""
SliderButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
SliderButton.Parent = SliderFrame

-- Function to update walkspeed
local function updateWalkspeed(value)
    local player = Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = value
    end
end

-- Make the slider draggable
SliderButton.MouseButton1Down:Connect(function()
    local mouseMove, mouseUp
    mouseMove = UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            local newX = math.clamp(input.Position.X - SliderFrame.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X - SliderButton.AbsoluteSize.X)
            SliderButton.Position = UDim2.new(0, newX, 0, 0)
            local percentage = newX / (SliderFrame.AbsoluteSize.X - SliderButton.AbsoluteSize.X)
            local walkspeed = math.floor(percentage * 100)
            updateWalkspeed(walkspeed)  -- Update walk speed based on slider position
        end
    end)

    mouseUp = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            mouseMove:Disconnect()
            mouseUp:Disconnect()
        end
    end)
end)

-- Create the walkspeed modify button
local WalkspeedModifyButton = Instance.new("TextButton")
WalkspeedModifyButton.Name = "Walkspeed Modify Button"
WalkspeedModifyButton.Size = UDim2.new(0, 100, 0, 30)
WalkspeedModifyButton.Position = UDim2.new(0, 150, 0, 170)
WalkspeedModifyButton.Text = "Modify Walkspeed"
WalkspeedModifyButton.Font = Enum.Font.SourceSans
WalkspeedModifyButton.TextSize = 18
WalkspeedModifyButton.TextColor3 = Color3.new(1, 1, 1)
WalkspeedModifyButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
WalkspeedModifyButton.Parent = Frame

-- Create the bring players button
local BringPlayersButton = Instance.new("TextButton")
BringPlayersButton.Name = "Bring Players Button"
BringPlayersButton.Size = UDim2.new(0, 100, 0, 30)
BringPlayersButton.Position = UDim2.new(0, 20, 0, 170)
BringPlayersButton.Text = "Bring Players"
BringPlayersButton.Font = Enum.Font.SourceSans
BringPlayersButton.TextSize = 18
BringPlayersButton.TextColor3 = Color3.new(1, 1, 1)
BringPlayersButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
BringPlayersButton.Parent = Frame

-- Add event listeners
FlyButton.MouseButton1Click:Connect(function()
    -- Fly script goes here
end)

MobileButton.MouseButton1Click:Connect(function()
    -- Mobile script goes here
end)

WalkspeedModifyButton.MouseButton1Click:Connect(function()
    -- Modify walkspeed script goes here
end)

BringPlayersButton.MouseButton1Click:Connect(function()
    -- Bring players script goes here
end)

-- Show the UI
UI.Enabled = true
