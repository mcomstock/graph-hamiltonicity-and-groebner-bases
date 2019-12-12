-- Changing a few values in this file speeds up the process of finding the
-- Groebner basis of a graph ideal

-- The variables of the polynomial ring
VARIABLES = [x_1,x_2,x_3,x_4,x_5,x_6];
-- The monomial ordering we want to use
ORDER = Lex;

-- Our field is the quotient ring of rationals and the relevant cyclotomic polynomial
R = QQ[z] / (z^2 - z + 1);
R = R append(VARIABLES, MonomialOrder=>ORDER);

-- The polynomials that generate the graph ideal
IDEAL_GEN = {x_1^6 - 1, x_2^6 - 1, x_3^6 - 1, x_4^6 - 1, x_5^6 - 1, x_6^6 - 1,
	     (z*x_1 - x_2)*(z*x_1 - x_3),
	     (z*x_2 - x_3)*(z*x_2 - x_4),
	     (z*x_3 - x_4)*(z*x_3 - x_5),
	     (z*x_4 - x_5)*(z*x_4 - x_1),
	     (z*x_5 - x_6),
	     (z*x_6 - x_1)*(z*x_6 - x_2)};

idealOfGraph = ideal IDEAL_GEN;
--graphBasis = flatten entries gens gb(idealOfGraph);
--print toString graphBasis;
print getChangeMatrix gb(idealOfGraph, ChangeMatrix=>true);


