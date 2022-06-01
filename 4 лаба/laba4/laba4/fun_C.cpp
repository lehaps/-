#include <math.h>

extern "C" float fun_el(float z)
{
	float f = 0;

	f = fabs(1 / tan(z) - sin(z));

	return f;
}

