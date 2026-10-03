local url = "https://raw.githubusercontent.com/helloguyswelcometoanewvideo/musics-foruse-someday/main/ladancinamuchodance.mp3"
local file = "ladancinamuchodance.mp3"


if not isfile(file) then
	local data = game:HttpGet(url)
	if #data >= 1000 then
		writefile(file, data)
	end
end

game.StarterGui:SetCore("SendNotification",{
    Title = "loading..",
    Text = "now dance like a guy knows how to dance, Z,X,C do the hit every beat, P to make the dance go fuck himself",
    Duration = 15
})

wait(3)

local sound = Instance.new("Sound")
sound.SoundId = getcustomasset(file)
sound.Volume = 2
sound.Looped = true
sound.Parent = game:GetService("SoundService")


local function anim2track(asset_id)
	local objs = game:GetObjects(asset_id)
	for i = 1, #objs do
		if objs[i]:IsA("Animation") then
			return objs[i].AnimationId
		end
	end
	return asset_id
end


local function getHumanoid()
	local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
	return char:WaitForChild("Humanoid")
end


local animid = anim2track("rbxassetid://129991743366120")
local animation = Instance.new("Animation")
animation.AnimationId = animid

local anim2id = anim2track("rbxassetid://103108681887836")
local animation2 = Instance.new("Animation")
animation2.AnimationId = anim2id

local anim3id = anim2track("rbxassetid://112931882473990")
local animation3 = Instance.new("Animation")
animation3.AnimationId = anim3id

local track
local function loadAnim()
	local humanoid = getHumanoid()
	track = humanoid:LoadAnimation(animation)
	track.Priority = Enum.AnimationPriority.Movement
end

local track2
local function loadAnim2()
    local humanoid = getHumanoid()
    track2 = humanoid:LoadAnimation(animation2)
    track2.Priority = Enum.AnimationPriority.Movement
end

local track3
local function loadAnim3()
    local humanoid = getHumanoid()
    track3 = humanoid:LoadAnimation(animation3)
    track3.Priority = Enum.AnimationPriority.Movement
end

loadAnim()
loadAnim2()
loadAnim3()

local playing = true
sound:Play()
if track then track:Play() end


game.Players.LocalPlayer.CharacterAdded:Connect(function()
	task.wait(1)
	loadAnim()
	if playing and track then track:Play() end
end)


local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end
	if input.KeyCode == Enum.KeyCode.P then
		playing = not playing
		if playing then
			sound:Play()
			if track then track:Play() end

		else
			sound:Stop()
			if track then track:Stop() end
            if track2 then track2:Stop() end
            if track3 then track3:Stop() end
		end
	end
end)

UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.X then
            doingit = not doingit
            if doingit then
                if track then track:Stop() end
                if track2 then track2:Play() end
                if track3 then track3:Stop() end
            else
                if track2 then track2:Stop() end
                if track3 then track3:Stop() end
            end
        end
end)

UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.C then
            doingitagain = not doingitagain
            if doingitagain then
                if track then track:Stop() end
                if track2 then track2:Stop() end
                if track3 then track3:Play() end
            else
                if track3 then track3:Stop() end
                if track2 then track2:Stop() end
            end
        end
end)

UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.Z then
            doingitagaina = not doingitagaina
            if doingitagaina then
                if track then track:Play() end
                if track2 then track2:Stop() end
                if track3 then track3:Stop() end
            else
                if track then track:Stop() end
            end
        end
end)