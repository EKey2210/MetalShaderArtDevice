//
//  RenderPipelineDescriptor.swift
//  MetalPractice
//

import MetalKit

enum RenderPipelineDescriptorTypes {
    case Basic
}

class MetalRenderPipelineDescriptor {
    
    private static var renderPipelineDescriptor: [RenderPipelineDescriptorTypes: RenderPipelineDescriptor] = [:]
    
    public static func initialize(){
        createDefaultRenderPipelineDescriptor()
    }
    
    private static func createDefaultRenderPipelineDescriptor(){
        renderPipelineDescriptor.updateValue(BasicRenderPipelineDescriptor(), forKey: .Basic)
    }
    
    public static func descriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorTypes) -> MTLRenderPipelineDescriptor{
        return renderPipelineDescriptor[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
    
}

protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor { get }
}

public struct BasicRenderPipelineDescriptor : RenderPipelineDescriptor{
    var name: String = "Basic Render Pipeline Descriptor"
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor{
        
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = Reference.mainPixelFormat
        renderPipelineDescriptor.vertexFunction = MetalLibrary.Vertex(.Basic)
        renderPipelineDescriptor.fragmentFunction = MetalLibrary.Fragment(.Basic)
        renderPipelineDescriptor.vertexDescriptor = MetalVertexDescriptor.descriptor(.Basic)
        
        return renderPipelineDescriptor
    }
}
