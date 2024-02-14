import CxxMicroTeX

public struct Color {
    let wrapped: tex.color
}

extension Color {
    public static let transparent = Self(wrapped: tex.transparent)
    public static let black = Self(wrapped: tex.black)
    public static let white = Self(wrapped: tex.white)
    public static let red = Self(wrapped: tex.red)
    public static let green = Self(wrapped: tex.green)
    public static let blue = Self(wrapped: tex.blue)
    public static let yellow = Self(wrapped: tex.yellow)
    public static let cyan = Self(wrapped: tex.cyan)
    public static let magenta = Self(wrapped: tex.magenta)
}
