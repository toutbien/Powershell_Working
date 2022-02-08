#Person class
class PersonClass{
	[String]$Name
	[Int]$Age
    [PetClass[]]$Pets
}

#Pet class
class PetClass{
    [String]$Name
    [Int]$Age
    [String]$Color
}

#Creating a list to hold the people using the PersonClass
$People = New-Object 'System.Collections.Generic.List[PSObject]'

#Creating a new person
$newPerson = [PersonClass]::new()
$newPerson.Name = "Roy Orbison"
$newPerson.Age = "24"

#Adding pets to the new person
for ($i = 0; $i -le 5; $i++){
    $newPet = [PetClass]::new()
    $newPet.Name = $i
    $newPet.Age = $i + 2
    $newPet.Color = "Brown"

    #Adding the pet to the new person
    $newPerson.Pets += $newPet
}

#Adding the new person to the people list
$People.Add($newPerson)