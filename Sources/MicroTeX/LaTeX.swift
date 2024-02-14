import CxxMicroTeX
import CxxMicroTeXSupport
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

    func parse(
        _ code: String,
        width: Int = 720,
        textSize: Double = 24,
        lineSpace: Double = 10,
        fgColor: Color = .black
    ) -> TeXRender {
        TeXRender(wrapped: tex.LaTeX.parse(
            convertUtf8ToUtf16(std.string(code)),
            Int32(width),
            Float(textSize),
            Float(lineSpace),
            fgColor.wrapped
        )!)
    }
}
