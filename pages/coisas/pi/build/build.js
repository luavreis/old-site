var tex;
var par;
var rc1;
var rc2;
var rH = 3;
var rW = 200;
var H = 100;
var ready = false;
function setup() {
    ready = false;
    par = select('#sketch-holder');
    var canvas = createCanvas(par.width - 30, H);
    canvas.parent(par);
    rectMode(RADIUS).frameRate(60);
    rc1 = color(172, 125, 98);
    rc2 = color(152, 105, 78);
    rW = 0.45 * width;
    tex = {
        xs1: select('#xs1'),
        pi1: select('#pi1'),
        xn: createP().parent(par),
        xmean: select('#xmean')
    };
    for(var t in tex){
        tex[t].style('font-size', '18px');
    }
    tex.xs1.style('width', "".concat(width, "px"));
    tex.xs1.style('overflow-x', 'auto');
    katex.render("\\vec{\\textbf{x}} = ()", tex.xs1.elt);
    katex.render("\u{3c0} \u2248 {?}", tex.pi1.elt, {
        displayMode: true
    });
    tex.xn.style('display', 'none');
    katex.render("x_n", tex.xn.elt, {
        displayMode: true
    });
    katex.render("x\u{304} := \\text{m\xe9dia}(\\vec{\\textbf{x}})", tex.xmean.elt);
    select('#bt1').mouseClicked(bt1pressed);
    translate(width / 2, height / 2);
    drawThings(-rW);
    ready = true;
}
var clickX = 0;
var gap = rW;
var remain = 0;
var pool = [];
var notActive = function() {
    return ready && (height / 2 - 60 > mouseY || mouseY > height / 2 + 60);
};
function bt1pressed() {
    newPoint(random(-rW, rW));
}
function drawThings(x) {
    clear();
    noStroke();
    fill(rc1);
    rect(0, 0, rW, rH);
    noStroke();
    var N = 50;
    fill(rc2);
    for(var i = 0; i < N; i += 2){
        var step = 2 * rW / N;
        quad(-rW + i * step, rH, -rW + (i + 1) * step, rH, -rW + (i + 2) * step, -rH, -rW + (i + 1) * step, -rH);
    }
    push();
    rectMode(CORNERS);
    fill(0, 255, 125, 80);
    rect(rW - remain, -rH, rW, rH);
    pop();
    // @ts-ignore
    drawingContext.setLineDash([
        2,
        4
    ]);
    stroke(64);
    for(var i1 = 0; i1 < Math.floor(2 * rW / gap); i1++){
        line(clickX + i1 * gap, -3 * rH, clickX + i1 * gap, 3 * rH);
    }
    push();
    stroke(0);
    strokeWeight(1.7);
    line(x, -4 * rH, x, 4 * rH);
    pop();
    // @ts-ignore
    drawingContext.setLineDash([]);
    line(rW - remain, -rH * 4, rW, -rH * 4);
    line(rW - remain, -rH * 3, rW - remain, -rH * 4);
    line(rW, -rH * 3, rW, -rH * 4);
    push();
    textAlign(CENTER);
    textSize(18);
    rotate(PI);
    text("\u2702\ufe0f", -x, -5 * rH);
    pop();
}
function mouseMoved() {
    if (notActive()) {
        return false;
    }
    drawThings(min(max(mouseX - width / 2, -rW), rW));
    return false;
}
function newPoint(x) {
    if (pool.length == 0) {
        tex.xn.style('display', 'inline');
    }
    clickX = x;
    gap = max(rW + x, 2);
    remain = 2 * (rW % (gap / 2));
    var mremain = remain / (2 * rW);
    pool.push(mremain);
    katex.render("\\vec{\\textbf{x}} =~(".concat(pool.reverse().slice(0, 10).map(function(x1) {
        return x1.toFixed(3);
    }).join('\\,;\\,'), ")"), tex.xs1.elt);
    var reducer = function(a, c) {
        return a + c;
    };
    var mean = pool.reduce(reducer) / pool.length;
    katex.render("x\u{304} := \\text{m\xe9dia}(\\vec{\\textbf{x}})\u2248".concat(mean.toFixed(5)), tex.xmean.elt);
    katex.render("\u{3c0} \u2248 \\sqrt{12(1 - x\u{304})} \u2248 ".concat(Math.sqrt(12 * (1 - mean)).toFixed(5)), tex.pi1.elt, {
        displayMode: true
    });
    tex.xn.position(width / 2 + rW - remain / 2 - 7, height / 2 - 4 * rH - 66);
    drawThings(clickX);
}
function mousePressed() {
    if (notActive()) {
        return false;
    }
    newPoint(min(max(mouseX - width / 2, -rW), rW));
}
function windowResized() {
    resizeCanvas(par.width - 30, H);
    setup();
}

