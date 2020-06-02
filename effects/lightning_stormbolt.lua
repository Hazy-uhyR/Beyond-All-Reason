-- lightning_stormbolt

return {
  ["lightning_stormbolt"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.12,
      flashsize          = 40,
      ttl                = 3,
      color = {
        [1]  = 0.66,
        [2]  = 0.66,
        [3]  = 1,
      },
    },
    lightningballs = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater		 = true,
      properties = {
        airdrag            = 1,
        colormap           = [[0 0 0 0.01 1 1 1 0.01 0 0 0 0.01]],
        directional        = true,
        emitrot            = 80,
        emitrotspread      = 0,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 3,
        particlelifespread = 0,
        particlesize       = 1.8,
        particlesizespread = 7.5,
        particlespeed      = 0.01,
        particlespeedspread = 0,
        pos                = [[-10 r10, 1.0, -10 r10]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[lightbw]],
      },
    },
  },
  ["lightning_stormbolt_small"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.08,
      flashsize          = 25,
      ttl                = 2,
      color = {
        [1]  = 0.66,
        [2]  = 0.66,
        [3]  = 1,
      },
    },
    lightningballs = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater		 = true,
      properties = {
        airdrag            = 1,
        colormap           = [[0 0 0 0.01 1 1 1 0.01 0 0 0 0.01]],
        directional        = true,
        emitrot            = 80,
        emitrotspread      = 0,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 3,
        particlelifespread = 0,
        particlesize       = 1.5,
        particlesizespread = 4.5,
        particlespeed      = 0.01,
        particlespeedspread = 0,
        pos                = [[-10 r10, 1.0, -10 r10]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[lightbw]],
      },
    },
  },
  ["lightning_stormbig"] = {
    groundflash = {
      circlealpha        = 1,
      circlegrowth       = 0,
      flashalpha         = 0.17,
      flashsize          = 80,
      ttl                = 15,
      color = {
        [1]  = 0.66,
        [2]  = 0.66,
        [3]  = 0.66,
      },
    },
    lightningballs = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater     = true,
      properties = {
        airdrag            = 1,
        colormap           = [[0 0 0 0.01   0.96 0.75 0.60 0.05   0.9 0.6 0.3 0.01   0 0 0 0.01]],
        directional        = true,
        emitrot            = 80,
        emitrotspread      = 120,
        emitvector         = [[1, 1, 1]],
        gravity            = [[0, 0, 0]],
        numparticles       = 1,
        particlelife       = 2,
        particlelifespread = 8,
        particlesize       = 9,
        particlesizespread = 100,
        particlespeed      = 0.03,
        particlespeedspread = 0,
        pos                = [[-10 r10, 1.0, -10 r10]],
        sizegrowth         = -0.2,
        sizemod            = 1.0,
        texture            = [[whitelightb]],
      },
    },
  },
  ["lightning_stormflares"] = {
    groundflash = {
      circlealpha        = 0.9,
      circlegrowth       = -0.05,
      flashalpha         = 0.20,
      flashsize          = 100,
      ttl                = 12,
      color = {
        [1]  = 0.76,
        [2]  = 0.76,
        [3]  = 0.76,
      },
    },
    lightningballs = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater     = true,
      properties = {
        airdrag            = 0.92,
        colormap           = [[0 0 0 0.01   0.9 0.7 0.6 0.015   0.9 0.6 0.3 0.01   0.6 0.4 0.15 0.005   0 0 0 0.01]],
        directional        = false,
        emitrot            = 80,
        emitrotspread      = 120,
        emitvector         = [[1, 1, 1]],
        gravity            = [[0, 0, 0]],
        numparticles       = 2,
        particlelife       = 11,
        particlelifespread = 16,
        particlesize       = 7,
        particlesizespread = 80,
        particlespeed      = 0.12,
        particlespeedspread = 0.32,
        pos                = [[-10 r25, 1.0, -10 r25]],
        sizegrowth         = -0.4,
        sizemod            = 1.0,
        texture            = [[flare1]],
      },
    },
  },
}

