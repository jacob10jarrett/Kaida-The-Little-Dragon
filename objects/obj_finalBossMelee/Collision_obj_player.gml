other.hp -=1;
other.isStaggered = true;

other.hsp = 2;

if (x > other.x)	other.hsp = -2;
if (x <= other.x)	other.hsp = 2;

other.state = 5;
instance_destroy();
