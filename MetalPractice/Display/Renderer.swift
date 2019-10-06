//
//  Renderer.swift
//  MetalPractice
//

import MetalKit

class Renderer: NSObject{
    
    var dataObject: DataObject = DataObject()
    
}

extension Renderer: MTKViewDelegate{
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        let commandBuffer = MetalInitializer.commandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        dataObject.setResolution(width: Float(1440),height: Float(1440))
        dataObject.update(deltaTime: 1 / Float(view.preferredFramesPerSecond))
        
        dataObject.render(renderCommandEncoder: renderCommandEncoder!)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
