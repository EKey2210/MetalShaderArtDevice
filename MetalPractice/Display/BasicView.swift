//
//  BasicView.swift
//  MetalPractice
//

import MetalKit

class BasicView: MTKView {  //MTKViewを継承
    
    var renderer: Renderer!
    
    required init(coder: NSCoder) {  //初期化
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        
        MetalInitializer.initialize(device: device!)
        
        self.clearColor = Reference.clearColor
        
        self.colorPixelFormat = Reference.mainPixelFormat
        
        self.renderer = Renderer()
        
        self.delegate = renderer
    }
    
}
