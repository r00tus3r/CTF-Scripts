.class public Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;
.super Ljava/lang/Object;
.source "PolygonSpriteBatch.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g2d/PolygonBatch;


# instance fields
.field private blendDstFunc:I

.field private blendDstFuncAlpha:I

.field private blendSrcFunc:I

.field private blendSrcFuncAlpha:I

.field private blendingDisabled:Z

.field private final color:Lcom/badlogic/gdx/graphics/Color;

.field colorPacked:F

.field private final combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

.field private customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

.field private drawing:Z

.field private invTexHeight:F

.field private invTexWidth:F

.field private lastTexture:Lcom/badlogic/gdx/graphics/Texture;

.field public maxTrianglesInBatch:I

.field private mesh:Lcom/badlogic/gdx/graphics/Mesh;

.field private ownsShader:Z

.field private final projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

.field public renderCalls:I

.field private final shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

.field public totalRenderCalls:I

.field private final transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

.field private triangleIndex:I

.field private final triangles:[S

.field private vertexIndex:I

.field private final vertices:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x7d0

    const/4 v1, 0x0

    .line 97
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;-><init>(ILcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    mul-int/lit8 v0, p1, 0x2

    const/4 v1, 0x0

    .line 104
    invoke-direct {p0, p1, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;-><init>(IILcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    return-void
.end method

.method public constructor <init>(IILcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 10

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 65
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->invTexWidth:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->invTexHeight:F

    .line 68
    new-instance v1, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    .line 69
    new-instance v1, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    .line 70
    new-instance v1, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    const/16 v1, 0x302

    .line 73
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendSrcFunc:I

    const/16 v2, 0x303

    .line 74
    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendDstFunc:I

    .line 75
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendSrcFuncAlpha:I

    .line 76
    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendDstFuncAlpha:I

    .line 82
    new-instance v1, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v2, v2, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 83
    sget v1, Lcom/badlogic/gdx/graphics/Color;->WHITE_FLOAT_BITS:F

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    const/4 v1, 0x0

    .line 86
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->renderCalls:I

    .line 89
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->totalRenderCalls:I

    .line 92
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->maxTrianglesInBatch:I

    const/16 v2, 0x7fff

    if-gt p1, v2, :cond_2

    .line 129
    sget-object v2, Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;->VertexArray:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    .line 130
    sget-object v3, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    if-eqz v3, :cond_0

    .line 131
    sget-object v2, Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;->VertexBufferObjectWithVAO:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    :cond_0
    move-object v4, v2

    .line 133
    new-instance v2, Lcom/badlogic/gdx/graphics/Mesh;

    const/4 v5, 0x0

    const/4 v3, 0x3

    mul-int/lit8 p2, p2, 0x3

    new-array v8, v3, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v3, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/4 v6, 0x2

    const/4 v9, 0x1

    const-string v7, "a_position"

    invoke-direct {v3, v9, v6, v7}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v3, v8, v1

    new-instance v1, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/4 v3, 0x4

    const-string v7, "a_color"

    invoke-direct {v1, v3, v3, v7}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v1, v8, v9

    new-instance v1, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/16 v3, 0x10

    const-string v7, "a_texCoord0"

    invoke-direct {v1, v3, v6, v7}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v1, v8, v6

    move-object v3, v2

    move v6, p1

    move v7, p2

    invoke-direct/range {v3 .. v8}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    iput-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    mul-int/lit8 p1, p1, 0x5

    .line 138
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 139
    new-array p1, p2, [S

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    if-nez p3, :cond_1

    .line 142
    invoke-static {}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->createDefaultShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 143
    iput-boolean v9, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->ownsShader:Z

    goto :goto_0

    .line 145
    :cond_1
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 147
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    sget-object p2, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {p2}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result p2

    int-to-float p2, p2

    sget-object p3, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {p3}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result p3

    int-to-float p3, p3

    invoke-virtual {p1, v0, v0, p2, p3}, Lcom/badlogic/gdx/math/Matrix4;->setToOrtho2D(FFFF)Lcom/badlogic/gdx/math/Matrix4;

    return-void

    .line 127
    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Can\'t have more than 32767 vertices per batch: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public constructor <init>(ILcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    mul-int/lit8 v0, p1, 0x2

    .line 111
    invoke-direct {p0, p1, v0, p2}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;-><init>(IILcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    return-void
.end method

.method private setupMatrices()V
    .locals 5

    .line 1308
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Matrix4;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 1309
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const/4 v1, 0x0

    const-string v2, "u_texture"

    const-string v3, "u_projTrans"

    if-eqz v0, :cond_0

    .line 1310
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix(Ljava/lang/String;Lcom/badlogic/gdx/math/Matrix4;)V

    .line 1311
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(Ljava/lang/String;I)V

    goto :goto_0

    .line 1313
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix(Ljava/lang/String;Lcom/badlogic/gdx/math/Matrix4;)V

    .line 1314
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(Ljava/lang/String;I)V

    :goto_0
    return-void
.end method

.method private switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 2

    .line 1319
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 1320
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    .line 1321
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float v0, v1, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->invTexWidth:F

    .line 1322
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v1, p1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->invTexHeight:F

    return-void
.end method


# virtual methods
.method public begin()V
    .locals 2

    .line 152
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 153
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->renderCalls:I

    .line 155
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/GL20;->glDepthMask(Z)V

    .line 156
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v0, :cond_0

    .line 157
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    goto :goto_0

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 160
    :goto_0
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->setupMatrices()V

    const/4 v0, 0x1

    .line 162
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    return-void

    .line 152
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "PolygonSpriteBatch.end must be called before begin."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public disableBlending()V
    .locals 1

    .line 1231
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    const/4 v0, 0x1

    .line 1232
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendingDisabled:Z

    return-void
.end method

.method public dispose()V
    .locals 1

    .line 1279
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    .line 1280
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->ownsShader:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->dispose()V

    :cond_0
    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FF)V
    .locals 7

    .line 688
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    int-to-float v5, v0

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v0

    int-to-float v6, v0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    invoke-virtual/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->draw(Lcom/badlogic/gdx/graphics/Texture;FFFF)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FFFF)V
    .locals 7

    .line 693
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v0, :cond_3

    .line 695
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 696
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 698
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq p1, v2, :cond_0

    .line 699
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 700
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/lit8 p1, p1, 0x6

    array-length v2, v0

    if-gt p1, v2, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 p1, p1, 0x14

    array-length v2, v1

    if-le p1, v2, :cond_2

    .line 701
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 703
    :cond_2
    :goto_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 704
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    div-int/lit8 v3, v2, 0x5

    add-int/lit8 v4, p1, 0x1

    int-to-short v5, v3

    .line 705
    aput-short v5, v0, p1

    add-int/lit8 p1, v4, 0x1

    add-int/lit8 v6, v3, 0x1

    int-to-short v6, v6

    .line 706
    aput-short v6, v0, v4

    add-int/lit8 v4, p1, 0x1

    add-int/lit8 v6, v3, 0x2

    int-to-short v6, v6

    .line 707
    aput-short v6, v0, p1

    add-int/lit8 p1, v4, 0x1

    .line 708
    aput-short v6, v0, v4

    add-int/lit8 v4, p1, 0x1

    add-int/lit8 v3, v3, 0x3

    int-to-short v3, v3

    .line 709
    aput-short v3, v0, p1

    add-int/lit8 p1, v4, 0x1

    .line 710
    aput-short v5, v0, v4

    .line 711
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-float/2addr p4, p2

    add-float/2addr p5, p3

    .line 720
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    add-int/lit8 v0, v2, 0x1

    .line 722
    aput p2, v1, v2

    add-int/lit8 v2, v0, 0x1

    .line 723
    aput p3, v1, v0

    add-int/lit8 v0, v2, 0x1

    .line 724
    aput p1, v1, v2

    add-int/lit8 v2, v0, 0x1

    const/4 v3, 0x0

    .line 725
    aput v3, v1, v0

    add-int/lit8 v0, v2, 0x1

    const/high16 v4, 0x3f800000    # 1.0f

    .line 726
    aput v4, v1, v2

    add-int/lit8 v2, v0, 0x1

    .line 728
    aput p2, v1, v0

    add-int/lit8 p2, v2, 0x1

    .line 729
    aput p5, v1, v2

    add-int/lit8 v0, p2, 0x1

    .line 730
    aput p1, v1, p2

    add-int/lit8 p2, v0, 0x1

    .line 731
    aput v3, v1, v0

    add-int/lit8 v0, p2, 0x1

    .line 732
    aput v3, v1, p2

    add-int/lit8 p2, v0, 0x1

    .line 734
    aput p4, v1, v0

    add-int/lit8 v0, p2, 0x1

    .line 735
    aput p5, v1, p2

    add-int/lit8 p2, v0, 0x1

    .line 736
    aput p1, v1, v0

    add-int/lit8 p5, p2, 0x1

    .line 737
    aput v4, v1, p2

    add-int/lit8 p2, p5, 0x1

    .line 738
    aput v3, v1, p5

    add-int/lit8 p5, p2, 0x1

    .line 740
    aput p4, v1, p2

    add-int/lit8 p2, p5, 0x1

    .line 741
    aput p3, v1, p5

    add-int/lit8 p3, p2, 0x1

    .line 742
    aput p1, v1, p2

    add-int/lit8 p1, p3, 0x1

    .line 743
    aput v4, v1, p3

    add-int/lit8 p2, p1, 0x1

    .line 744
    aput v4, v1, p1

    .line 745
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 693
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FFFFFFFF)V
    .locals 9

    move-object v0, p0

    .line 635
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v1, :cond_3

    .line 637
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 638
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 640
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    move-object v4, p1

    if-eq v4, v3, :cond_0

    .line 641
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 642
    :cond_0
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/lit8 v3, v3, 0x6

    array-length v4, v1

    if-gt v3, v4, :cond_1

    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v3, v3, 0x14

    array-length v4, v2

    if-le v3, v4, :cond_2

    .line 643
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 645
    :cond_2
    :goto_0
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 646
    iget v4, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    div-int/lit8 v5, v4, 0x5

    add-int/lit8 v6, v3, 0x1

    int-to-short v7, v5

    .line 647
    aput-short v7, v1, v3

    add-int/lit8 v3, v6, 0x1

    add-int/lit8 v8, v5, 0x1

    int-to-short v8, v8

    .line 648
    aput-short v8, v1, v6

    add-int/lit8 v6, v3, 0x1

    add-int/lit8 v8, v5, 0x2

    int-to-short v8, v8

    .line 649
    aput-short v8, v1, v3

    add-int/lit8 v3, v6, 0x1

    .line 650
    aput-short v8, v1, v6

    add-int/lit8 v6, v3, 0x1

    add-int/lit8 v5, v5, 0x3

    int-to-short v5, v5

    .line 651
    aput-short v5, v1, v3

    add-int/lit8 v3, v6, 0x1

    .line 652
    aput-short v7, v1, v6

    .line 653
    iput v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-float v1, p2, p4

    add-float v3, p3, p5

    .line 658
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    add-int/lit8 v6, v4, 0x1

    .line 660
    aput p2, v2, v4

    add-int/lit8 v4, v6, 0x1

    .line 661
    aput p3, v2, v6

    add-int/lit8 v6, v4, 0x1

    .line 662
    aput v5, v2, v4

    add-int/lit8 v4, v6, 0x1

    .line 663
    aput p6, v2, v6

    add-int/lit8 v6, v4, 0x1

    .line 664
    aput p7, v2, v4

    add-int/lit8 v4, v6, 0x1

    .line 666
    aput p2, v2, v6

    add-int/lit8 v6, v4, 0x1

    .line 667
    aput v3, v2, v4

    add-int/lit8 v4, v6, 0x1

    .line 668
    aput v5, v2, v6

    add-int/lit8 v6, v4, 0x1

    .line 669
    aput p6, v2, v4

    add-int/lit8 v4, v6, 0x1

    .line 670
    aput p9, v2, v6

    add-int/lit8 v6, v4, 0x1

    .line 672
    aput v1, v2, v4

    add-int/lit8 v4, v6, 0x1

    .line 673
    aput v3, v2, v6

    add-int/lit8 v3, v4, 0x1

    .line 674
    aput v5, v2, v4

    add-int/lit8 v4, v3, 0x1

    .line 675
    aput p8, v2, v3

    add-int/lit8 v3, v4, 0x1

    .line 676
    aput p9, v2, v4

    add-int/lit8 v4, v3, 0x1

    .line 678
    aput v1, v2, v3

    add-int/lit8 v1, v4, 0x1

    .line 679
    aput p3, v2, v4

    add-int/lit8 v3, v1, 0x1

    .line 680
    aput v5, v2, v1

    add-int/lit8 v1, v3, 0x1

    .line 681
    aput p8, v2, v3

    add-int/lit8 v3, v1, 0x1

    .line 682
    aput p7, v2, v1

    .line 683
    iput v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 635
    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FFFFFFFFFIIIIZZ)V
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p4

    move/from16 v2, p5

    move/from16 v3, p11

    move/from16 v4, p12

    .line 367
    iget-boolean v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v5, :cond_8

    .line 369
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 370
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 372
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    move-object/from16 v8, p1

    if-eq v8, v7, :cond_0

    .line 373
    invoke-direct/range {p0 .. p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 374
    :cond_0
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/lit8 v7, v7, 0x6

    array-length v8, v5

    if-gt v7, v8, :cond_1

    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v7, v7, 0x14

    array-length v8, v6

    if-le v7, v8, :cond_2

    .line 375
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 377
    :cond_2
    :goto_0
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 378
    iget v8, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    div-int/lit8 v8, v8, 0x5

    add-int/lit8 v9, v7, 0x1

    int-to-short v10, v8

    .line 379
    aput-short v10, v5, v7

    add-int/lit8 v7, v9, 0x1

    add-int/lit8 v11, v8, 0x1

    int-to-short v11, v11

    .line 380
    aput-short v11, v5, v9

    add-int/lit8 v9, v7, 0x1

    add-int/lit8 v11, v8, 0x2

    int-to-short v11, v11

    .line 381
    aput-short v11, v5, v7

    add-int/lit8 v7, v9, 0x1

    .line 382
    aput-short v11, v5, v9

    add-int/lit8 v9, v7, 0x1

    add-int/lit8 v8, v8, 0x3

    int-to-short v8, v8

    .line 383
    aput-short v8, v5, v7

    add-int/lit8 v7, v9, 0x1

    .line 384
    aput-short v10, v5, v9

    .line 385
    iput v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-float v5, p2, v1

    add-float v7, p3, v2

    neg-float v8, v1

    neg-float v9, v2

    sub-float v1, p6, v1

    sub-float v2, p7, v2

    const/high16 v10, 0x3f800000    # 1.0f

    cmpl-float v11, p8, v10

    if-nez v11, :cond_3

    cmpl-float v10, p9, v10

    if-eqz v10, :cond_4

    :cond_3
    mul-float v8, v8, p8

    mul-float v9, v9, p9

    mul-float v1, v1, p8

    mul-float v2, v2, p9

    :cond_4
    const/4 v10, 0x0

    cmpl-float v10, p10, v10

    if-eqz v10, :cond_5

    .line 424
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v10

    .line 425
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v11

    mul-float v12, v10, v8

    mul-float v13, v11, v9

    sub-float v13, v12, v13

    mul-float v8, v8, v11

    mul-float v9, v9, v10

    add-float/2addr v9, v8

    mul-float v14, v11, v2

    sub-float/2addr v12, v14

    mul-float v2, v2, v10

    add-float/2addr v8, v2

    mul-float v10, v10, v1

    sub-float/2addr v10, v14

    mul-float v11, v11, v1

    add-float/2addr v2, v11

    sub-float v1, v10, v12

    add-float/2addr v1, v13

    sub-float v11, v8, v9

    sub-float v11, v2, v11

    move/from16 v17, v11

    move v11, v1

    move v1, v10

    move v10, v2

    move v2, v8

    move v8, v13

    move/from16 v13, v17

    goto :goto_1

    :cond_5
    move v11, v1

    move v10, v2

    move v12, v8

    move v13, v9

    :goto_1
    add-float/2addr v8, v5

    add-float/2addr v9, v7

    add-float/2addr v12, v5

    add-float/2addr v2, v7

    add-float/2addr v1, v5

    add-float/2addr v10, v7

    add-float/2addr v11, v5

    add-float/2addr v13, v7

    int-to-float v5, v3

    .line 461
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->invTexWidth:F

    mul-float v5, v5, v7

    add-int v14, v4, p14

    int-to-float v14, v14

    .line 462
    iget v15, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->invTexHeight:F

    mul-float v14, v14, v15

    add-int v3, v3, p13

    int-to-float v3, v3

    mul-float v3, v3, v7

    int-to-float v4, v4

    mul-float v4, v4, v15

    if-eqz p15, :cond_6

    goto :goto_2

    :cond_6
    move/from16 v17, v5

    move v5, v3

    move/from16 v3, v17

    :goto_2
    if-eqz p16, :cond_7

    goto :goto_3

    :cond_7
    move/from16 v17, v14

    move v14, v4

    move/from16 v4, v17

    .line 478
    :goto_3
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    .line 479
    iget v15, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v16, v15, 0x1

    .line 480
    aput v8, v6, v15

    add-int/lit8 v8, v16, 0x1

    .line 481
    aput v9, v6, v16

    add-int/lit8 v9, v8, 0x1

    .line 482
    aput v7, v6, v8

    add-int/lit8 v8, v9, 0x1

    .line 483
    aput v3, v6, v9

    add-int/lit8 v9, v8, 0x1

    .line 484
    aput v4, v6, v8

    add-int/lit8 v8, v9, 0x1

    .line 486
    aput v12, v6, v9

    add-int/lit8 v9, v8, 0x1

    .line 487
    aput v2, v6, v8

    add-int/lit8 v2, v9, 0x1

    .line 488
    aput v7, v6, v9

    add-int/lit8 v8, v2, 0x1

    .line 489
    aput v3, v6, v2

    add-int/lit8 v2, v8, 0x1

    .line 490
    aput v14, v6, v8

    add-int/lit8 v3, v2, 0x1

    .line 492
    aput v1, v6, v2

    add-int/lit8 v1, v3, 0x1

    .line 493
    aput v10, v6, v3

    add-int/lit8 v2, v1, 0x1

    .line 494
    aput v7, v6, v1

    add-int/lit8 v1, v2, 0x1

    .line 495
    aput v5, v6, v2

    add-int/lit8 v2, v1, 0x1

    .line 496
    aput v14, v6, v1

    add-int/lit8 v1, v2, 0x1

    .line 498
    aput v11, v6, v2

    add-int/lit8 v2, v1, 0x1

    .line 499
    aput v13, v6, v1

    add-int/lit8 v1, v2, 0x1

    .line 500
    aput v7, v6, v2

    add-int/lit8 v2, v1, 0x1

    .line 501
    aput v5, v6, v1

    add-int/lit8 v1, v2, 0x1

    .line 502
    aput v4, v6, v2

    .line 503
    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 367
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FFFFIIIIZZ)V
    .locals 12

    move-object v0, p0

    move/from16 v1, p6

    move/from16 v2, p7

    .line 509
    iget-boolean v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v3, :cond_5

    .line 511
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 512
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 514
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    move-object v6, p1

    if-eq v6, v5, :cond_0

    .line 515
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 516
    :cond_0
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/lit8 v5, v5, 0x6

    array-length v6, v3

    if-gt v5, v6, :cond_1

    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v5, v5, 0x14

    array-length v6, v4

    if-le v5, v6, :cond_2

    .line 517
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 519
    :cond_2
    :goto_0
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 520
    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    div-int/lit8 v6, v6, 0x5

    add-int/lit8 v7, v5, 0x1

    int-to-short v8, v6

    .line 521
    aput-short v8, v3, v5

    add-int/lit8 v5, v7, 0x1

    add-int/lit8 v9, v6, 0x1

    int-to-short v9, v9

    .line 522
    aput-short v9, v3, v7

    add-int/lit8 v7, v5, 0x1

    add-int/lit8 v9, v6, 0x2

    int-to-short v9, v9

    .line 523
    aput-short v9, v3, v5

    add-int/lit8 v5, v7, 0x1

    .line 524
    aput-short v9, v3, v7

    add-int/lit8 v7, v5, 0x1

    add-int/lit8 v6, v6, 0x3

    int-to-short v6, v6

    .line 525
    aput-short v6, v3, v5

    add-int/lit8 v5, v7, 0x1

    .line 526
    aput-short v8, v3, v7

    .line 527
    iput v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    int-to-float v3, v1

    .line 529
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->invTexWidth:F

    mul-float v3, v3, v5

    add-int v6, v2, p9

    int-to-float v6, v6

    .line 530
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->invTexHeight:F

    mul-float v6, v6, v7

    add-int v1, v1, p8

    int-to-float v1, v1

    mul-float v1, v1, v5

    int-to-float v2, v2

    mul-float v2, v2, v7

    add-float v5, p2, p4

    add-float v7, p3, p5

    if-eqz p10, :cond_3

    goto :goto_1

    :cond_3
    move v11, v3

    move v3, v1

    move v1, v11

    :goto_1
    if-eqz p11, :cond_4

    move v11, v6

    move v6, v2

    move v2, v11

    .line 548
    :cond_4
    iget v8, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    .line 549
    iget v9, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v10, v9, 0x1

    .line 550
    aput p2, v4, v9

    add-int/lit8 v9, v10, 0x1

    .line 551
    aput p3, v4, v10

    add-int/lit8 v10, v9, 0x1

    .line 552
    aput v8, v4, v9

    add-int/lit8 v9, v10, 0x1

    .line 553
    aput v1, v4, v10

    add-int/lit8 v10, v9, 0x1

    .line 554
    aput v6, v4, v9

    add-int/lit8 v9, v10, 0x1

    .line 556
    aput p2, v4, v10

    add-int/lit8 v10, v9, 0x1

    .line 557
    aput v7, v4, v9

    add-int/lit8 v9, v10, 0x1

    .line 558
    aput v8, v4, v10

    add-int/lit8 v10, v9, 0x1

    .line 559
    aput v1, v4, v9

    add-int/lit8 v1, v10, 0x1

    .line 560
    aput v2, v4, v10

    add-int/lit8 v9, v1, 0x1

    .line 562
    aput v5, v4, v1

    add-int/lit8 v1, v9, 0x1

    .line 563
    aput v7, v4, v9

    add-int/lit8 v7, v1, 0x1

    .line 564
    aput v8, v4, v1

    add-int/lit8 v1, v7, 0x1

    .line 565
    aput v3, v4, v7

    add-int/lit8 v7, v1, 0x1

    .line 566
    aput v2, v4, v1

    add-int/lit8 v1, v7, 0x1

    .line 568
    aput v5, v4, v7

    add-int/lit8 v2, v1, 0x1

    .line 569
    aput p3, v4, v1

    add-int/lit8 v1, v2, 0x1

    .line 570
    aput v8, v4, v2

    add-int/lit8 v2, v1, 0x1

    .line 571
    aput v3, v4, v1

    add-int/lit8 v1, v2, 0x1

    .line 572
    aput v6, v4, v2

    .line 573
    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 509
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FFIIII)V
    .locals 7

    .line 578
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v0, :cond_3

    .line 580
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 581
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 583
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq p1, v2, :cond_0

    .line 584
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 585
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/lit8 p1, p1, 0x6

    array-length v2, v0

    if-gt p1, v2, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 p1, p1, 0x14

    array-length v2, v1

    if-le p1, v2, :cond_2

    .line 586
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 588
    :cond_2
    :goto_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 589
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    div-int/lit8 v3, v2, 0x5

    add-int/lit8 v4, p1, 0x1

    int-to-short v5, v3

    .line 590
    aput-short v5, v0, p1

    add-int/lit8 p1, v4, 0x1

    add-int/lit8 v6, v3, 0x1

    int-to-short v6, v6

    .line 591
    aput-short v6, v0, v4

    add-int/lit8 v4, p1, 0x1

    add-int/lit8 v6, v3, 0x2

    int-to-short v6, v6

    .line 592
    aput-short v6, v0, p1

    add-int/lit8 p1, v4, 0x1

    .line 593
    aput-short v6, v0, v4

    add-int/lit8 v4, p1, 0x1

    add-int/lit8 v3, v3, 0x3

    int-to-short v3, v3

    .line 594
    aput-short v3, v0, p1

    add-int/lit8 p1, v4, 0x1

    .line 595
    aput-short v5, v0, v4

    .line 596
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    int-to-float p1, p4

    .line 598
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->invTexWidth:F

    mul-float p1, p1, v0

    add-int v3, p5, p7

    int-to-float v3, v3

    .line 599
    iget v4, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->invTexHeight:F

    mul-float v3, v3, v4

    add-int/2addr p4, p6

    int-to-float p4, p4

    mul-float p4, p4, v0

    int-to-float p5, p5

    mul-float p5, p5, v4

    int-to-float p6, p6

    add-float/2addr p6, p2

    int-to-float p7, p7

    add-float/2addr p7, p3

    .line 605
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    add-int/lit8 v4, v2, 0x1

    .line 607
    aput p2, v1, v2

    add-int/lit8 v2, v4, 0x1

    .line 608
    aput p3, v1, v4

    add-int/lit8 v4, v2, 0x1

    .line 609
    aput v0, v1, v2

    add-int/lit8 v2, v4, 0x1

    .line 610
    aput p1, v1, v4

    add-int/lit8 v4, v2, 0x1

    .line 611
    aput v3, v1, v2

    add-int/lit8 v2, v4, 0x1

    .line 613
    aput p2, v1, v4

    add-int/lit8 p2, v2, 0x1

    .line 614
    aput p7, v1, v2

    add-int/lit8 v2, p2, 0x1

    .line 615
    aput v0, v1, p2

    add-int/lit8 p2, v2, 0x1

    .line 616
    aput p1, v1, v2

    add-int/lit8 p1, p2, 0x1

    .line 617
    aput p5, v1, p2

    add-int/lit8 p2, p1, 0x1

    .line 619
    aput p6, v1, p1

    add-int/lit8 p1, p2, 0x1

    .line 620
    aput p7, v1, p2

    add-int/lit8 p2, p1, 0x1

    .line 621
    aput v0, v1, p1

    add-int/lit8 p1, p2, 0x1

    .line 622
    aput p4, v1, p2

    add-int/lit8 p2, p1, 0x1

    .line 623
    aput p5, v1, p1

    add-int/lit8 p1, p2, 0x1

    .line 625
    aput p6, v1, p2

    add-int/lit8 p2, p1, 0x1

    .line 626
    aput p3, v1, p1

    add-int/lit8 p1, p2, 0x1

    .line 627
    aput v0, v1, p2

    add-int/lit8 p2, p1, 0x1

    .line 628
    aput p4, v1, p1

    add-int/lit8 p1, p2, 0x1

    .line 629
    aput v3, v1, p2

    .line 630
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 578
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;[FII)V
    .locals 8

    .line 750
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v0, :cond_5

    .line 752
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 753
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 755
    div-int/lit8 v2, p4, 0x14

    mul-int/lit8 v2, v2, 0x6

    .line 757
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq p1, v3, :cond_0

    .line 758
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    .line 759
    array-length p1, v1

    array-length v2, v1

    rem-int/lit8 v2, v2, 0x14

    sub-int/2addr p1, v2

    invoke-static {p4, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    array-length v2, v0

    div-int/lit8 v2, v2, 0x6

    mul-int/lit8 v2, v2, 0x14

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 760
    div-int/lit8 v2, p1, 0x14

    :goto_0
    mul-int/lit8 v2, v2, 0x6

    goto :goto_2

    .line 761
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/2addr p1, v2

    array-length v3, v0

    if-gt p1, v3, :cond_2

    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/2addr p1, p4

    array-length v3, v1

    if-le p1, v3, :cond_1

    goto :goto_1

    :cond_1
    move p1, p4

    goto :goto_2

    .line 762
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 763
    array-length p1, v1

    array-length v2, v1

    rem-int/lit8 v2, v2, 0x14

    sub-int/2addr p1, v2

    invoke-static {p4, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    array-length v2, v0

    div-int/lit8 v2, v2, 0x6

    mul-int/lit8 v2, v2, 0x14

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 764
    div-int/lit8 v2, p1, 0x14

    goto :goto_0

    .line 768
    :goto_2
    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    .line 769
    div-int/lit8 v4, v3, 0x5

    int-to-short v4, v4

    .line 770
    iget v5, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/2addr v2, v5

    :goto_3
    if-ge v5, v2, :cond_3

    .line 772
    aput-short v4, v0, v5

    add-int/lit8 v6, v5, 0x1

    add-int/lit8 v7, v4, 0x1

    int-to-short v7, v7

    .line 773
    aput-short v7, v0, v6

    add-int/lit8 v6, v5, 0x2

    add-int/lit8 v7, v4, 0x2

    int-to-short v7, v7

    .line 774
    aput-short v7, v0, v6

    add-int/lit8 v6, v5, 0x3

    .line 775
    aput-short v7, v0, v6

    add-int/lit8 v6, v5, 0x4

    add-int/lit8 v7, v4, 0x3

    int-to-short v7, v7

    .line 776
    aput-short v7, v0, v6

    add-int/lit8 v6, v5, 0x5

    .line 777
    aput-short v4, v0, v6

    add-int/lit8 v5, v5, 0x6

    add-int/lit8 v4, v4, 0x4

    int-to-short v4, v4

    goto :goto_3

    .line 781
    :cond_3
    :goto_4
    invoke-static {p2, p3, v1, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v3, p1

    .line 782
    iput v3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    .line 783
    iput v5, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    sub-int/2addr p4, p1

    if-nez p4, :cond_4

    return-void

    :cond_4
    add-int/2addr p3, p1

    .line 787
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    const/4 v3, 0x0

    if-le p1, p4, :cond_3

    .line 790
    array-length p1, v0

    div-int/lit8 p1, p1, 0x6

    mul-int/lit8 p1, p1, 0x14

    invoke-static {p4, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 791
    div-int/lit8 v2, p1, 0x14

    mul-int/lit8 v5, v2, 0x6

    goto :goto_4

    .line 750
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :goto_5
    throw p1

    :goto_6
    goto :goto_5
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;[FII[SII)V
    .locals 6

    .line 342
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v0, :cond_4

    .line 344
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 345
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 347
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq p1, v2, :cond_0

    .line 348
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 349
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/2addr p1, p7

    array-length v2, v0

    if-gt p1, v2, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/2addr p1, p4

    array-length v2, v1

    if-le p1, v2, :cond_2

    .line 350
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 352
    :cond_2
    :goto_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 353
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    .line 354
    div-int/lit8 v3, v2, 0x5

    add-int/2addr p7, p6

    :goto_1
    if-ge p6, p7, :cond_3

    add-int/lit8 v4, p1, 0x1

    .line 357
    aget-short v5, p5, p6

    add-int/2addr v5, v3

    int-to-short v5, v5

    aput-short v5, v0, p1

    add-int/lit8 p6, p6, 0x1

    move p1, v4

    goto :goto_1

    .line 358
    :cond_3
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 360
    invoke-static {p2, p3, v1, v2, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 361
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/2addr p1, p4

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 342
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;FF)V
    .locals 12

    .line 212
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v0, :cond_5

    .line 214
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 215
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->triangles:[S

    .line 216
    array-length v2, v1

    .line 217
    iget-object v3, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->vertices:[F

    .line 218
    array-length v4, v3

    .line 220
    iget-object v5, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 221
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq v5, v6, :cond_0

    .line 222
    invoke-direct {p0, v5}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 223
    :cond_0
    iget v5, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/2addr v5, v2

    array-length v6, v0

    if-gt v5, v6, :cond_1

    iget v5, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    mul-int/lit8 v6, v4, 0x5

    div-int/lit8 v6, v6, 0x2

    add-int/2addr v5, v6

    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    array-length v6, v6

    if-le v5, v6, :cond_2

    .line 224
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 226
    :cond_2
    :goto_0
    iget v5, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 227
    iget v6, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    .line 228
    div-int/lit8 v7, v6, 0x5

    const/4 v8, 0x0

    move v9, v5

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v2, :cond_3

    add-int/lit8 v10, v9, 0x1

    .line 231
    aget-short v11, v1, v5

    add-int/2addr v11, v7

    int-to-short v11, v11

    aput-short v11, v0, v9

    add-int/lit8 v5, v5, 0x1

    move v9, v10

    goto :goto_1

    .line 232
    :cond_3
    iput v9, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 234
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 235
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    .line 236
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->textureCoords:[F

    :goto_2
    if-ge v8, v4, :cond_4

    add-int/lit8 v2, v6, 0x1

    .line 239
    aget v5, v3, v8

    add-float/2addr v5, p2

    aput v5, v0, v6

    add-int/lit8 v5, v2, 0x1

    add-int/lit8 v6, v8, 0x1

    .line 240
    aget v7, v3, v6

    add-float/2addr v7, p3

    aput v7, v0, v2

    add-int/lit8 v2, v5, 0x1

    .line 241
    aput v1, v0, v5

    add-int/lit8 v5, v2, 0x1

    .line 242
    aget v7, p1, v8

    aput v7, v0, v2

    add-int/lit8 v2, v5, 0x1

    .line 243
    aget v6, p1, v6

    aput v6, v0, v5

    add-int/lit8 v8, v8, 0x2

    move v6, v2

    goto :goto_2

    .line 245
    :cond_4
    iput v6, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 212
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;FFFF)V
    .locals 15

    move-object v0, p0

    move-object/from16 v1, p1

    .line 250
    iget-boolean v2, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v2, :cond_5

    .line 252
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 253
    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->triangles:[S

    .line 254
    array-length v4, v3

    .line 255
    iget-object v5, v1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->vertices:[F

    .line 256
    array-length v6, v5

    .line 257
    iget-object v7, v1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    .line 259
    iget-object v8, v7, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 260
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq v8, v9, :cond_0

    .line 261
    invoke-direct {p0, v8}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 262
    :cond_0
    iget v8, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/2addr v8, v4

    array-length v4, v2

    if-gt v8, v4, :cond_1

    iget v4, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    mul-int/lit8 v8, v6, 0x5

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v4, v8

    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    array-length v8, v8

    if-le v4, v8, :cond_2

    .line 263
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 265
    :cond_2
    :goto_0
    iget v4, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 266
    iget v8, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    .line 267
    div-int/lit8 v9, v8, 0x5

    .line 269
    array-length v10, v3

    const/4 v11, 0x0

    move v12, v4

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v10, :cond_3

    add-int/lit8 v13, v12, 0x1

    .line 270
    aget-short v14, v3, v4

    add-int/2addr v14, v9

    int-to-short v14, v14

    aput-short v14, v2, v12

    add-int/lit8 v4, v4, 0x1

    move v12, v13

    goto :goto_1

    .line 271
    :cond_3
    iput v12, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 273
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 274
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    .line 275
    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->textureCoords:[F

    .line 276
    iget v4, v7, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionWidth:I

    int-to-float v4, v4

    div-float v4, p4, v4

    .line 277
    iget v7, v7, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionHeight:I

    int-to-float v7, v7

    div-float v7, p5, v7

    :goto_2
    if-ge v11, v6, :cond_4

    add-int/lit8 v9, v8, 0x1

    .line 280
    aget v10, v5, v11

    mul-float v10, v10, v4

    add-float v10, v10, p2

    aput v10, v2, v8

    add-int/lit8 v8, v9, 0x1

    add-int/lit8 v10, v11, 0x1

    .line 281
    aget v12, v5, v10

    mul-float v12, v12, v7

    add-float v12, v12, p3

    aput v12, v2, v9

    add-int/lit8 v9, v8, 0x1

    .line 282
    aput v3, v2, v8

    add-int/lit8 v8, v9, 0x1

    .line 283
    aget v12, v1, v11

    aput v12, v2, v9

    add-int/lit8 v9, v8, 0x1

    .line 284
    aget v10, v1, v10

    aput v10, v2, v8

    add-int/lit8 v11, v11, 0x2

    move v8, v9

    goto :goto_2

    .line 286
    :cond_4
    iput v8, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 250
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw v1

    :goto_4
    goto :goto_3
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;FFFFFFFFF)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 292
    iget-boolean v2, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v2, :cond_5

    .line 294
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 295
    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->triangles:[S

    .line 296
    array-length v4, v3

    .line 297
    iget-object v5, v1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->vertices:[F

    .line 298
    array-length v6, v5

    .line 299
    iget-object v7, v1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    .line 301
    iget-object v8, v7, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 302
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq v8, v9, :cond_0

    .line 303
    invoke-direct {v0, v8}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 304
    :cond_0
    iget v8, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/2addr v8, v4

    array-length v9, v2

    if-gt v8, v9, :cond_1

    iget v8, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    mul-int/lit8 v9, v6, 0x5

    div-int/lit8 v9, v9, 0x2

    add-int/2addr v8, v9

    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    array-length v9, v9

    if-le v8, v9, :cond_2

    .line 305
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 307
    :cond_2
    :goto_0
    iget v8, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 308
    iget v9, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    .line 309
    div-int/lit8 v10, v9, 0x5

    const/4 v11, 0x0

    move v12, v8

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v4, :cond_3

    add-int/lit8 v13, v12, 0x1

    .line 312
    aget-short v14, v3, v8

    add-int/2addr v14, v10

    int-to-short v14, v14

    aput-short v14, v2, v12

    add-int/lit8 v8, v8, 0x1

    move v12, v13

    goto :goto_1

    .line 313
    :cond_3
    iput v12, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 315
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 316
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    .line 317
    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->textureCoords:[F

    add-float v4, p2, p4

    add-float v8, p3, p5

    .line 321
    iget v10, v7, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionWidth:I

    int-to-float v10, v10

    div-float v10, p6, v10

    .line 322
    iget v7, v7, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionHeight:I

    int-to-float v7, v7

    div-float v7, p7, v7

    .line 323
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v12

    .line 324
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v13

    :goto_2
    if-ge v11, v6, :cond_4

    .line 328
    aget v14, v5, v11

    mul-float v14, v14, v10

    sub-float v14, v14, p4

    mul-float v14, v14, p8

    add-int/lit8 v15, v11, 0x1

    .line 329
    aget v16, v5, v15

    mul-float v16, v16, v7

    sub-float v16, v16, p5

    mul-float v16, v16, p9

    add-int/lit8 v17, v9, 0x1

    mul-float v18, v12, v14

    mul-float v19, v13, v16

    sub-float v18, v18, v19

    add-float v18, v18, v4

    .line 330
    aput v18, v2, v9

    add-int/lit8 v9, v17, 0x1

    mul-float v14, v14, v13

    mul-float v16, v16, v12

    add-float v14, v14, v16

    add-float/2addr v14, v8

    .line 331
    aput v14, v2, v17

    add-int/lit8 v14, v9, 0x1

    .line 332
    aput v3, v2, v9

    add-int/lit8 v9, v14, 0x1

    .line 333
    aget v16, v1, v11

    aput v16, v2, v14

    add-int/lit8 v14, v9, 0x1

    .line 334
    aget v15, v1, v15

    aput v15, v2, v9

    add-int/lit8 v11, v11, 0x2

    move v9, v14

    goto :goto_2

    .line 336
    :cond_4
    iput v9, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 292
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw v1

    :goto_4
    goto :goto_3
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FF)V
    .locals 7

    .line 798
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v0

    int-to-float v5, v0

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v0

    int-to-float v6, v0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    invoke-virtual/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFF)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFF)V
    .locals 7

    .line 803
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v0, :cond_3

    .line 805
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 806
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 808
    iget-object v2, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 809
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq v2, v3, :cond_0

    .line 810
    invoke-direct {p0, v2}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 811
    :cond_0
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/lit8 v2, v2, 0x6

    array-length v3, v0

    if-gt v2, v3, :cond_1

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v2, v2, 0x14

    array-length v3, v1

    if-le v2, v3, :cond_2

    .line 812
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 814
    :cond_2
    :goto_0
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 815
    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    div-int/lit8 v3, v3, 0x5

    add-int/lit8 v4, v2, 0x1

    int-to-short v5, v3

    .line 816
    aput-short v5, v0, v2

    add-int/lit8 v2, v4, 0x1

    add-int/lit8 v6, v3, 0x1

    int-to-short v6, v6

    .line 817
    aput-short v6, v0, v4

    add-int/lit8 v4, v2, 0x1

    add-int/lit8 v6, v3, 0x2

    int-to-short v6, v6

    .line 818
    aput-short v6, v0, v2

    add-int/lit8 v2, v4, 0x1

    .line 819
    aput-short v6, v0, v4

    add-int/lit8 v4, v2, 0x1

    add-int/lit8 v3, v3, 0x3

    int-to-short v3, v3

    .line 820
    aput-short v3, v0, v2

    add-int/lit8 v2, v4, 0x1

    .line 821
    aput-short v5, v0, v4

    .line 822
    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-float/2addr p4, p2

    add-float/2addr p5, p3

    .line 826
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 827
    iget v2, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 828
    iget v3, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 829
    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 831
    iget v4, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    .line 832
    iget v5, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v6, v5, 0x1

    .line 833
    aput p2, v1, v5

    add-int/lit8 v5, v6, 0x1

    .line 834
    aput p3, v1, v6

    add-int/lit8 v6, v5, 0x1

    .line 835
    aput v4, v1, v5

    add-int/lit8 v5, v6, 0x1

    .line 836
    aput v0, v1, v6

    add-int/lit8 v6, v5, 0x1

    .line 837
    aput v2, v1, v5

    add-int/lit8 v5, v6, 0x1

    .line 839
    aput p2, v1, v6

    add-int/lit8 p2, v5, 0x1

    .line 840
    aput p5, v1, v5

    add-int/lit8 v5, p2, 0x1

    .line 841
    aput v4, v1, p2

    add-int/lit8 p2, v5, 0x1

    .line 842
    aput v0, v1, v5

    add-int/lit8 v0, p2, 0x1

    .line 843
    aput p1, v1, p2

    add-int/lit8 p2, v0, 0x1

    .line 845
    aput p4, v1, v0

    add-int/lit8 v0, p2, 0x1

    .line 846
    aput p5, v1, p2

    add-int/lit8 p2, v0, 0x1

    .line 847
    aput v4, v1, v0

    add-int/lit8 p5, p2, 0x1

    .line 848
    aput v3, v1, p2

    add-int/lit8 p2, p5, 0x1

    .line 849
    aput p1, v1, p5

    add-int/lit8 p1, p2, 0x1

    .line 851
    aput p4, v1, p2

    add-int/lit8 p2, p1, 0x1

    .line 852
    aput p3, v1, p1

    add-int/lit8 p1, p2, 0x1

    .line 853
    aput v4, v1, p2

    add-int/lit8 p2, p1, 0x1

    .line 854
    aput v3, v1, p1

    add-int/lit8 p1, p2, 0x1

    .line 855
    aput v2, v1, p2

    .line 856
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 803
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFFFFFFF)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p4

    move/from16 v3, p5

    .line 862
    iget-boolean v4, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v4, :cond_6

    .line 864
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 865
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 867
    iget-object v6, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 868
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq v6, v7, :cond_0

    .line 869
    invoke-direct {v0, v6}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 870
    :cond_0
    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/lit8 v6, v6, 0x6

    array-length v7, v4

    if-gt v6, v7, :cond_1

    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v6, v6, 0x14

    array-length v7, v5

    if-le v6, v7, :cond_2

    .line 871
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 873
    :cond_2
    :goto_0
    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 874
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    div-int/lit8 v7, v7, 0x5

    add-int/lit8 v8, v6, 0x1

    int-to-short v9, v7

    .line 875
    aput-short v9, v4, v6

    add-int/lit8 v6, v8, 0x1

    add-int/lit8 v10, v7, 0x1

    int-to-short v10, v10

    .line 876
    aput-short v10, v4, v8

    add-int/lit8 v8, v6, 0x1

    add-int/lit8 v10, v7, 0x2

    int-to-short v10, v10

    .line 877
    aput-short v10, v4, v6

    add-int/lit8 v6, v8, 0x1

    .line 878
    aput-short v10, v4, v8

    add-int/lit8 v8, v6, 0x1

    add-int/lit8 v7, v7, 0x3

    int-to-short v7, v7

    .line 879
    aput-short v7, v4, v6

    add-int/lit8 v6, v8, 0x1

    .line 880
    aput-short v9, v4, v8

    .line 881
    iput v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-float v4, p2, v2

    add-float v6, p3, v3

    neg-float v7, v2

    neg-float v8, v3

    sub-float v2, p6, v2

    sub-float v3, p7, v3

    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v10, p8, v9

    if-nez v10, :cond_3

    cmpl-float v9, p9, v9

    if-eqz v9, :cond_4

    :cond_3
    mul-float v7, v7, p8

    mul-float v8, v8, p9

    mul-float v2, v2, p8

    mul-float v3, v3, p9

    :cond_4
    const/4 v9, 0x0

    cmpl-float v9, p10, v9

    if-eqz v9, :cond_5

    .line 920
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v9

    .line 921
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v10

    mul-float v11, v9, v7

    mul-float v12, v10, v8

    sub-float v12, v11, v12

    mul-float v7, v7, v10

    mul-float v8, v8, v9

    add-float/2addr v8, v7

    mul-float v13, v10, v3

    sub-float/2addr v11, v13

    mul-float v3, v3, v9

    add-float/2addr v7, v3

    mul-float v9, v9, v2

    sub-float/2addr v9, v13

    mul-float v10, v10, v2

    add-float/2addr v3, v10

    sub-float v2, v9, v11

    add-float/2addr v2, v12

    sub-float v10, v7, v8

    sub-float v10, v3, v10

    move/from16 v17, v10

    move v10, v2

    move v2, v3

    move v3, v7

    move v7, v12

    move/from16 v12, v17

    goto :goto_1

    :cond_5
    move v9, v2

    move v10, v9

    move v2, v3

    move v11, v7

    move v12, v8

    :goto_1
    add-float/2addr v7, v4

    add-float/2addr v8, v6

    add-float/2addr v11, v4

    add-float/2addr v3, v6

    add-float/2addr v9, v4

    add-float/2addr v2, v6

    add-float/2addr v10, v4

    add-float/2addr v12, v6

    .line 957
    iget v4, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 958
    iget v6, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 959
    iget v13, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 960
    iget v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 962
    iget v14, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    .line 963
    iget v15, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v16, v15, 0x1

    .line 964
    aput v7, v5, v15

    add-int/lit8 v7, v16, 0x1

    .line 965
    aput v8, v5, v16

    add-int/lit8 v8, v7, 0x1

    .line 966
    aput v14, v5, v7

    add-int/lit8 v7, v8, 0x1

    .line 967
    aput v4, v5, v8

    add-int/lit8 v8, v7, 0x1

    .line 968
    aput v6, v5, v7

    add-int/lit8 v7, v8, 0x1

    .line 970
    aput v11, v5, v8

    add-int/lit8 v8, v7, 0x1

    .line 971
    aput v3, v5, v7

    add-int/lit8 v3, v8, 0x1

    .line 972
    aput v14, v5, v8

    add-int/lit8 v7, v3, 0x1

    .line 973
    aput v4, v5, v3

    add-int/lit8 v3, v7, 0x1

    .line 974
    aput v1, v5, v7

    add-int/lit8 v4, v3, 0x1

    .line 976
    aput v9, v5, v3

    add-int/lit8 v3, v4, 0x1

    .line 977
    aput v2, v5, v4

    add-int/lit8 v2, v3, 0x1

    .line 978
    aput v14, v5, v3

    add-int/lit8 v3, v2, 0x1

    .line 979
    aput v13, v5, v2

    add-int/lit8 v2, v3, 0x1

    .line 980
    aput v1, v5, v3

    add-int/lit8 v1, v2, 0x1

    .line 982
    aput v10, v5, v2

    add-int/lit8 v2, v1, 0x1

    .line 983
    aput v12, v5, v1

    add-int/lit8 v1, v2, 0x1

    .line 984
    aput v14, v5, v2

    add-int/lit8 v2, v1, 0x1

    .line 985
    aput v13, v5, v1

    add-int/lit8 v1, v2, 0x1

    .line 986
    aput v6, v5, v2

    .line 987
    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 862
    :cond_6
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFFFFFFFZ)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p4

    move/from16 v3, p5

    .line 993
    iget-boolean v4, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v4, :cond_7

    .line 995
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 996
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 998
    iget-object v6, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 999
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq v6, v7, :cond_0

    .line 1000
    invoke-direct {v0, v6}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 1001
    :cond_0
    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/lit8 v6, v6, 0x6

    array-length v7, v4

    if-gt v6, v7, :cond_1

    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v6, v6, 0x14

    array-length v7, v5

    if-le v6, v7, :cond_2

    .line 1002
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 1004
    :cond_2
    :goto_0
    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 1005
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    div-int/lit8 v7, v7, 0x5

    add-int/lit8 v8, v6, 0x1

    int-to-short v9, v7

    .line 1006
    aput-short v9, v4, v6

    add-int/lit8 v6, v8, 0x1

    add-int/lit8 v10, v7, 0x1

    int-to-short v10, v10

    .line 1007
    aput-short v10, v4, v8

    add-int/lit8 v8, v6, 0x1

    add-int/lit8 v10, v7, 0x2

    int-to-short v10, v10

    .line 1008
    aput-short v10, v4, v6

    add-int/lit8 v6, v8, 0x1

    .line 1009
    aput-short v10, v4, v8

    add-int/lit8 v8, v6, 0x1

    add-int/lit8 v7, v7, 0x3

    int-to-short v7, v7

    .line 1010
    aput-short v7, v4, v6

    add-int/lit8 v6, v8, 0x1

    .line 1011
    aput-short v9, v4, v8

    .line 1012
    iput v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-float v4, p2, v2

    add-float v6, p3, v3

    neg-float v7, v2

    neg-float v8, v3

    sub-float v2, p6, v2

    sub-float v3, p7, v3

    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v10, p8, v9

    if-nez v10, :cond_3

    cmpl-float v9, p9, v9

    if-eqz v9, :cond_4

    :cond_3
    mul-float v7, v7, p8

    mul-float v8, v8, p9

    mul-float v2, v2, p8

    mul-float v3, v3, p9

    :cond_4
    const/4 v9, 0x0

    cmpl-float v9, p10, v9

    if-eqz v9, :cond_5

    .line 1051
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v9

    .line 1052
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v10

    mul-float v11, v9, v7

    mul-float v12, v10, v8

    sub-float v12, v11, v12

    mul-float v7, v7, v10

    mul-float v8, v8, v9

    add-float/2addr v8, v7

    mul-float v13, v10, v3

    sub-float/2addr v11, v13

    mul-float v3, v3, v9

    add-float/2addr v7, v3

    mul-float v9, v9, v2

    sub-float/2addr v9, v13

    mul-float v10, v10, v2

    add-float/2addr v3, v10

    sub-float v2, v9, v11

    add-float/2addr v2, v12

    sub-float v10, v7, v8

    sub-float v10, v3, v10

    move/from16 v19, v10

    move v10, v2

    move v2, v3

    move v3, v7

    move v7, v12

    move/from16 v12, v19

    goto :goto_1

    :cond_5
    move v9, v2

    move v10, v9

    move v2, v3

    move v11, v7

    move v12, v8

    :goto_1
    add-float/2addr v7, v4

    add-float/2addr v8, v6

    add-float/2addr v11, v4

    add-float/2addr v3, v6

    add-float/2addr v9, v4

    add-float/2addr v2, v6

    add-float/2addr v10, v4

    add-float/2addr v12, v6

    if-eqz p11, :cond_6

    .line 1090
    iget v4, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 1091
    iget v6, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 1092
    iget v13, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 1093
    iget v14, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 1094
    iget v15, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    move/from16 p2, v4

    .line 1095
    iget v4, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    move/from16 p3, v4

    .line 1096
    iget v4, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 1097
    iget v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    goto :goto_2

    .line 1099
    :cond_6
    iget v4, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 1100
    iget v6, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 1101
    iget v13, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 1102
    iget v14, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 1103
    iget v15, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    move/from16 p2, v4

    .line 1104
    iget v4, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    move/from16 p3, v4

    .line 1105
    iget v4, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 1106
    iget v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    :goto_2
    move/from16 v17, v1

    move/from16 v16, v4

    move/from16 v1, p2

    move/from16 v4, p3

    move/from16 p2, v12

    .line 1109
    iget v12, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    move/from16 p3, v10

    .line 1110
    iget v10, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v18, v10, 0x1

    .line 1111
    aput v7, v5, v10

    add-int/lit8 v7, v18, 0x1

    .line 1112
    aput v8, v5, v18

    add-int/lit8 v8, v7, 0x1

    .line 1113
    aput v12, v5, v7

    add-int/lit8 v7, v8, 0x1

    .line 1114
    aput v1, v5, v8

    add-int/lit8 v1, v7, 0x1

    .line 1115
    aput v6, v5, v7

    add-int/lit8 v6, v1, 0x1

    .line 1117
    aput v11, v5, v1

    add-int/lit8 v1, v6, 0x1

    .line 1118
    aput v3, v5, v6

    add-int/lit8 v3, v1, 0x1

    .line 1119
    aput v12, v5, v1

    add-int/lit8 v1, v3, 0x1

    .line 1120
    aput v13, v5, v3

    add-int/lit8 v3, v1, 0x1

    .line 1121
    aput v14, v5, v1

    add-int/lit8 v1, v3, 0x1

    .line 1123
    aput v9, v5, v3

    add-int/lit8 v3, v1, 0x1

    .line 1124
    aput v2, v5, v1

    add-int/lit8 v1, v3, 0x1

    .line 1125
    aput v12, v5, v3

    add-int/lit8 v2, v1, 0x1

    .line 1126
    aput v15, v5, v1

    add-int/lit8 v1, v2, 0x1

    .line 1127
    aput v4, v5, v2

    add-int/lit8 v2, v1, 0x1

    .line 1129
    aput p3, v5, v1

    add-int/lit8 v1, v2, 0x1

    .line 1130
    aput p2, v5, v2

    add-int/lit8 v2, v1, 0x1

    .line 1131
    aput v12, v5, v1

    add-int/lit8 v1, v2, 0x1

    .line 1132
    aput v16, v5, v2

    add-int/lit8 v2, v1, 0x1

    .line 1133
    aput v17, v5, v1

    .line 1134
    iput v2, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 993
    :cond_7
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFLcom/badlogic/gdx/math/Affine2;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    .line 1139
    iget-boolean v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v3, :cond_3

    .line 1141
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    .line 1142
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    .line 1144
    iget-object v5, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 1145
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq v5, v6, :cond_0

    .line 1146
    invoke-direct {v0, v5}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 1147
    :cond_0
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    add-int/lit8 v5, v5, 0x6

    array-length v6, v3

    if-gt v5, v6, :cond_1

    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v5, v5, 0x14

    array-length v6, v4

    if-le v5, v6, :cond_2

    .line 1148
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 1150
    :cond_2
    :goto_0
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 1151
    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    div-int/lit8 v6, v6, 0x5

    add-int/lit8 v7, v5, 0x1

    int-to-short v8, v6

    .line 1152
    aput-short v8, v3, v5

    add-int/lit8 v5, v7, 0x1

    add-int/lit8 v9, v6, 0x1

    int-to-short v9, v9

    .line 1153
    aput-short v9, v3, v7

    add-int/lit8 v7, v5, 0x1

    add-int/lit8 v9, v6, 0x2

    int-to-short v9, v9

    .line 1154
    aput-short v9, v3, v5

    add-int/lit8 v5, v7, 0x1

    .line 1155
    aput-short v9, v3, v7

    add-int/lit8 v7, v5, 0x1

    add-int/lit8 v6, v6, 0x3

    int-to-short v6, v6

    .line 1156
    aput-short v6, v3, v5

    add-int/lit8 v5, v7, 0x1

    .line 1157
    aput-short v8, v3, v7

    .line 1158
    iput v5, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 1161
    iget v3, v2, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 1162
    iget v5, v2, Lcom/badlogic/gdx/math/Affine2;->m12:F

    .line 1163
    iget v6, v2, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v6, v6, p3

    iget v7, v2, Lcom/badlogic/gdx/math/Affine2;->m02:F

    add-float/2addr v6, v7

    .line 1164
    iget v7, v2, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v7, v7, p3

    iget v8, v2, Lcom/badlogic/gdx/math/Affine2;->m12:F

    add-float/2addr v7, v8

    .line 1165
    iget v8, v2, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v8, v8, p2

    iget v9, v2, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v9, v9, p3

    add-float/2addr v8, v9

    iget v9, v2, Lcom/badlogic/gdx/math/Affine2;->m02:F

    add-float/2addr v8, v9

    .line 1166
    iget v9, v2, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v9, v9, p2

    iget v10, v2, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v10, v10, p3

    add-float/2addr v9, v10

    iget v10, v2, Lcom/badlogic/gdx/math/Affine2;->m12:F

    add-float/2addr v9, v10

    .line 1167
    iget v10, v2, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v10, v10, p2

    iget v11, v2, Lcom/badlogic/gdx/math/Affine2;->m02:F

    add-float/2addr v10, v11

    .line 1168
    iget v11, v2, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v11, v11, p2

    iget v2, v2, Lcom/badlogic/gdx/math/Affine2;->m12:F

    add-float/2addr v11, v2

    .line 1170
    iget v2, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 1171
    iget v12, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 1172
    iget v13, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 1173
    iget v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 1175
    iget v14, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    .line 1176
    iget v15, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    add-int/lit8 v16, v15, 0x1

    .line 1177
    aput v3, v4, v15

    add-int/lit8 v3, v16, 0x1

    .line 1178
    aput v5, v4, v16

    add-int/lit8 v5, v3, 0x1

    .line 1179
    aput v14, v4, v3

    add-int/lit8 v3, v5, 0x1

    .line 1180
    aput v2, v4, v5

    add-int/lit8 v5, v3, 0x1

    .line 1181
    aput v12, v4, v3

    add-int/lit8 v3, v5, 0x1

    .line 1183
    aput v6, v4, v5

    add-int/lit8 v5, v3, 0x1

    .line 1184
    aput v7, v4, v3

    add-int/lit8 v3, v5, 0x1

    .line 1185
    aput v14, v4, v5

    add-int/lit8 v5, v3, 0x1

    .line 1186
    aput v2, v4, v3

    add-int/lit8 v2, v5, 0x1

    .line 1187
    aput v1, v4, v5

    add-int/lit8 v3, v2, 0x1

    .line 1189
    aput v8, v4, v2

    add-int/lit8 v2, v3, 0x1

    .line 1190
    aput v9, v4, v3

    add-int/lit8 v3, v2, 0x1

    .line 1191
    aput v14, v4, v2

    add-int/lit8 v2, v3, 0x1

    .line 1192
    aput v13, v4, v3

    add-int/lit8 v3, v2, 0x1

    .line 1193
    aput v1, v4, v2

    add-int/lit8 v1, v3, 0x1

    .line 1195
    aput v10, v4, v3

    add-int/lit8 v2, v1, 0x1

    .line 1196
    aput v11, v4, v1

    add-int/lit8 v1, v2, 0x1

    .line 1197
    aput v14, v4, v2

    add-int/lit8 v2, v1, 0x1

    .line 1198
    aput v13, v4, v1

    add-int/lit8 v1, v2, 0x1

    .line 1199
    aput v12, v4, v2

    .line 1200
    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    return-void

    .line 1139
    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "PolygonSpriteBatch.begin must be called before draw."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public enableBlending()V
    .locals 1

    .line 1237
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    const/4 v0, 0x0

    .line 1238
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendingDisabled:Z

    return-void
.end method

.method public end()V
    .locals 2

    .line 167
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v0, :cond_3

    .line 168
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    :cond_0
    const/4 v0, 0x0

    .line 169
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    const/4 v0, 0x0

    .line 170
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    .line 172
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x1

    .line 173
    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDepthMask(Z)V

    .line 174
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->isBlendingEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0xbe2

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    .line 176
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v0, :cond_2

    .line 177
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    goto :goto_0

    .line 179
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    :goto_0
    return-void

    .line 167
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "PolygonSpriteBatch.begin must be called before end."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public flush()V
    .locals 8

    .line 1205
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    if-nez v0, :cond_0

    return-void

    .line 1207
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->renderCalls:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->renderCalls:I

    .line 1208
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->totalRenderCalls:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->totalRenderCalls:I

    .line 1209
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    .line 1210
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->maxTrianglesInBatch:I

    if-le v0, v1, :cond_1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->maxTrianglesInBatch:I

    .line 1212
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->bind()V

    .line 1213
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 1214
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertices:[F

    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;

    .line 1215
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangles:[S

    invoke-virtual {v1, v2, v4, v0}, Lcom/badlogic/gdx/graphics/Mesh;->setIndices([SII)Lcom/badlogic/gdx/graphics/Mesh;

    .line 1216
    iget-boolean v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendingDisabled:Z

    const/16 v3, 0xbe2

    if-eqz v2, :cond_2

    .line 1217
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    goto :goto_0

    .line 1219
    :cond_2
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glEnable(I)V

    .line 1220
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendSrcFunc:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendSrcFunc:I

    iget v5, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendDstFunc:I

    iget v6, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendSrcFuncAlpha:I

    iget v7, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendDstFuncAlpha:I

    invoke-interface {v2, v3, v5, v6, v7}, Lcom/badlogic/gdx/graphics/GL20;->glBlendFuncSeparate(IIII)V

    .line 1223
    :cond_3
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v2, :cond_4

    goto :goto_1

    :cond_4
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    :goto_1
    const/4 v3, 0x4

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    .line 1225
    iput v4, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->vertexIndex:I

    .line 1226
    iput v4, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->triangleIndex:I

    return-void
.end method

.method public getBlendDstFunc()I
    .locals 1

    .line 1264
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendDstFunc:I

    return v0
.end method

.method public getBlendDstFuncAlpha()I
    .locals 1

    .line 1274
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendDstFuncAlpha:I

    return v0
.end method

.method public getBlendSrcFunc()I
    .locals 1

    .line 1259
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendSrcFunc:I

    return v0
.end method

.method public getBlendSrcFuncAlpha()I
    .locals 1

    .line 1269
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendSrcFuncAlpha:I

    return v0
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public getPackedColor()F
    .locals 1

    .line 207
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    return v0
.end method

.method public getProjectionMatrix()Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 1285
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    return-object v0
.end method

.method public getShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;
    .locals 1

    .line 1346
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-nez v0, :cond_0

    .line 1347
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    :cond_0
    return-object v0
.end method

.method public getTransformMatrix()Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 1290
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    return-object v0
.end method

.method public isBlendingEnabled()Z
    .locals 1

    .line 1354
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendingDisabled:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isDrawing()Z
    .locals 1

    .line 1359
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    return v0
.end method

.method public setBlendFunction(II)V
    .locals 0

    .line 1243
    invoke-virtual {p0, p1, p2, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->setBlendFunctionSeparate(IIII)V

    return-void
.end method

.method public setBlendFunctionSeparate(IIII)V
    .locals 1

    .line 1248
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendSrcFunc:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendDstFunc:I

    if-ne v0, p2, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendSrcFuncAlpha:I

    if-ne v0, p3, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendDstFuncAlpha:I

    if-ne v0, p4, :cond_0

    return-void

    .line 1250
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 1251
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendSrcFunc:I

    .line 1252
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendDstFunc:I

    .line 1253
    iput p3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendSrcFuncAlpha:I

    .line 1254
    iput p4, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->blendDstFuncAlpha:I

    return-void
.end method

.method public setColor(FFFF)V
    .locals 1

    .line 190
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    .line 191
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 185
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    return-void
.end method

.method public setPackedColor(F)V
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-static {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->abgr8888ToColor(Lcom/badlogic/gdx/graphics/Color;F)V

    .line 197
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->colorPacked:F

    return-void
.end method

.method public setProjectionMatrix(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 1295
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 1296
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 1297
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->setupMatrices()V

    :cond_1
    return-void
.end method

.method public setShader(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    .line 1327
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v0, :cond_1

    .line 1328
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 1329
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v0, :cond_0

    .line 1330
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    goto :goto_0

    .line 1332
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    .line 1334
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 1335
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz p1, :cond_3

    .line 1336
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz p1, :cond_2

    .line 1337
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    goto :goto_1

    .line 1339
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 1340
    :goto_1
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->setupMatrices()V

    :cond_3
    return-void
.end method

.method public setTransformMatrix(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 1302
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->flush()V

    .line 1303
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 1304
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->drawing:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/PolygonSpriteBatch;->setupMatrices()V

    :cond_1
    return-void
.end method
