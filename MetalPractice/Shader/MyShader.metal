//
//  MyShader.metal
//  MetalPractice
//

#include <metal_stdlib>
using namespace metal;

struct Vertex_In {
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct RasterizeData {
    float4 position [[position]];
    float4 color;
};


vertex RasterizeData basicVertexShader(const Vertex_In vIn [[ stage_in ]]){
    RasterizeData rasterizeData;
    
    rasterizeData.position = float4(vIn.position,1.0);
    rasterizeData.color = vIn.color;
    
    return rasterizeData;
}

fragment half4 basicFragmentShader(RasterizeData rasterizeData [[stage_in]],
                                   constant float &time [[ buffer(1) ]],
                                   constant float2 &resolution [[ buffer(2) ]]){
    half4 outputColor;
    float4 pixelPosition = rasterizeData.position;
    
    float2 uv = (pixelPosition.xy*2.0 - resolution)/min(resolution.x,resolution.y);
    uv.y *= -1.0;
    outputColor = step(length(uv), cos(time));
    return outputColor;
}
