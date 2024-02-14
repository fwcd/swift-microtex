import MicroTeX

let tex = LaTeX.shared!
let render = tex.parse(#"\frac{3}{4}"#)
print(render)
