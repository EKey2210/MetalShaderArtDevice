//
//  MetalVertexLibrary.swift
//  MetalPractice
//

import MetalKit

enum VertexDescriptorTypes {
    case Basic
}

class MetalVertexDescriptor {
    
    private static var vertexDescriptor: [VertexDescriptorTypes: VertexDescriptor] = [:]
    
    public static func initialize(){
        createDefaultVertexDescriptor()
    }
    
    private static func createDefaultVertexDescriptor(){
        vertexDescriptor.updateValue(BasicVertexDescriptor(), forKey: .Basic)
    }
    
    public static func descriptor(_ vertexDescriptorType: VertexDescriptorTypes) -> MTLVertexDescriptor{
        return vertexDescriptor[vertexDescriptorType]!.vertexDescriptor
    }
    
}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor { get }
}

public struct BasicVertexDescriptor: VertexDescriptor {
    var name: String =  "Basic Vertex Descriptor"
    
    var vertexDescriptor: MTLVertexDescriptor{
        let vertexDescriptor = MTLVertexDescriptor()
        
        // 位置
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        
        // 色
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = float3.size
        
        vertexDescriptor.layouts[0].stride = Vertex.stride
        
        return vertexDescriptor
    }
}
