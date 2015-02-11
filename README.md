# LifeCycleFoodWeb

From Williams et al. 2000:
Williams, R. J., & Martinez, N. D. (2000). Simple rules yield complex food webs. Nature, 404(6774), 180–183. doi:10.1038/35004572


Each of S species (for example, S = 6, each shown as an inverted triangle) is assigned a `niche value' parameter (ni) drawn uniformly from
the interval [0,1]. Species i consumes all species falling in a range (ri) that is placed by uniformly drawing the centre of the range (ci) from [ri/2, ni]. This permits looping and
cannibalism by allowing up to half of ri to include values > ni. The size of ri is assigned by using a beta function to randomly draw values from [0,1] whose expected value is 2C and
then multiplying that value by n [expected E(n ) = 0.5] to obtain the desired C. A beta distribution with a = 1 has the form f(x|1, b) = b(1-x)^(b-1), for  0 < x < 1, 0 otherwise, and E(X) = 1/(1+b). In this case, x = 1-(1-y)^(1/b) is a random variable from the beta distribution if y is a uniform random variable and b is chosen to obtain the desired expected value. We chose this form because of its simplicity and ease of calculation. The fundamental generality of species i is measured by ri. The number of species falling within ri measures realized generality. Occasionally, model-generated webs contain completely discon- nected species or trophically identical species. Such species are eliminated and replaced until the web is free of such species. The species with the smallest ni has rI = 0 so that every web has at least one basal species.
