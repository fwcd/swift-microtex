import CxxMicroTeX

public class LaTeX {
    public static let shared = LaTeX()

    private init() {
        tex.LaTeX.`init`("test")
    }

    deinit {
        tex.LaTeX.release()
    }
}
