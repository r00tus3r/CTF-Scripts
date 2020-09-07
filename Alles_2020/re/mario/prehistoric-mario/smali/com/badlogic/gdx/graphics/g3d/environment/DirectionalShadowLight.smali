.class public Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;
.super Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;
.source "DirectionalShadowLight.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g3d/environment/ShadowMap;
.implements Lcom/badlogic/gdx/utils/Disposable;


# instance fields
.field protected cam:Lcom/badlogic/gdx/graphics/Camera;

.field protected fbo:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

.field protected halfDepth:F

.field protected halfHeight:F

.field protected final textureDesc:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

.field protected final tmpV:Lcom/badlogic/gdx/math/Vector3;


# direct methods
.method public constructor <init>(IIFFFF)V
    .locals 3

    .line 43
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;-><init>()V

    .line 38
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    .line 44
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    sget-object v1, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    const/4 v2, 0x1

    invoke-direct {v0, v1, p1, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;-><init>(Lcom/badlogic/gdx/graphics/Pixmap$Format;IIZ)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->fbo:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    .line 45
    new-instance p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;

    invoke-direct {p1, p3, p4}, Lcom/badlogic/gdx/graphics/OrthographicCamera;-><init>(FF)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->cam:Lcom/badlogic/gdx/graphics/Camera;

    .line 46
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->cam:Lcom/badlogic/gdx/graphics/Camera;

    iput p5, p1, Lcom/badlogic/gdx/graphics/Camera;->near:F

    .line 47
    iput p6, p1, Lcom/badlogic/gdx/graphics/Camera;->far:F

    const/high16 p1, 0x3f000000    # 0.5f

    mul-float p4, p4, p1

    .line 48
    iput p4, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->halfHeight:F

    sub-float/2addr p6, p5

    mul-float p6, p6, p1

    add-float/2addr p5, p6

    .line 49
    iput p5, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->halfDepth:F

    .line 50
    new-instance p1, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    invoke-direct {p1}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->textureDesc:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    .line 51
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->textureDesc:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    sget-object p2, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Nearest:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iput-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iput-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 52
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->textureDesc:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    sget-object p2, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->ClampToEdge:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    iput-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->vWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    iput-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->uWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    return-void
.end method


# virtual methods
.method public begin()V
    .locals 4

    .line 79
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->fbo:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->getWidth()I

    move-result v0

    .line 80
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->fbo:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->getHeight()I

    move-result v1

    .line 81
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->fbo:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->begin()V

    .line 82
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v3, 0x0

    invoke-interface {v2, v3, v3, v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glViewport(IIII)V

    .line 83
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-interface {v2, v3, v3, v3, v3}, Lcom/badlogic/gdx/graphics/GL20;->glClearColor(FFFF)V

    .line 84
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v3, 0x4100

    invoke-interface {v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glClear(I)V

    .line 85
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v3, 0xc11

    invoke-interface {v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glEnable(I)V

    .line 86
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    add-int/lit8 v0, v0, -0x2

    add-int/lit8 v1, v1, -0x2

    const/4 v3, 0x1

    invoke-interface {v2, v3, v3, v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glScissor(IIII)V

    return-void
.end method

.method public begin(Lcom/badlogic/gdx/graphics/Camera;)V
    .locals 0

    .line 69
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->update(Lcom/badlogic/gdx/graphics/Camera;)V

    .line 70
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->begin()V

    return-void
.end method

.method public begin(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 0

    .line 74
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->update(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V

    .line 75
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->begin()V

    return-void
.end method

.method public dispose()V
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->fbo:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->dispose()V

    :cond_0
    const/4 v0, 0x0

    .line 116
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->fbo:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    return-void
.end method

.method public end()V
    .locals 2

    .line 90
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v1, 0xc11

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    .line 91
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->fbo:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->end()V

    return-void
.end method

.method public getCamera()Lcom/badlogic/gdx/graphics/Camera;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->cam:Lcom/badlogic/gdx/graphics/Camera;

    return-object v0
.end method

.method public getDepthMap()Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->textureDesc:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->fbo:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->getColorBufferTexture()Lcom/badlogic/gdx/graphics/GLTexture;

    move-result-object v1

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->texture:Lcom/badlogic/gdx/graphics/GLTexture;

    .line 110
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->textureDesc:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    return-object v0
.end method

.method public getFrameBuffer()Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->fbo:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    return-object v0
.end method

.method public getProjViewTrans()Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->cam:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/Camera;->combined:Lcom/badlogic/gdx/math/Matrix4;

    return-object v0
.end method

.method public update(Lcom/badlogic/gdx/graphics/Camera;)V
    .locals 2

    .line 56
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->halfHeight:F

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->update(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V

    return-void
.end method

.method public update(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 1

    .line 61
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->cam:Lcom/badlogic/gdx/graphics/Camera;

    iget-object p2, p2, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->halfDepth:F

    neg-float v0, v0

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 62
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->cam:Lcom/badlogic/gdx/graphics/Camera;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 64
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->cam:Lcom/badlogic/gdx/graphics/Camera;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Camera;->normalizeUp()V

    .line 65
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalShadowLight;->cam:Lcom/badlogic/gdx/graphics/Camera;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Camera;->update()V

    return-void
.end method
