# This script contains the sequence of codes necessary for solving the full SR model 
# proposed by Cole et al.

library(deSolve)


SRmodel <- function(t, state, parameters){
  with(as.list(c(state, parameters)),{
    
    ddPR <- eta_pr*(PR - b_pr) + gamma1_pr*(EP - b_ep)
            + gamma2_pr*(PR - b_pr)*(EP - b_ep)
            + gamma3_pr*(EP - b_ep)*dPR # ddPR/dt
    ddEP <- eta_ep*(EP - b_ep) + gamma1_ep*(PR - b_pr)
            + gamma2_ep*(PR - b_pr)*(EP - b_ep)
            + gamma3_ep*(PR - b_pr)*dEP # ddPR/dt
    
    list(c(PR, EP, dPR, dEP))
    
  })
}

parameters <- c(b_pr = 1.409,
                b_ep = 6.189,
                eta_pr = -0.142,
                eta_ep = -0.246,
                gamma1_pr = 0.005,
                gamma1_ep = -0.077,
                gamma2_pr = 0.063,
                gamma2_ep = -0.098,
                gamma3_pr = 0.026,
                gamma3_ep = -0.003)

state <- c(PR = 1,
           EP = 1,
           dPR = 1,
           dEP = 1)

times <- seq(0, 100, length.out = 10001)

sol <- ode(func = SRmodel, y = state, times = times, parms = parameters)

## save to file

write.csv2(sol,file = "SRmodel.csv")

## plot

# window();
# plot.new()
# matplot(sol[,"time"], sol[,c("y", "z", "M")], type = "l")
# grid()
