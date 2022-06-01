void main()
{
	int x = 100, y = 21, z = 4, M;
	x = (x >> 3) | (x << (sizeof(x) * 8 - 1));
	y = (y >> 3) | (y << (sizeof(y) * 8 - 1));
	z = (y >> 3) | (x << (sizeof(z) * 8 - 1));
	M = (x*3+y)|z;

}
