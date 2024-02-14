import CxxMicroTeX
import CxxMicroTeXSupport
import Foundation

public class TeXRender {
    let wrapped: UnsafeMutablePointer<tex.TeXRender>

    deinit {
        // TODO: Is this safe? How do we delete this owned C++ pointer properly?
        wrapped.deinitialize(count: 1).deallocate()
    }

    init(wrapped: UnsafeMutablePointer<tex.TeXRender>) {
        self.wrapped = wrapped
    }

    public func png() -> Data {
        let g2d = GraphicsContext()
        // TODO
        // wrapped.pointee.draw(&g2d, 0, 0)
    }
}
