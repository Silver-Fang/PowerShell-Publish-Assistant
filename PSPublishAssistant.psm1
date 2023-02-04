enum ExecutionPolicy {
	Unrestricted
	RemoteSigned
	AllSigned
	Restricted
	Default
	Bypass
	Undefined
}
enum Scope {
	Process
	CurrentUser
	LocalMachine
	UserPolicy
	MachinePolicy
}
function New-ExecutionPolicyWarpper {
	param(
		[Parameter(Mandatory, Position = 0)]
		[string]$InputPs1,
		[string]$OutputBat = [System.IO.Path]::GetFileNameWithoutExtension($InputPs1) + ".bat",
		[ExecutionPolicy]$ExecutionPolicy = [ExecutionPolicy]::Unrestricted,
		[Scope]$Scope
	)
	if($Scope)
	{
		New-Item -Path $OutputBat -ItemType File -Value 'powershell "Start-Process powershell -Verb RunAs -ArgumentList ''Set-ExecutionPolicy Unrestricted'''+`n+$InputPs1+'"'
	}
}