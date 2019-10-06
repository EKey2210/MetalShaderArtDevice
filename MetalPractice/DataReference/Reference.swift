//
//  Reference.swift
//  MetalPractice
//

import MetalKit

public enum BackgroundColors{
    static let White: MTLClearColor = MTLClearColor(red : 1.0, green : 1.0, blue : 1.0, alpha : 1.0)
    static let Red: MTLClearColor = MTLClearColor(red : 1.0, green : 0.0, blue : 0.0, alpha : 1.0)
    static let Green: MTLClearColor = MTLClearColor(red : 0.0, green : 1.0, blue : 0.0, alpha : 1.0)
    static let Blue: MTLClearColor = MTLClearColor(red : 0.0, green : 0.0, blue : 1.0, alpha : 1.0)
    static let Black: MTLClearColor = MTLClearColor(red : 0.0, green : 0.0, blue : 0.0, alpha : 0.0)
}

class Reference{
    public static var clearColor: MTLClearColor = BackgroundColors.White
    public static var mainPixelFormat: MTLPixelFormat = MTLPixelFormat.bgra8Unorm
}
