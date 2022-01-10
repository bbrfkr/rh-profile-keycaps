include <./includes.scad>

$stem_type = "rounded_cherry";
$stem_support_type = "disable";
$support_type = "flat";

// stemの穴サイズ。ここを変えてみる
$stem_slop = 0.35;

// たねやつさん推奨
$cherry_bevel = false;

// legendのフォントサイズ
$font_size = 3;

module smooth(r=1)
{
    $fn=64;
    offset(r=r)
    offset(r=-r)
    children();
}

$fn = 128;

difference(){
    hull(){
        translate([0,0,9]) sphere(9);
        linear_extrude(0.01) {
            smooth() projection(){
                cube([18,18,0.01], center=true);
            }
        }
    }
    hull() {
        translate([0,0,3.5]) linear_extrude(0.1) smooth() projection(){
            cube([14,14,0.01], center=true);
        }
        linear_extrude(0.1) smooth() projection(){
            cube([15,15,0.01], center=true);
        }
    }
}
rounded_cherry_stem(3.6, $stem_slop);