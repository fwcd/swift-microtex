import CxxMicroTeX
import Foundation

public class LaTeX {
    public static let shared = LaTeX()

    private init?() {
        guard let resources = Bundle.module.resourcePath else { return nil }
        tex.LaTeX.`init`(std.string(resources))
    }

    deinit {
        tex.LaTeX.release()
    }
}
