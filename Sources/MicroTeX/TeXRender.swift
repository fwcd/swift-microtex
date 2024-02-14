import CxxMicroTeX

public class TeXRender {
    let wrapped: UnsafeMutablePointer<tex.TeXRender>

    deinit {
        // TODO: Is this safe? How do we delete this owned C++ pointer properly?
        wrapped.deinitialize(count: 1).deallocate()
    }

    init(wrapped: UnsafeMutablePointer<tex.TeXRender>) {
        self.wrapped = wrapped
    }
}
