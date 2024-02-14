import CxxMicroTeX

public struct Color {
    let wrapped: tex.color
}

extension Color {
    static let transparent = Self(wrapped: tex.transparent)
    static let black = Self(wrapped: tex.black)
    static let white = Self(wrapped: tex.white)
    static let red = Self(wrapped: tex.red)
    static let green = Self(wrapped: tex.green)
    static let blue = Self(wrapped: tex.blue)
    static let yellow = Self(wrapped: tex.yellow)
    static let cyan = Self(wrapped: tex.cyan)
    static let magenta = Self(wrapped: tex.magenta)
}
