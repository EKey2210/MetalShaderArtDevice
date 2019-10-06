//
//  MetalRenderPipelineState.swift
//  MetalPractice
//

import MetalKit

enum RenderPipelineStateTypes {
    case Basic
}

class MetalRenderPipelineState {
    
    private static var renderPipelineState: [RenderPipelineStateTypes: RenderPipelineState] = [:]
    
    public static func initialize(){
        createDefaultRenderPipelineState()
    }
    
    private static func createDefaultRenderPipelineState(){
        renderPipelineState.updateValue(BasicRenderPipelineState(), forKey: .Basic)
    }
    
    public static func pipelineState(_ renderPipelineStateType: RenderPipelineStateTypes) -> MTLRenderPipelineState{
        return renderPipelineState[renderPipelineStateType]!.renderPipelineState
    }
    
}

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState { get }
}

public struct BasicRenderPipelineState : RenderPipelineState {
    var name: String = "Basic Render Pipeline State"
    var renderPipelineState: MTLRenderPipelineState{
        var renderPipelineState: MTLRenderPipelineState!
        do{
            renderPipelineState = try MetalInitializer.device.makeRenderPipelineState(descriptor: MetalRenderPipelineDescriptor.descriptor(.Basic))
        }catch let error as NSError{
            print(error)
        }
        return renderPipelineState
    }
}
