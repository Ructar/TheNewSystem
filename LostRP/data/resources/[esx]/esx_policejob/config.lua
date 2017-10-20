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
      { name = 'WEAPON_NIGHTSTICK',       price = 0 },
      { name = 'WEAPON_COMBATPISTOL',     price = 0 },
      { name = 'WEAPON_ASSAULTSMG',       price = 0 },
      { name = 'WEAPON_WEAPON_CARBINERIFLE',     price = 0 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 0 },
      { name = 'WEAPON_STUNGUN',          price = 0 },
      { name = 'WEAPON_FLASHLIGHT',       price = 0 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 0 },
      { name = 'WEAPON_FLAREGUN',         price = 0 },
      { name = 'WEAPON_STICKYBOMB',       price = 0 },
      { name = 'GADGET_PARACHUTE',        price = 0 },
    },

        AuthorizedVehicles = {
      { name = 'police',  label = 'Crown Vic 2011' },
	  { name = 'police4',  label = 'Ford Taurus 2013' },
      { name = 'police2', label = 'Dodge Charger 2016' },
	  { name = 'police8', label = 'Chevy Impala 2013' },
      { name = 'police3', label = 'Ford Explorer 2013' },
	  { name = 'police5', label = 'Ford Explorer 2016' },
      { name = 'fbi', label = 'Véhicule Banalisé' },
	  { name = 'fbi2', label = 'SUV Banalisé' },
      { name = 'policeb', label = 'Moto' },
      { name = 'policet', label = 'Van de transport' },
    },

    Cloakrooms = {
      { x = 452.600, y = -993.306, z = 29.750 },
    },

    Armories = {
      { x = 451.699, y = -980.356, z = 29.689 },
    },

    Vehicles = {
      {
        Spawner    = { x = 454.69, y = -1017.4, z = 27.430 },
        SpawnPoint = { x = 438.42, y = -1018.3, z = 27.757 },
        Heading    = 90.0,
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
      { x = 462.74, y = -1014.4, z = 27.065 },
      { x = 462.40, y = -1019.7, z = 27.104 },
    },

    BossActions = {
      { x = 448.417, y = -973.208, z = 29.689 }
    },

  },

}
