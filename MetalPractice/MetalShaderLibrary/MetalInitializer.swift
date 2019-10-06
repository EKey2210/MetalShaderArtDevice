//
//  MetalInitializer.swift
//  MetalPractice
//

import MetalKit

class MetalInitializer {
    
    public static var device: MTLDevice!
    public static var commandQueue: MTLCommandQueue!
    
    public static func initialize(device: MTLDevice){
        self.device = device
        self.commandQueue = device.makeCommandQueue()
        
        MetalLibrary.initialize()
        
        MetalVertexDescriptor.initialize()
        
        MetalRenderPipelineDescriptor.initialize()
        
        MetalRenderPipelineState.initialize()
        
        MeshReference.initialize()
    }
}
