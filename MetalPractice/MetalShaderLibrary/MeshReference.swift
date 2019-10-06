//
//  MeshReference.swift
//  MetalPractice
//

import MetalKit

enum MeshType {
    case Triangle
    case Quad
}

class MeshReference {
    
    private static var mesh: [MeshType: Mesh] = [:]
    
    public static func initialize(){
        createMesh()
    }
    
    private static func createMesh(){
//        mesh.updateValue(Triangle(), forKey: .Triangle)
        mesh.updateValue(Quad(), forKey: .Quad)
    }
    
    public static func mesh(_ meshType: MeshType) -> Mesh{
        return mesh[meshType]!
    }
}

protocol Mesh{
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
}

class CustomMesh : Mesh{
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! {
        return vertices.count
    }
    
    init() {
        createVertices()
        createBuffer()
    }
    
    func createVertices(){ }
    
    func createBuffer(){
        vertexBuffer = MetalInitializer.device.makeBuffer(bytes: vertices, length: MemoryLayout<Vertex>.stride * vertices.count, options: [])
    }
}

class Triangle : CustomMesh{
    override func createVertices(){
        vertices = [
            Vertex(position: float3( 0.0,  1.0, 0.0), color: float4(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: float3(-1.0, -1.0, 0.0), color: float4(0.0, 1.0, 0.0, 1.0)),
            Vertex(position: float3( 1.0, -1.0, 0.0), color: float4(0.0, 0.0, 1.0, 1.0))
        ]
    }
}

class Quad : CustomMesh{
    override func createVertices(){
        vertices = [
            Vertex(position: float3(-1.0,  1.0, 0.0), color: float4(1.0, 0.0, 0.0, 1.0)),  //左上
            Vertex(position: float3(-1.0, -1.0, 0.0), color: float4(0.0, 1.0, 0.0, 1.0)),  //左下
            Vertex(position: float3( 1.0, -1.0, 0.0), color: float4(0.0, 0.0, 1.0, 1.0)),  //右下
            Vertex(position: float3(-1.0,  1.0, 0.0), color: float4(1.0, 0.0, 0.0, 1.0)),  //左上
            Vertex(position: float3( 1.0,  1.0, 0.0), color: float4(0.0, 1.0, 1.0, 1.0)),  //右上
            Vertex(position: float3( 1.0, -1.0, 0.0), color: float4(0.0, 0.0, 1.0, 1.0))   //右下
        ]
    }
}
