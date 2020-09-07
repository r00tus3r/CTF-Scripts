.class Lbox2dLight/LightMap;
.super Ljava/lang/Object;
.source "LightMap.java"


# static fields
.field public static final U1:I = 0x2

.field public static final U2:I = 0x6

.field public static final U3:I = 0xa

.field public static final U4:I = 0xe

.field public static final V1:I = 0x3

.field public static final V2:I = 0x7

.field public static final V3:I = 0xb

.field public static final V4:I = 0xf

.field public static final VERT_SIZE:I = 0x10

.field public static final X1:I = 0x0

.field public static final X2:I = 0x4

.field public static final X3:I = 0x8

.field public static final X4:I = 0xc

.field public static final Y1:I = 0x1

.field public static final Y2:I = 0x5

.field public static final Y3:I = 0x9

.field public static final Y4:I = 0xd


# instance fields
.field private blurShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

.field private diffuseShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

.field frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

.field lightMapDrawingDisabled:Z

.field private lightMapMesh:Lcom/badlogic/gdx/graphics/Mesh;

.field private pingPongBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

.field private rayHandler:Lbox2dLight/RayHandler;

.field private shadowShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

.field private withoutShadowShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;


# direct methods
.method public constructor <init>(Lbox2dLight/RayHandler;II)V
    .locals 2

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    iput-object p1, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    const/4 p1, 0x1

    if-gtz p2, :cond_0

    const/4 p2, 0x1

    :cond_0
    if-gtz p3, :cond_1

    goto :goto_0

    :cond_1
    move p1, p3

    .line 120
    :goto_0
    new-instance p3, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    const/4 v1, 0x0

    invoke-direct {p3, v0, p2, p1, v1}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;-><init>(Lcom/badlogic/gdx/graphics/Pixmap$Format;IIZ)V

    iput-object p3, p0, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    .line 122
    new-instance p3, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    invoke-direct {p3, v0, p2, p1, v1}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;-><init>(Lcom/badlogic/gdx/graphics/Pixmap$Format;IIZ)V

    iput-object p3, p0, Lbox2dLight/LightMap;->pingPongBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    .line 125
    invoke-direct {p0}, Lbox2dLight/LightMap;->createLightMapMesh()Lcom/badlogic/gdx/graphics/Mesh;

    move-result-object p3

    iput-object p3, p0, Lbox2dLight/LightMap;->lightMapMesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 127
    invoke-static {}, Lshaders/ShadowShader;->createShadowShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    move-result-object p3

    iput-object p3, p0, Lbox2dLight/LightMap;->shadowShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 128
    invoke-static {}, Lshaders/DiffuseShader;->createShadowShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    move-result-object p3

    iput-object p3, p0, Lbox2dLight/LightMap;->diffuseShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 130
    invoke-static {}, Lshaders/WithoutShadowShader;->createShadowShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    move-result-object p3

    iput-object p3, p0, Lbox2dLight/LightMap;->withoutShadowShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 132
    invoke-static {p2, p1}, Lshaders/Gaussian;->createBlurShader(II)Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    move-result-object p1

    iput-object p1, p0, Lbox2dLight/LightMap;->blurShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    return-void
.end method

.method private createLightMapMesh()Lcom/badlogic/gdx/graphics/Mesh;
    .locals 9

    const/16 v0, 0x10

    .line 146
    new-array v1, v0, [F

    fill-array-data v1, :array_0

    .line 173
    new-instance v2, Lcom/badlogic/gdx/graphics/Mesh;

    const/4 v3, 0x2

    new-array v4, v3, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v5, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/4 v6, 0x1

    const-string v7, "a_position"

    invoke-direct {v5, v6, v3, v7}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    const/4 v7, 0x0

    aput-object v5, v4, v7

    new-instance v5, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v8, "a_texCoord"

    invoke-direct {v5, v0, v3, v8}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v5, v4, v6

    const/4 v0, 0x4

    invoke-direct {v2, v6, v0, v7, v4}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    .line 177
    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([F)Lcom/badlogic/gdx/graphics/Mesh;

    return-object v2

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method dispose()V
    .locals 1

    .line 137
    iget-object v0, p0, Lbox2dLight/LightMap;->shadowShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->dispose()V

    .line 138
    iget-object v0, p0, Lbox2dLight/LightMap;->blurShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->dispose()V

    .line 139
    iget-object v0, p0, Lbox2dLight/LightMap;->lightMapMesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    .line 140
    iget-object v0, p0, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->dispose()V

    .line 141
    iget-object v0, p0, Lbox2dLight/LightMap;->pingPongBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->dispose()V

    return-void
.end method

.method public gaussianBlur()V
    .locals 10

    .line 74
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v1, 0xbe2

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 75
    :goto_0
    iget-object v3, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget v3, v3, Lbox2dLight/RayHandler;->blurNum:I

    if-ge v2, v3, :cond_1

    .line 76
    iget-object v3, p0, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->getColorBufferTexture()Lcom/badlogic/gdx/graphics/GLTexture;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v3, v0}, Lcom/badlogic/gdx/graphics/Texture;->bind(I)V

    .line 78
    iget-object v3, p0, Lbox2dLight/LightMap;->pingPongBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->begin()V

    .line 80
    iget-object v3, p0, Lbox2dLight/LightMap;->blurShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 82
    iget-object v3, p0, Lbox2dLight/LightMap;->blurShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const-string v6, "dir"

    invoke-virtual {v3, v6, v5, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformf(Ljava/lang/String;FF)V

    .line 83
    iget-object v3, p0, Lbox2dLight/LightMap;->lightMapMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v7, p0, Lbox2dLight/LightMap;->blurShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const/4 v8, 0x4

    const/4 v9, 0x6

    invoke-virtual {v3, v7, v9, v0, v8}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    .line 84
    iget-object v3, p0, Lbox2dLight/LightMap;->blurShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    .line 86
    iget-object v3, p0, Lbox2dLight/LightMap;->pingPongBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->end()V

    .line 88
    iget-object v3, p0, Lbox2dLight/LightMap;->pingPongBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->getColorBufferTexture()Lcom/badlogic/gdx/graphics/GLTexture;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v3, v0}, Lcom/badlogic/gdx/graphics/Texture;->bind(I)V

    .line 90
    iget-object v3, p0, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->begin()V

    .line 92
    iget-object v3, p0, Lbox2dLight/LightMap;->blurShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 94
    iget-object v3, p0, Lbox2dLight/LightMap;->blurShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v3, v6, v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformf(Ljava/lang/String;FF)V

    .line 95
    iget-object v3, p0, Lbox2dLight/LightMap;->lightMapMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v4, p0, Lbox2dLight/LightMap;->blurShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v3, v4, v9, v0, v8}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    .line 96
    iget-object v3, p0, Lbox2dLight/LightMap;->blurShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    .line 99
    iget-object v3, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget-boolean v3, v3, Lbox2dLight/RayHandler;->customViewport:Z

    if-eqz v3, :cond_0

    .line 100
    iget-object v3, p0, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    iget-object v4, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget v4, v4, Lbox2dLight/RayHandler;->viewportX:I

    iget-object v5, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget v5, v5, Lbox2dLight/RayHandler;->viewportY:I

    iget-object v6, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget v6, v6, Lbox2dLight/RayHandler;->viewportWidth:I

    iget-object v7, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget v7, v7, Lbox2dLight/RayHandler;->viewportHeight:I

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->end(IIII)V

    goto :goto_1

    .line 106
    :cond_0
    iget-object v3, p0, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->end()V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 110
    :cond_1
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glEnable(I)V

    return-void
.end method

.method public render()V
    .locals 10

    .line 34
    iget-object v0, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget v0, v0, Lbox2dLight/RayHandler;->lightRenderedLastFrame:I

    const/4 v1, 0x0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 36
    iget-object v2, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget-boolean v2, v2, Lbox2dLight/RayHandler;->blur:Z

    if-eqz v2, :cond_1

    .line 37
    invoke-virtual {p0}, Lbox2dLight/LightMap;->gaussianBlur()V

    .line 39
    :cond_1
    iget-boolean v2, p0, Lbox2dLight/LightMap;->lightMapDrawingDisabled:Z

    if-eqz v2, :cond_2

    return-void

    .line 41
    :cond_2
    iget-object v2, p0, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->getColorBufferTexture()Lcom/badlogic/gdx/graphics/GLTexture;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/graphics/Texture;->bind(I)V

    .line 44
    iget-object v1, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget-boolean v1, v1, Lbox2dLight/RayHandler;->shadows:Z

    const/4 v2, 0x6

    if-eqz v1, :cond_4

    .line 45
    iget-object v0, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v0, v0, Lbox2dLight/RayHandler;->ambientLight:Lcom/badlogic/gdx/graphics/Color;

    .line 46
    iget-object v1, p0, Lbox2dLight/LightMap;->shadowShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 47
    sget-boolean v3, Lbox2dLight/RayHandler;->isDiffuse:Z

    if-eqz v3, :cond_3

    .line 48
    iget-object v1, p0, Lbox2dLight/LightMap;->diffuseShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 49
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 50
    iget-object v3, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v3, v3, Lbox2dLight/RayHandler;->diffuseBlendFunc:Lbox2dLight/BlendFunc;

    invoke-virtual {v3}, Lbox2dLight/BlendFunc;->apply()V

    .line 51
    iget v6, v0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v7, v0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v8, v0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v9, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    const-string v5, "ambient"

    move-object v4, v1

    invoke-virtual/range {v4 .. v9}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformf(Ljava/lang/String;FFFF)V

    goto :goto_1

    .line 53
    :cond_3
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 54
    iget-object v3, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v3, v3, Lbox2dLight/RayHandler;->shadowBlendFunc:Lbox2dLight/BlendFunc;

    invoke-virtual {v3}, Lbox2dLight/BlendFunc;->apply()V

    .line 55
    iget v3, v0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v4, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v5, v3, v4

    iget v3, v0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v6, v3, v4

    iget v3, v0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v4, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v7, v3, v4

    const/high16 v3, 0x3f800000    # 1.0f

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    sub-float v8, v3, v0

    const-string v4, "ambient"

    move-object v3, v1

    invoke-virtual/range {v3 .. v8}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformf(Ljava/lang/String;FFFF)V

    .line 59
    :goto_1
    iget-object v0, p0, Lbox2dLight/LightMap;->lightMapMesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;I)V

    .line 60
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    goto :goto_2

    :cond_4
    if-eqz v0, :cond_5

    .line 62
    iget-object v0, p0, Lbox2dLight/LightMap;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v0, v0, Lbox2dLight/RayHandler;->simpleBlendFunc:Lbox2dLight/BlendFunc;

    invoke-virtual {v0}, Lbox2dLight/BlendFunc;->apply()V

    .line 63
    iget-object v0, p0, Lbox2dLight/LightMap;->withoutShadowShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 65
    iget-object v0, p0, Lbox2dLight/LightMap;->lightMapMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lbox2dLight/LightMap;->withoutShadowShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;I)V

    .line 66
    iget-object v0, p0, Lbox2dLight/LightMap;->withoutShadowShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    .line 69
    :cond_5
    :goto_2
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v1, 0xbe2

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    return-void
.end method
