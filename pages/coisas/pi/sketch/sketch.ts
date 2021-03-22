const katex = require('katex')
let tex: { [name: string]: p5.Element }
let par: any
let rc1: p5.Color
let rc2: p5.Color
let rH = 3
let rW = 200
let H = 100
let ready = false

function setup() {
  ready = false
  par = select('#sketch-holder')

  let canvas = createCanvas(par.width - 30, H)
  canvas.parent(par)

  rectMode(RADIUS).frameRate(60)

  rc1 = color(172, 125, 98)
  rc2 = color(152, 105, 78)
  rW = 0.45 * width

  tex = {
    xs1: select('#xs1'),
    pi1: select('#pi1'),
    xn: createP().parent(par),
    xmean: select('#xmean')
  }
  for (let t in tex) {
    tex[t].style('font-size', '18px')
  }
  tex.xs1.style('width', `${width}px`)
  tex.xs1.style('overflow-x', 'auto')
  katex.render(`\vec{\textbf{x}} = ()`, tex.xs1.elt)

  katex.render(`π ≈ {?}`, tex.pi1.elt, { displayMode: true })
  
  tex.xn.style('display', 'none')
  katex.render(`x_n`, tex.xn.elt, { displayMode: true })

  katex.render(`x̄ := \text{média}(\vec{\textbf{x}})`, tex.xmean.elt)
  select('#bt1').mouseClicked(bt1pressed)

  translate(width / 2, height / 2)
  drawThings(-rW)
  ready = true
}

let clickX = 0
let gap = rW
let remain = 0

let pool: number[] = []

let notActive = () => (ready && (height / 2 - 60 > mouseY || mouseY > height / 2 + 60))

function bt1pressed() {
  newPoint(random(-rW, rW))
}

function drawThings(x:number) {
  clear()

  noStroke()
  fill(rc1)
  rect(0, 0, rW, rH)

  noStroke()

  let N = 50
  fill(rc2)
  for (let i = 0; i < N; i += 2) {
    let step = 2 * rW / N
    quad(-rW + i * step, rH,
      -rW + (i + 1) * step, rH,
      -rW + (i + 2) * step, -rH,
      -rW + (i + 1) * step, -rH)
  }

  push()
  rectMode(CORNERS)
  fill(0, 255, 125, 80)
  rect(rW - remain, -rH, rW, rH)
  pop()

  // @ts-ignore
  drawingContext.setLineDash([2, 4])
  stroke(64)
  for (let i = 0; i < Math.floor(2 * rW / gap); i++) {
    line(clickX + i * gap, -3 * rH, clickX + i * gap, 3 * rH)
  }

  push()
  stroke(0)
  strokeWeight(1.7)
  line(x, -4 * rH, x, 4 * rH)
  pop()

  // @ts-ignore
  drawingContext.setLineDash([])

  line(rW - remain, -rH * 4, rW, -rH * 4)
  line(rW - remain, -rH * 3, rW - remain, -rH * 4)
  line(rW, -rH * 3, rW, -rH * 4)

  push()
  textAlign(CENTER)
  textSize(18)
  rotate(PI)
  text("✂️", -x, -5 * rH)
  pop()
}

function mouseMoved() {
  if (notActive()) { return false }
  drawThings(min(max(mouseX - width / 2, -rW), rW))
  return false
}

function newPoint(x:number) {
  if (pool.length == 0) {
    tex.xn.style('display', 'inline')
  }

  clickX = x
  gap = max(rW + x, 2)
  remain = 2 * (rW % (gap / 2))

  let mremain = remain / (2 * rW)
  pool.push(mremain)
  katex.render(`\vec{\textbf{x}} =~(${pool.map(x => x.toFixed(3)).join('\\,;\\,')})`, tex.xs1.elt)

  const reducer = (a: number, c: number) => a + c;
  let mean = pool.reduce(reducer) / pool.length
  katex.render(`x̄ := \text{média}(\vec{\textbf{x}})≈${mean.toFixed(5)}`, tex.xmean.elt)
  
  katex.render(`π ≈ \sqrt{12(1 - x̄)} ≈ ${Math.sqrt(12 * (1 - mean)).toFixed(5)}`, tex.pi1.elt, { displayMode: true })

  tex.xn.position(width / 2 + rW - remain / 2 - 7, height / 2 - 4 * rH - 66)
  drawThings(clickX)
}

function mousePressed() {
  if (notActive()) { return false }
  newPoint(min(max(mouseX - width / 2, -rW), rW))
}

function windowResized() {
  resizeCanvas(par.width - 30, H);
  setup()
}
