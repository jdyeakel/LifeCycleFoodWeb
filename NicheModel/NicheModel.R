library(igraph)

#The number of prey species
N <- 100

#Define niche values for each species
nv <- runif(N)
#Define connectance
C = 0.02
#Define adjacency matrix
adj_m <- matrix(0,N,N)

disconnected <- TRUE
num_prey <- numeric(N)

#find the basal species (with lowest niche value)
basal <- min(nv)
basal_pos <- which(nv == basal)
#The basal species has no prey
num_prey[basal_pos] <- NA

while (disconnected == TRUE) {
  
  #which species have no interactions?
  empty <- which(num_prey==0)

  #Loop over each species to determine range of prey
  for (i in empty) {
    
    #The niche value of species i
    n <- nv[i]
    
    #Define the prey range
    alpha <- 1
    beta <- (alpha/(2*C)) - alpha
    r <- rbeta(1,alpha,beta)*n
    
    #Define the center of the prey range
    r1 <- min(r/2,n)
    r2 <- max(r/2,n)
    c <- runif(1,r1,r2)
    
    max_width <- c+(r/2)
    min_width <- c-(r/2)
    
    
    #Which species fall within this range?
    #For each species that does, draw link in adjacency matrix
    num_prey[i] <- 0
    for (j in 1:N) {
      if ((nv[j] < max_width) && (nv[j] > min_width)) {
        #adj_m[i,j] <- 1
        adj_m[j,i] <- 1 #arrow points along trophic flow
        num_prey[i] <- num_prey[i] + 1
      }
    }
    
    
  }
  
  #Is the food web disconnected?
  #rsums <- apply(adj_m,1,sum)
  if (length(which(num_prey == 0)) > 0) {
    disconnected <- TRUE
    
    #remove disconnected species
    rm_sp <- which(num_prey == 0)
    num_rm <- length(rm_sp)
    
    #update niche axis with new values for disconnected species
    new_nv <- runif(N)
    for (j in rm_sp) {
      nv[j] <- new_nv[j]
    }
    
  } else {
    disconnected <- FALSE
  }
  
  
}

#Build graph object
g <- graph.adjacency(adj_m, mode = "directed")
#plot(g,layout=layout.reingold.tilford(g,root=basal_pos,flip.y=FALSE),vertex.size=5)

#Assign node coordinates; y-axis is the niche value (trophic level increases across y-axis)
coords <- cbind(runif(N),nv)
plot(g,layout=coords,vertex.size=5,edge.arrow.size=0.4,main=ecount(g)/N^2,vertex.label=NA)


