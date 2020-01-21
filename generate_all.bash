git clean -fdX
find . -type f -name "*.render.scad" -print0 |
xargs -P0 -0 -n1 bash ./generate_one.bash ||
exit 1
