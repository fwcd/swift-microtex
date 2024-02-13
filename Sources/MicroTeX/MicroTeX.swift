import CxxMicroTeX
import CxxStdlib
import Foundation

public class LaTeX {
    public static let shared = LaTeX()

    private init?() {
        guard let resources = Bundle.module.resourcePath else { return nil }
        print(resources) // TODO
        tex.LaTeX.`init`(std.string(resources))
    }

    deinit {
        tex.LaTeX.release()
    }
}
