//
//  DataObject.swift
//  MetalPractice
//


import MetalKit

class DataObject{
    var quad: Mesh = MeshReference.mesh(.Quad)
    
    var time: Float = 0.0
    var resolution: float2 = float2()
    
    func setResolution(width:Float, height:Float) {
        resolution = float2(width,height)
    }
    
    func update(deltaTime: Float){
        time += deltaTime
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder){
        renderCommandEncoder.setFragmentBytes(&time, length: Float.stride, index: 1)
        renderCommandEncoder.setFragmentBytes(&resolution, length: float2.stride, index: 2)
        renderCommandEncoder.setRenderPipelineState(MetalRenderPipelineState.pipelineState(.Basic))
        renderCommandEncoder.setVertexBuffer(quad.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: quad.vertexCount)
    }
}
