.class public Lbox2dLight/RayHandler;
.super Ljava/lang/Object;
.source "RayHandler.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# static fields
.field static final GAMMA_COR:F = 0.625f

.field static gammaCorrection:Z = false

.field static gammaCorrectionParameter:F = 1.0f

.field public static isDiffuse:Z = false


# instance fields
.field final ambientLight:Lcom/badlogic/gdx/graphics/Color;

.field blur:Z

.field blurNum:I

.field final combined:Lcom/badlogic/gdx/math/Matrix4;

.field culling:Z

.field customLightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

.field customViewport:Z

.field public final diffuseBlendFunc:Lbox2dLight/BlendFunc;

.field final disabledLights:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lbox2dLight/Light;",
            ">;"
        }
    .end annotation
.end field

.field final lightList:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lbox2dLight/Light;",
            ">;"
        }
    .end annotation
.end field

.field lightMap:Lbox2dLight/LightMap;

.field lightRenderedLastFrame:I

.field final lightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

.field public final shadowBlendFunc:Lbox2dLight/BlendFunc;

.field shadows:Z

.field public final simpleBlendFunc:Lbox2dLight/BlendFunc;

.field viewportHeight:I

.field viewportWidth:I

.field viewportX:I

.field viewportY:I

.field world:Lcom/badlogic/gdx/physics/box2d/World;

.field x1:F

.field x2:F

.field y1:F

.field y2:F


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;)V
    .locals 2

    .line 118
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x4

    sget-object v1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v1}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x4

    invoke-direct {p0, p1, v0, v1}, Lbox2dLight/RayHandler;-><init>(Lcom/badlogic/gdx/physics/box2d/World;II)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;II)V
    .locals 4

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Lbox2dLight/BlendFunc;

    const/4 v1, 0x0

    const/16 v2, 0x306

    invoke-direct {v0, v2, v1}, Lbox2dLight/BlendFunc;-><init>(II)V

    iput-object v0, p0, Lbox2dLight/RayHandler;->diffuseBlendFunc:Lbox2dLight/BlendFunc;

    .line 49
    new-instance v0, Lbox2dLight/BlendFunc;

    const/4 v2, 0x1

    const/16 v3, 0x303

    invoke-direct {v0, v2, v3}, Lbox2dLight/BlendFunc;-><init>(II)V

    iput-object v0, p0, Lbox2dLight/RayHandler;->shadowBlendFunc:Lbox2dLight/BlendFunc;

    .line 56
    new-instance v0, Lbox2dLight/BlendFunc;

    const/16 v3, 0x302

    invoke-direct {v0, v3, v2}, Lbox2dLight/BlendFunc;-><init>(II)V

    iput-object v0, p0, Lbox2dLight/RayHandler;->simpleBlendFunc:Lbox2dLight/BlendFunc;

    .line 59
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v0, p0, Lbox2dLight/RayHandler;->combined:Lcom/badlogic/gdx/math/Matrix4;

    .line 60
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/Color;-><init>()V

    iput-object v0, p0, Lbox2dLight/RayHandler;->ambientLight:Lcom/badlogic/gdx/graphics/Color;

    .line 67
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/16 v3, 0x10

    invoke-direct {v0, v1, v3}, Lcom/badlogic/gdx/utils/Array;-><init>(ZI)V

    iput-object v0, p0, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    .line 74
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0, v1, v3}, Lcom/badlogic/gdx/utils/Array;-><init>(ZI)V

    iput-object v0, p0, Lbox2dLight/RayHandler;->disabledLights:Lcom/badlogic/gdx/utils/Array;

    const/4 v0, 0x0

    .line 78
    iput-object v0, p0, Lbox2dLight/RayHandler;->customLightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 80
    iput-boolean v2, p0, Lbox2dLight/RayHandler;->culling:Z

    .line 81
    iput-boolean v2, p0, Lbox2dLight/RayHandler;->shadows:Z

    .line 82
    iput-boolean v2, p0, Lbox2dLight/RayHandler;->blur:Z

    .line 84
    iput v2, p0, Lbox2dLight/RayHandler;->blurNum:I

    .line 86
    iput-boolean v1, p0, Lbox2dLight/RayHandler;->customViewport:Z

    .line 87
    iput v1, p0, Lbox2dLight/RayHandler;->viewportX:I

    .line 88
    iput v1, p0, Lbox2dLight/RayHandler;->viewportY:I

    .line 89
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    iput v0, p0, Lbox2dLight/RayHandler;->viewportWidth:I

    .line 90
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v0

    iput v0, p0, Lbox2dLight/RayHandler;->viewportHeight:I

    .line 93
    iput v1, p0, Lbox2dLight/RayHandler;->lightRenderedLastFrame:I

    .line 129
    iput-object p1, p0, Lbox2dLight/RayHandler;->world:Lcom/badlogic/gdx/physics/box2d/World;

    .line 131
    invoke-virtual {p0, p2, p3}, Lbox2dLight/RayHandler;->resizeFBO(II)V

    .line 132
    invoke-static {}, Lshaders/LightShader;->createLightShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    move-result-object p1

    iput-object p1, p0, Lbox2dLight/RayHandler;->lightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    return-void
.end method

.method public static getGammaCorrection()Z
    .locals 1

    .line 527
    sget-boolean v0, Lbox2dLight/RayHandler;->gammaCorrection:Z

    return v0
.end method

.method public static setGammaCorrection(Z)V
    .locals 0

    .line 539
    sput-boolean p0, Lbox2dLight/RayHandler;->gammaCorrection:Z

    .line 540
    sget-boolean p0, Lbox2dLight/RayHandler;->gammaCorrection:Z

    if-eqz p0, :cond_0

    const/high16 p0, 0x3f200000    # 0.625f

    goto :goto_0

    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    :goto_0
    sput p0, Lbox2dLight/RayHandler;->gammaCorrectionParameter:F

    return-void
.end method

.method public static useDiffuseLight(Z)V
    .locals 0

    .line 551
    sput-boolean p0, Lbox2dLight/RayHandler;->isDiffuse:Z

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 388
    invoke-virtual {p0}, Lbox2dLight/RayHandler;->removeAll()V

    .line 389
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightMap:Lbox2dLight/LightMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lbox2dLight/LightMap;->dispose()V

    .line 390
    :cond_0
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->dispose()V

    :cond_1
    return-void
.end method

.method public getLightMapBuffer()Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;
    .locals 1

    .line 606
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightMap:Lbox2dLight/LightMap;

    iget-object v0, v0, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    return-object v0
.end method

.method public getLightMapTexture()Lcom/badlogic/gdx/graphics/Texture;
    .locals 1

    .line 597
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightMap:Lbox2dLight/LightMap;

    iget-object v0, v0, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->getColorBufferTexture()Lcom/badlogic/gdx/graphics/GLTexture;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/Texture;

    return-object v0
.end method

.method intersect(FFF)Z
    .locals 2

    .line 250
    iget v0, p0, Lbox2dLight/RayHandler;->x1:F

    add-float v1, p1, p3

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    iget v0, p0, Lbox2dLight/RayHandler;->x2:F

    sub-float/2addr p1, p3

    cmpl-float p1, v0, p1

    if-lez p1, :cond_0

    iget p1, p0, Lbox2dLight/RayHandler;->y1:F

    add-float v0, p2, p3

    cmpg-float p1, p1, v0

    if-gez p1, :cond_0

    iget p1, p0, Lbox2dLight/RayHandler;->y2:F

    sub-float/2addr p2, p3

    cmpl-float p1, p1, p2

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public pointAtLight(FF)Z
    .locals 2

    .line 366
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbox2dLight/Light;

    .line 367
    invoke-virtual {v1, p1, p2}, Lbox2dLight/Light;->contains(FF)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public pointAtShadow(FF)Z
    .locals 2

    .line 378
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbox2dLight/Light;

    .line 379
    invoke-virtual {v1, p1, p2}, Lbox2dLight/Light;->contains(FF)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public removeAll()V
    .locals 2

    .line 397
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbox2dLight/Light;

    .line 398
    invoke-virtual {v1}, Lbox2dLight/Light;->dispose()V

    goto :goto_0

    .line 400
    :cond_0
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 402
    iget-object v0, p0, Lbox2dLight/RayHandler;->disabledLights:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbox2dLight/Light;

    .line 403
    invoke-virtual {v1}, Lbox2dLight/Light;->dispose()V

    goto :goto_1

    .line 405
    :cond_1
    iget-object v0, p0, Lbox2dLight/RayHandler;->disabledLights:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public render()V
    .locals 5

    const/4 v0, 0x0

    .line 303
    iput v0, p0, Lbox2dLight/RayHandler;->lightRenderedLastFrame:I

    .line 305
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/GL20;->glDepthMask(Z)V

    .line 306
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v2, 0xbe2

    invoke-interface {v1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glEnable(I)V

    .line 307
    iget-object v1, p0, Lbox2dLight/RayHandler;->simpleBlendFunc:Lbox2dLight/BlendFunc;

    invoke-virtual {v1}, Lbox2dLight/BlendFunc;->apply()V

    .line 309
    iget-boolean v1, p0, Lbox2dLight/RayHandler;->shadows:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lbox2dLight/RayHandler;->blur:Z

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    if-eqz v0, :cond_2

    .line 311
    iget-object v1, p0, Lbox2dLight/RayHandler;->lightMap:Lbox2dLight/LightMap;

    iget-object v1, v1, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->begin()V

    .line 312
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v2, 0x0

    invoke-interface {v1, v2, v2, v2, v2}, Lcom/badlogic/gdx/graphics/GL20;->glClearColor(FFFF)V

    .line 313
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v2, 0x4000

    invoke-interface {v1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glClear(I)V

    .line 316
    :cond_2
    iget-object v1, p0, Lbox2dLight/RayHandler;->customLightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v1, :cond_3

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lbox2dLight/RayHandler;->lightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 317
    :goto_0
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 319
    iget-object v2, p0, Lbox2dLight/RayHandler;->combined:Lcom/badlogic/gdx/math/Matrix4;

    const-string v3, "u_projTrans"

    invoke-virtual {v1, v3, v2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix(Ljava/lang/String;Lcom/badlogic/gdx/math/Matrix4;)V

    .line 320
    iget-object v2, p0, Lbox2dLight/RayHandler;->customLightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v2, :cond_4

    invoke-virtual {p0}, Lbox2dLight/RayHandler;->updateLightShader()V

    .line 321
    :cond_4
    iget-object v2, p0, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbox2dLight/Light;

    .line 322
    iget-object v4, p0, Lbox2dLight/RayHandler;->customLightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v4, :cond_5

    invoke-virtual {p0, v3}, Lbox2dLight/RayHandler;->updateLightShaderPerLight(Lbox2dLight/Light;)V

    .line 323
    :cond_5
    invoke-virtual {v3}, Lbox2dLight/Light;->render()V

    goto :goto_1

    .line 326
    :cond_6
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    if-eqz v0, :cond_8

    .line 329
    iget-boolean v0, p0, Lbox2dLight/RayHandler;->customViewport:Z

    if-eqz v0, :cond_7

    .line 330
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightMap:Lbox2dLight/LightMap;

    iget-object v0, v0, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    iget v1, p0, Lbox2dLight/RayHandler;->viewportX:I

    iget v2, p0, Lbox2dLight/RayHandler;->viewportY:I

    iget v3, p0, Lbox2dLight/RayHandler;->viewportWidth:I

    iget v4, p0, Lbox2dLight/RayHandler;->viewportHeight:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->end(IIII)V

    goto :goto_2

    .line 336
    :cond_7
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightMap:Lbox2dLight/LightMap;

    iget-object v0, v0, Lbox2dLight/LightMap;->frameBuffer:Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->end()V

    .line 338
    :goto_2
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightMap:Lbox2dLight/LightMap;

    invoke-virtual {v0}, Lbox2dLight/LightMap;->render()V

    :cond_8
    return-void
.end method

.method public resizeFBO(II)V
    .locals 1

    .line 139
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightMap:Lbox2dLight/LightMap;

    if-eqz v0, :cond_0

    .line 140
    invoke-virtual {v0}, Lbox2dLight/LightMap;->dispose()V

    .line 142
    :cond_0
    new-instance v0, Lbox2dLight/LightMap;

    invoke-direct {v0, p0, p1, p2}, Lbox2dLight/LightMap;-><init>(Lbox2dLight/RayHandler;II)V

    iput-object v0, p0, Lbox2dLight/RayHandler;->lightMap:Lbox2dLight/LightMap;

    return-void
.end method

.method public setAmbientLight(F)V
    .locals 3

    .line 474
    iget-object v0, p0, Lbox2dLight/RayHandler;->ambientLight:Lcom/badlogic/gdx/graphics/Color;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {p1, v1, v2}, Lcom/badlogic/gdx/math/MathUtils;->clamp(FFF)F

    move-result p1

    iput p1, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    return-void
.end method

.method public setAmbientLight(FFFF)V
    .locals 1

    .line 496
    iget-object v0, p0, Lbox2dLight/RayHandler;->ambientLight:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public setAmbientLight(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 1

    .line 513
    iget-object v0, p0, Lbox2dLight/RayHandler;->ambientLight:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public setBlur(Z)V
    .locals 0

    .line 439
    iput-boolean p1, p0, Lbox2dLight/RayHandler;->blur:Z

    return-void
.end method

.method public setBlurNum(I)V
    .locals 0

    .line 453
    iput p1, p0, Lbox2dLight/RayHandler;->blurNum:I

    return-void
.end method

.method public setCombinedMatrix(Lcom/badlogic/gdx/graphics/OrthographicCamera;)V
    .locals 6

    .line 159
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->combined:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v0, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget-object v0, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v3, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v0, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportWidth:F

    iget v4, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    mul-float v4, v4, v0

    iget v0, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportHeight:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    mul-float v5, v0, p1

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lbox2dLight/RayHandler;->setCombinedMatrix(Lcom/badlogic/gdx/math/Matrix4;FFFF)V

    return-void
.end method

.method public setCombinedMatrix(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 185
    iget-object v0, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v1, p0, Lbox2dLight/RayHandler;->combined:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v1, v1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x0

    const/16 v3, 0x10

    invoke-static {v0, v2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 188
    iget-object v0, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    aget v0, v0, v2

    const/high16 v1, 0x3f800000    # 1.0f

    div-float v0, v1, v0

    neg-float v2, v0

    .line 191
    iget-object v3, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v4, 0xc

    aget v3, v3, v4

    mul-float v2, v2, v3

    sub-float v3, v2, v0

    .line 192
    iput v3, p0, Lbox2dLight/RayHandler;->x1:F

    add-float/2addr v2, v0

    .line 193
    iput v2, p0, Lbox2dLight/RayHandler;->x2:F

    .line 195
    iget-object v0, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x5

    aget v0, v0, v2

    div-float/2addr v1, v0

    neg-float v0, v1

    .line 198
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v2, 0xd

    aget p1, p1, v2

    mul-float v0, v0, p1

    sub-float p1, v0, v1

    .line 199
    iput p1, p0, Lbox2dLight/RayHandler;->y1:F

    add-float/2addr v0, v1

    .line 200
    iput v0, p0, Lbox2dLight/RayHandler;->y2:F

    return-void
.end method

.method public setCombinedMatrix(Lcom/badlogic/gdx/math/Matrix4;FFFF)V
    .locals 3

    .line 229
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v0, p0, Lbox2dLight/RayHandler;->combined:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v0, v0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    const/16 v2, 0x10

    invoke-static {p1, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/high16 p1, 0x3f000000    # 0.5f

    mul-float p4, p4, p1

    sub-float v0, p2, p4

    .line 232
    iput v0, p0, Lbox2dLight/RayHandler;->x1:F

    add-float/2addr p2, p4

    .line 233
    iput p2, p0, Lbox2dLight/RayHandler;->x2:F

    mul-float p5, p5, p1

    sub-float p1, p3, p5

    .line 236
    iput p1, p0, Lbox2dLight/RayHandler;->y1:F

    add-float/2addr p3, p5

    .line 237
    iput p3, p0, Lbox2dLight/RayHandler;->y2:F

    return-void
.end method

.method public setCulling(Z)V
    .locals 0

    .line 425
    iput-boolean p1, p0, Lbox2dLight/RayHandler;->culling:Z

    return-void
.end method

.method public setLightMapRendering(Z)V
    .locals 1

    .line 587
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightMap:Lbox2dLight/LightMap;

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, v0, Lbox2dLight/LightMap;->lightMapDrawingDisabled:Z

    return-void
.end method

.method public setLightShader(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 0

    .line 414
    iput-object p1, p0, Lbox2dLight/RayHandler;->customLightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    return-void
.end method

.method public setShadows(Z)V
    .locals 0

    .line 460
    iput-boolean p1, p0, Lbox2dLight/RayHandler;->shadows:Z

    return-void
.end method

.method public setWorld(Lcom/badlogic/gdx/physics/box2d/World;)V
    .locals 0

    .line 520
    iput-object p1, p0, Lbox2dLight/RayHandler;->world:Lcom/badlogic/gdx/physics/box2d/World;

    return-void
.end method

.method public update()V
    .locals 2

    .line 281
    iget-object v0, p0, Lbox2dLight/RayHandler;->lightList:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbox2dLight/Light;

    .line 282
    invoke-virtual {v1}, Lbox2dLight/Light;->update()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public updateAndRender()V
    .locals 0

    .line 268
    invoke-virtual {p0}, Lbox2dLight/RayHandler;->update()V

    .line 269
    invoke-virtual {p0}, Lbox2dLight/RayHandler;->render()V

    return-void
.end method

.method protected updateLightShader()V
    .locals 0

    return-void
.end method

.method protected updateLightShaderPerLight(Lbox2dLight/Light;)V
    .locals 0

    return-void
.end method

.method public useCustomViewport(IIII)V
    .locals 1

    const/4 v0, 0x1

    .line 560
    iput-boolean v0, p0, Lbox2dLight/RayHandler;->customViewport:Z

    .line 561
    iput p1, p0, Lbox2dLight/RayHandler;->viewportX:I

    .line 562
    iput p2, p0, Lbox2dLight/RayHandler;->viewportY:I

    .line 563
    iput p3, p0, Lbox2dLight/RayHandler;->viewportWidth:I

    .line 564
    iput p4, p0, Lbox2dLight/RayHandler;->viewportHeight:I

    return-void
.end method

.method public useDefaultViewport()V
    .locals 1

    const/4 v0, 0x0

    .line 573
    iput-boolean v0, p0, Lbox2dLight/RayHandler;->customViewport:Z

    return-void
.end method
