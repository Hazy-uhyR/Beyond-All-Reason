return {
	chickena2 = {
		acceleration = 0.414,
		airsightdistance = 1800,
		autoheal = 25,
		bmcode = "1",
		brakerate = 0.46,
		buildcostenergy = 3520,
		buildcostmetal = 302,
		builder = false,
		buildpic = "chickens/chickena2.DDS",
		buildtime = 30000,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = "1",
		capturable = false,
		category = "BOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE CHICKEN EMPABLE",
		collisionvolumeoffsets = "0 10 2",
		collisionvolumescales = "37 55 90",
		collisionvolumetype = "box",
		defaultmissiontype = "Standby",
		explodeas = "BIGBUG_DEATH",
		footprintx = 3,
		footprintz = 3,
		leavetracks = true,
		maneuverleashlength = "640",
		mass = 200000,
		maxdamage = 44000,
		maxslope = 18,
		maxvelocity = 1,
		maxwaterdepth = 0,
		movementclass = "CHICKBIG2HOVER",
		noautofire = false,
		nochasecategory = "VTOL",
		objectname = "Chickens/chickena2.s3o",
		onlytargetcategory2 = "VTOL",
		script = "Chickens/chickena2.cob",
		seismicsignature = 0,
		selfdestructas = "BIGBUG_DEATH",
		side = "THUNDERBIRDS",
		sightdistance = 600,
		smoothanim = true,
		steeringmode = "2",
		tedclass = "BOT",
		trackoffset = 7,
		trackstrength = 3,
		trackstretch = 1,
		tracktype = "ChickenTrack",
		trackwidth = 38,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 920,
		unitname = "chickena2",
		upright = false,
		waterline = 40,
		workertime = 0,
		customparams = {
			maxrange = "200",
			subfolder = "other/chickens",
			model_author = "KDR_11k, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_l_normals.png",
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:blood_spray",
				[2] = "custom:blood_explode",
				[3] = "custom:dirt",
				[4] = "custom:blob_fire",
			},
			pieceexplosiongenerators = {
				[1] = "blood_spray",
				[2] = "blood_spray",
				[3] = "blood_spray",
			},
		},
		weapondefs = {
			aaweapon = {
				areaofeffect = 128,
				avoidfriendly = false,
				cegtag = "sporetrail-large",
				collidefriendly = false,
				craterboost = 0,
				cratermult = 0,
				cameraShake = 700,
				dance = 20,
				edgeeffectiveness = 0.35,
				explosiongenerator = "custom:genericshellexplosion-huge-bomb",
				firestarter = 0,
				flighttime = 20,
				firesubmersed = true,
				impulseboost = 0,
				impulsefactor = 0.4,
				interceptedbyshieldtype = 4,
				metalpershot = 0,
				model = "SimpleFlareXL.s3o",
				name = "Deadly Defensive Spores",
				noselfdamage = true,
				range = 2000,
				reloadtime = 15,
				smoketrail = true,
				smokePeriod = 10,
				smoketime = 45,
				smokesize = 10.5,
				smokecolor = 1.0,
				soundhit = "spore_explo",
				soundstart = "spore_xl",
				soundstartvolume = 9,
				startvelocity = 200,
				texture1 = "orangenovaexplo",
				texture2 = "sporetrail_xl",
				tolerance = 60000,
				tracks = true,
				trajectoryheight = 2,
				turnrate = 60000,
				turret = true,
				waterweapon = true,
				weaponacceleration = 40,
				weapontype = "MissileLauncher",
				weaponvelocity = 475,
				wobble = 32000,
				damage = {
					default = 1000,
				},
				customparams = {
					expl_light_life_mult = 1.5,
					expl_light_radius_mult = 1.3,
					expl_light_mult = 1.25,
					light_radius_mult = "0.85",
					light_mult = 3,
					light_color = "1 0.55 0.05",
				},
			},
			weapon = {
				areaofeffect = 42,
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.3,
				explosiongenerator = "custom:chickenspike-large-sparks-burn",
				firesubmersed = true,
				impulseboost = 1,
				impulsefactor = 1,
				interceptedbyshieldtype = 0,
				model = "Chickens/spike.s3o",
				name = "Claws",
				noselfdamage = true,
				range = 400,
				reloadtime = 0.8,
				soundstart = "smallchickenattack",
				targetborder = 1,
				tolerance = 5000,
				turret = true,
				waterweapon = true,
				weapontype = "Cannon",
				weaponvelocity = 1500,
				damage = {
					default = 550,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "WEAPON",
				maindir = "0 0 1",
				maxangledif = 125,
				--onlytargetcategory = "NOTAIR",
			},
			[2] = {
				badtargetcategory = "NOTAIR",
				def = "AAWEAPON",
			},
		},
	},
}
