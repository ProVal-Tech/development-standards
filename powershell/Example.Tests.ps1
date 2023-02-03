BeforeAll {
    $targetScript = "$PSScriptRoot\Example.ps1"
}
Describe 'Get-RandomNumberList' {
    It 'Returns 5 random numbers if not given a -Count' {
        $randomNumbers = & $targetScript -Start 1 -End 100
        $randomNumbers.Count | Should -Be 5
    }
    It 'Returns 10 random numbers if -Count is 10' {
        $randomNumbers = & $targetScript -Start 1 -End 100 -Count 10
        $randomNumbers.Count | Should -Be 10
    }
}