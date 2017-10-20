Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.PoliceStations = {

  LSPD = {

    Blip = {
      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_NIGHTSTICK',       price = 200 },
      { name = 'WEAPON_COMBATPISTOL',     price = 300 },
      { name = 'WEAPON_ASSAULTSMG',       price = 1250 },
      { name = 'WEAPON_WEAPON_CARBINERIFLE',     price = 1500 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 600 },
      { name = 'WEAPON_STUNGUN',          price = 500 },
      { name = 'WEAPON_FLASHLIGHT',       price = 80 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 120 },
      { name = 'WEAPON_FLAREGUN',         price = 60 },
      { name = 'WEAPON_STICKYBOMB',       price = 250 },
      { name = 'GADGET_PARACHUTE',        price = 300 },
    },

        AuthorizedVehicles = {
	  { name = 'sheriff',  label = 'Ford Taurus 2013' },
      { name = 'sheriff2', label = 'Dodge Charger 2016' },
	  { name = 'pranger', label = 'Tahoe' },
	  { name = 'policeold2', label = 'Charger Autoroutier' },
	  { name = 'sheriff3', label = 'SUPERVISEUR' },
      { name = 'police4', label = 'Véhicule Banalisé' },
      { name = 'policeb', label = 'Moto' },
      { name = 'corspeedo', label = 'Van de transport' },
    },

    Cloakrooms = {
      { x = 1856.133, y = 3688.549, z = 34.267 },
    },

    Armories = {
      { x = 1848.5108, y = 3690.2890, z = 34.267 },
    },

    Vehicles = {
      {
        Spawner    = { x = 1854.753, y = 3678.6478, z = 33.807 },
        SpawnPoint = { x = 1850.7403, y = 3674.10, z = 33.771 },
        Heading    = 180.0,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 466.477, y = -982.819, z = 42.691 },
        SpawnPoint = { x = 450.04, y = -981.14, z = 42.691 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 1847.478, y = 3671.650, z = 33.699 },
   

    BossActions = {
      { x = 448.417, y = -973.208, z = 29.689 }
    },

  },

}
