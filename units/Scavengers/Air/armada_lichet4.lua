return {
	armada_lichet4 = {
		acceleration = 0.15,
		blocking = false,
		maxdec = 0.05,
		energycost = 240000,
		metalcost = 18000,
		buildpic = "armada_liche.DDS",
		buildtime = 240000,
		canfly = true,
		canmove = true,
		category = "ALL WEAPON NOTSUB VTOL NOTHOVER",
		collide = false,
		cruisealtitude = 600,
		explodeas = "hugeexplosiongeneric",
		firestate = 0,
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		maxacc = 0.1075,
		maxaileron = 0.01325,
		maxbank = 0.3,
		health = 10000,
		maxelevator = 0.0095,
		maxpitch = 0.3,
		maxrudder = 0.005,
		maxslope = 10,
		speed = 180.0,
		maxwaterdepth = 0,
		noautofire = false,
		nochasecategory = "VTOL",
		objectname = "Units/scavboss/armada_licheT4.s3o",
		script = "Units/armada_liche.cob",
		seismicsignature = 0,
		selfdestructas = "hugeExplosionGenericSelfd",
		sightdistance = 455,
		speedtofront = 0.06767,
		turnradius = 256,
		turnrate = 256,
		usesmoothmesh = true,
		wingangle = 0.062,
		wingdrag = 0.135,
		customparams = {
			unitgroup = 'weapon',
			lumamult = "1.7",
			model_author = "Flaka",
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armada_aircraft/t2",
			techlevel = 3,
		},
		sfxtypes = {
			crashexplosiongenerators = {
				[1] = "crashing-large",
				[2] = "crashing-large",
				[3] = "crashing-large2",
				[4] = "crashing-large3",
				[5] = "crashing-large3",
			},
			pieceexplosiongenerators = {
				[1] = "airdeathceg3",
				[2] = "airdeathceg4",
				[3] = "airdeathceg2",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "vtolarmv",
			},
			select = {
				[1] = "vtolarac",
			},
		},
		weapondefs = {
			nuclear_missile = {
				areaofeffect = 1280,
				avoidfeature = false,
				avoidfriendly = false,
				cegtag = "NUKETRAIL",
				collideenemy = false,
				collidefeature = false,
				collidefriendly = false,
				commandfire = true,
				craterareaofeffect = 1280,
				craterboost = 2.4,
				cratermult = 1.2,
				edgeeffectiveness = 0.45,
				explosiongenerator = "custom:newnuke",
				firestarter = 100,
				flighttime = 400,
				impulseboost = 0.5,
				impulsefactor = 0.5,
				model = "crblmssl.s3o",
				name = "Intercontinental ballistic nuclear warhead",
				range = 1200,
				reloadtime = 120,
				smoketrail = true,
				smokePeriod = 10,
				smoketime = 130,
				smokesize = 28,
				smokecolor = 0.85,
				smokeTrailCastShadow = true,
				soundhit = "nukearm",
				soundhitwet = "nukewater",
				soundstart = "nukelaunch",
				soundhitwetvolume = 53,
				soundstartvolume = 20,
				texture1 = "null",
				texture2 = "railguntrail",
				texture3 = "null",
				tolerance = 4000,
				turnrate = 5500,
				weaponacceleration = 100,
				weapontimer = 5.5,
				weapontype = "MissileLauncher",
				weaponvelocity = 1600,
				damage = {
					commanders = 2500,
					default = 9500,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "nuclear_missile",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
