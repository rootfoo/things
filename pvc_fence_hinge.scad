include <scale.scad>
$fn=50;

module hinge(h=20, sep=2, id1=26.67, id2=8, t=4){

  // scale the holes to account for PLA contraction 
  id1 = vscale(id1)-0.45; 
  id2 = vscale(id2)-0.13; 
  od1=id1+t;
  od2=id2+t;
  w=id2;
  clen = sep + od1/2 + od2/2;
  
  difference(){
    union(){
      cylinder(h,d=od1);
      translate([clen,0,0]){cylinder(h/2,d=od2);}
      translate([0,-w/2,0]){cube([clen,w,h/2]);}
    }
    cylinder(h,d=id1);
    translate([clen,0,0]){cylinder(h,d=id2);}
  }
}

module bolt(h=45, d=8, t=4){
  cylinder(h+t,d=d);
  cylinder(h=t,d=d+t);
}


module all(){
hinge();
translate([0,35,0]){hinge();}
translate([50,0,0]){hinge();}
translate([50,35,0]){hinge();}
translate([0,-25,0]){bolt();}

}

all();
