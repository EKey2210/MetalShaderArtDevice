//
//  MetalLibrary.swift
//  MetalPractice
//

import MetalKit

enum VertexShaderType {
    case Basic
}

enum FragmentShaderType {
    case Basic
}

class MetalLibrary{
    public static var defaultLibrary: MTLLibrary!
    
    private static var vertexShader: [VertexShaderType: Shader] = [:]
    private static var fragmentShader: [FragmentShaderType: Shader] = [:]
    
    public static func initialize(){
        defaultLibrary = MetalInitializer.device.makeDefaultLibrary()
        createDefaultShader()
    }
    
    public static func createDefaultShader(){
        vertexShader.updateValue(BasicVertexShader(), forKey: .Basic)
        fragmentShader.updateValue(BasicFragmentShader(), forKey: .Basic)
    }
    
    public static func Vertex(_ vertexShaderType: VertexShaderType) -> MTLFunction{
        return vertexShader[vertexShaderType]!.function
    }
    
    public static func Fragment(_ fragmentShaderType: FragmentShaderType) -> MTLFunction{
        return fragmentShader[fragmentShaderType]!.function
    }
}

protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction { get }
}

public struct BasicVertexShader: Shader{
    public var name: String = "Basic Vertex Shader"
    public var functionName: String = "basicVertexShader"
    public var function: MTLFunction {
        let function = MetalLibrary.defaultLibrary.makeFunction(name: functionName)
        function?.label = name
        return function!
    }
}

public struct BasicFragmentShader: Shader{
    public var name: String = "Basic Fragment Shader"
    public var functionName: String = "basicFragmentShader"
    public var function: MTLFunction {
        let function = MetalLibrary.defaultLibrary.makeFunction(name: functionName)
        function?.label = name
        return function!
    }
}
