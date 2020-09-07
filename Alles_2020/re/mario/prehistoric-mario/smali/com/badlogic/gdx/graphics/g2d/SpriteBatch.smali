.class public Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;
.super Ljava/lang/Object;
.source "SpriteBatch.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g2d/Batch;


# static fields
.field public static defaultVertexDataType:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


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

.field drawing:Z

.field idx:I

.field invTexHeight:F

.field invTexWidth:F

.field lastTexture:Lcom/badlogic/gdx/graphics/Texture;

.field public maxSpritesInBatch:I

.field private mesh:Lcom/badlogic/gdx/graphics/Mesh;

.field private ownsShader:Z

.field private final projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

.field public renderCalls:I

.field private final shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

.field public totalRenderCalls:I

.field private final transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

.field final vertices:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    sget-object v0, Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;->VertexArray:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->defaultVertexDataType:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x3e8

    const/4 v1, 0x0

    .line 80
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;-><init>(ILcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 86
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;-><init>(ILcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    return-void
.end method

.method public constructor <init>(ILcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    .line 97
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const/4 v3, 0x0

    .line 45
    iput v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    const/4 v4, 0x0

    .line 46
    iput-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    const/4 v5, 0x0

    .line 47
    iput v5, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->invTexWidth:F

    iput v5, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->invTexHeight:F

    .line 49
    iput-boolean v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    .line 51
    new-instance v6, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v6}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v6, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    .line 52
    new-instance v6, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v6}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v6, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    .line 53
    new-instance v6, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v6}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v6, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    .line 55
    iput-boolean v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendingDisabled:Z

    const/16 v6, 0x302

    .line 56
    iput v6, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendSrcFunc:I

    const/16 v7, 0x303

    .line 57
    iput v7, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendDstFunc:I

    .line 58
    iput v6, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendSrcFuncAlpha:I

    .line 59
    iput v7, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendDstFuncAlpha:I

    .line 62
    iput-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 65
    new-instance v4, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v4, v6, v6, v6, v6}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 66
    sget v4, Lcom/badlogic/gdx/graphics/Color;->WHITE_FLOAT_BITS:F

    iput v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    .line 69
    iput v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->renderCalls:I

    .line 72
    iput v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->totalRenderCalls:I

    .line 75
    iput v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->maxSpritesInBatch:I

    const/16 v4, 0x1fff

    if-gt v1, v4, :cond_3

    .line 101
    sget-object v4, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    if-eqz v4, :cond_0

    sget-object v4, Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;->VertexBufferObjectWithVAO:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    goto :goto_0

    :cond_0
    sget-object v4, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->defaultVertexDataType:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    :goto_0
    move-object v7, v4

    .line 103
    new-instance v4, Lcom/badlogic/gdx/graphics/Mesh;

    const/4 v8, 0x0

    mul-int/lit8 v9, v1, 0x4

    mul-int/lit8 v12, v1, 0x6

    const/4 v6, 0x3

    new-array v11, v6, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v6, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/4 v10, 0x2

    const/4 v13, 0x1

    const-string v14, "a_position"

    invoke-direct {v6, v13, v10, v14}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v6, v11, v3

    new-instance v6, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/4 v14, 0x4

    const-string v15, "a_color"

    invoke-direct {v6, v14, v14, v15}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v6, v11, v13

    new-instance v6, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/16 v15, 0x10

    const-string v3, "a_texCoord0"

    invoke-direct {v6, v15, v10, v3}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v6, v11, v10

    move-object v6, v4

    move v10, v12

    invoke-direct/range {v6 .. v11}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    iput-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 108
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    sget-object v4, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v4}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v4

    int-to-float v4, v4

    sget-object v6, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v6}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v3, v5, v5, v4, v6}, Lcom/badlogic/gdx/math/Matrix4;->setToOrtho2D(FFFF)Lcom/badlogic/gdx/math/Matrix4;

    mul-int/lit8 v1, v1, 0x14

    .line 110
    new-array v1, v1, [F

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    .line 113
    new-array v1, v12, [S

    const/4 v3, 0x0

    const/16 v16, 0x0

    :goto_1
    if-ge v3, v12, :cond_1

    .line 116
    aput-short v16, v1, v3

    add-int/lit8 v4, v3, 0x1

    add-int/lit8 v5, v16, 0x1

    int-to-short v5, v5

    .line 117
    aput-short v5, v1, v4

    add-int/lit8 v4, v3, 0x2

    add-int/lit8 v5, v16, 0x2

    int-to-short v5, v5

    .line 118
    aput-short v5, v1, v4

    add-int/lit8 v4, v3, 0x3

    .line 119
    aput-short v5, v1, v4

    add-int/lit8 v4, v3, 0x4

    add-int/lit8 v5, v16, 0x3

    int-to-short v5, v5

    .line 120
    aput-short v5, v1, v4

    add-int/lit8 v4, v3, 0x5

    .line 121
    aput-short v16, v1, v4

    add-int/lit8 v3, v3, 0x6

    add-int/lit8 v4, v16, 0x4

    int-to-short v4, v4

    move/from16 v16, v4

    goto :goto_1

    .line 123
    :cond_1
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/graphics/Mesh;->setIndices([S)Lcom/badlogic/gdx/graphics/Mesh;

    if-nez v2, :cond_2

    .line 126
    invoke-static {}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->createDefaultShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    move-result-object v1

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 127
    iput-boolean v13, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->ownsShader:Z

    goto :goto_2

    .line 129
    :cond_2
    iput-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    :goto_2
    return-void

    .line 99
    :cond_3
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t have more than 8191 sprites per batch: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw v2

    :goto_4
    goto :goto_3
.end method

.method public static createDefaultShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;
    .locals 4

    .line 162
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const-string v1, "attribute vec4 a_position;\nattribute vec4 a_color;\nattribute vec2 a_texCoord0;\nuniform mat4 u_projTrans;\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\n\nvoid main()\n{\n   v_color = a_color;\n   v_color.a = v_color.a * (255.0/254.0);\n   v_texCoords = a_texCoord0;\n   gl_Position =  u_projTrans * a_position;\n}\n"

    const-string v2, "#ifdef GL_ES\n#define LOWP lowp\nprecision mediump float;\n#else\n#define LOWP \n#endif\nvarying LOWP vec4 v_color;\nvarying vec2 v_texCoords;\nuniform sampler2D u_texture;\nvoid main()\n{\n  gl_FragColor = v_color * texture2D(u_texture, v_texCoords);\n}"

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->isCompiled()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error compiling shader: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getLog()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private setupMatrices()V
    .locals 5

    .line 1059
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Matrix4;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 1060
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const/4 v1, 0x0

    const-string v2, "u_texture"

    const-string v3, "u_projTrans"

    if-eqz v0, :cond_0

    .line 1061
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix(Ljava/lang/String;Lcom/badlogic/gdx/math/Matrix4;)V

    .line 1062
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(Ljava/lang/String;I)V

    goto :goto_0

    .line 1064
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix(Ljava/lang/String;Lcom/badlogic/gdx/math/Matrix4;)V

    .line 1065
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(Ljava/lang/String;I)V

    :goto_0
    return-void
.end method


# virtual methods
.method public begin()V
    .locals 2

    .line 169
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 170
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->renderCalls:I

    .line 172
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/GL20;->glDepthMask(Z)V

    .line 173
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v0, :cond_0

    .line 174
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    goto :goto_0

    .line 176
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 177
    :goto_0
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->setupMatrices()V

    const/4 v0, 0x1

    .line 179
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    return-void

    .line 169
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "SpriteBatch.end must be called before begin."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public disableBlending()V
    .locals 1

    .line 980
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendingDisabled:Z

    if-eqz v0, :cond_0

    return-void

    .line 981
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    const/4 v0, 0x1

    .line 982
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendingDisabled:Z

    return-void
.end method

.method public dispose()V
    .locals 1

    .line 1030
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    .line 1031
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->ownsShader:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->dispose()V

    :cond_0
    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FF)V
    .locals 7

    .line 507
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

    invoke-virtual/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->draw(Lcom/badlogic/gdx/graphics/Texture;FFFF)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FFFF)V
    .locals 5

    .line 512
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_2

    .line 514
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    .line 516
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq p1, v1, :cond_0

    .line 517
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 518
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    array-length v1, v0

    if-ne p1, v1, :cond_1

    .line 519
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    :cond_1
    :goto_0
    add-float/2addr p4, p2

    add-float/2addr p5, p3

    .line 528
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    .line 529
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    .line 530
    aput p2, v0, v1

    add-int/lit8 v2, v1, 0x1

    .line 531
    aput p3, v0, v2

    add-int/lit8 v2, v1, 0x2

    .line 532
    aput p1, v0, v2

    add-int/lit8 v2, v1, 0x3

    const/4 v3, 0x0

    .line 533
    aput v3, v0, v2

    add-int/lit8 v2, v1, 0x4

    const/high16 v4, 0x3f800000    # 1.0f

    .line 534
    aput v4, v0, v2

    add-int/lit8 v2, v1, 0x5

    .line 536
    aput p2, v0, v2

    add-int/lit8 p2, v1, 0x6

    .line 537
    aput p5, v0, p2

    add-int/lit8 p2, v1, 0x7

    .line 538
    aput p1, v0, p2

    add-int/lit8 p2, v1, 0x8

    .line 539
    aput v3, v0, p2

    add-int/lit8 p2, v1, 0x9

    .line 540
    aput v3, v0, p2

    add-int/lit8 p2, v1, 0xa

    .line 542
    aput p4, v0, p2

    add-int/lit8 p2, v1, 0xb

    .line 543
    aput p5, v0, p2

    add-int/lit8 p2, v1, 0xc

    .line 544
    aput p1, v0, p2

    add-int/lit8 p2, v1, 0xd

    .line 545
    aput v4, v0, p2

    add-int/lit8 p2, v1, 0xe

    .line 546
    aput v3, v0, p2

    add-int/lit8 p2, v1, 0xf

    .line 548
    aput p4, v0, p2

    add-int/lit8 p2, v1, 0x10

    .line 549
    aput p3, v0, p2

    add-int/lit8 p2, v1, 0x11

    .line 550
    aput p1, v0, p2

    add-int/lit8 p1, v1, 0x12

    .line 551
    aput v4, v0, p1

    add-int/lit8 p1, v1, 0x13

    .line 552
    aput v4, v0, p1

    add-int/lit8 v1, v1, 0x14

    .line 553
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    return-void

    .line 512
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "SpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FFFFFFFF)V
    .locals 3

    .line 465
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_2

    .line 467
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    .line 469
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq p1, v1, :cond_0

    .line 470
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 471
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    array-length v1, v0

    if-ne p1, v1, :cond_1

    .line 472
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    :cond_1
    :goto_0
    add-float/2addr p4, p2

    add-float/2addr p5, p3

    .line 477
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    .line 478
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    .line 479
    aput p2, v0, v1

    add-int/lit8 v2, v1, 0x1

    .line 480
    aput p3, v0, v2

    add-int/lit8 v2, v1, 0x2

    .line 481
    aput p1, v0, v2

    add-int/lit8 v2, v1, 0x3

    .line 482
    aput p6, v0, v2

    add-int/lit8 v2, v1, 0x4

    .line 483
    aput p7, v0, v2

    add-int/lit8 v2, v1, 0x5

    .line 485
    aput p2, v0, v2

    add-int/lit8 p2, v1, 0x6

    .line 486
    aput p5, v0, p2

    add-int/lit8 p2, v1, 0x7

    .line 487
    aput p1, v0, p2

    add-int/lit8 p2, v1, 0x8

    .line 488
    aput p6, v0, p2

    add-int/lit8 p2, v1, 0x9

    .line 489
    aput p9, v0, p2

    add-int/lit8 p2, v1, 0xa

    .line 491
    aput p4, v0, p2

    add-int/lit8 p2, v1, 0xb

    .line 492
    aput p5, v0, p2

    add-int/lit8 p2, v1, 0xc

    .line 493
    aput p1, v0, p2

    add-int/lit8 p2, v1, 0xd

    .line 494
    aput p8, v0, p2

    add-int/lit8 p2, v1, 0xe

    .line 495
    aput p9, v0, p2

    add-int/lit8 p2, v1, 0xf

    .line 497
    aput p4, v0, p2

    add-int/lit8 p2, v1, 0x10

    .line 498
    aput p3, v0, p2

    add-int/lit8 p2, v1, 0x11

    .line 499
    aput p1, v0, p2

    add-int/lit8 p1, v1, 0x12

    .line 500
    aput p8, v0, p1

    add-int/lit8 p1, v1, 0x13

    .line 501
    aput p7, v0, p1

    add-int/lit8 v1, v1, 0x14

    .line 502
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    return-void

    .line 465
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "SpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FFFFFFFFFIIIIZZ)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p4

    move/from16 v2, p5

    move/from16 v3, p11

    move/from16 v4, p12

    .line 230
    iget-boolean v5, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v5, :cond_7

    .line 232
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    .line 234
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    move-object/from16 v7, p1

    if-eq v7, v6, :cond_0

    .line 235
    invoke-virtual/range {p0 .. p1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 236
    :cond_0
    iget v6, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    array-length v7, v5

    if-ne v6, v7, :cond_1

    .line 237
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    :cond_1
    :goto_0
    add-float v6, p2, v1

    add-float v7, p3, v2

    neg-float v8, v1

    neg-float v9, v2

    sub-float v1, p6, v1

    sub-float v2, p7, v2

    const/high16 v10, 0x3f800000    # 1.0f

    cmpl-float v11, p8, v10

    if-nez v11, :cond_2

    cmpl-float v10, p9, v10

    if-eqz v10, :cond_3

    :cond_2
    mul-float v8, v8, p8

    mul-float v9, v9, p9

    mul-float v1, v1, p8

    mul-float v2, v2, p9

    :cond_3
    const/4 v10, 0x0

    cmpl-float v10, p10, v10

    if-eqz v10, :cond_4

    .line 276
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v10

    .line 277
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

    move/from16 v16, v11

    move v11, v1

    move v1, v10

    move v10, v2

    move v2, v8

    move v8, v13

    move/from16 v13, v16

    goto :goto_1

    :cond_4
    move v11, v1

    move v10, v2

    move v12, v8

    move v13, v9

    :goto_1
    add-float/2addr v8, v6

    add-float/2addr v9, v7

    add-float/2addr v12, v6

    add-float/2addr v2, v7

    add-float/2addr v1, v6

    add-float/2addr v10, v7

    add-float/2addr v11, v6

    add-float/2addr v13, v7

    int-to-float v6, v3

    .line 313
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->invTexWidth:F

    mul-float v6, v6, v7

    add-int v14, v4, p14

    int-to-float v14, v14

    .line 314
    iget v15, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->invTexHeight:F

    mul-float v14, v14, v15

    add-int v3, v3, p13

    int-to-float v3, v3

    mul-float v3, v3, v7

    int-to-float v4, v4

    mul-float v4, v4, v15

    if-eqz p15, :cond_5

    goto :goto_2

    :cond_5
    move/from16 v16, v6

    move v6, v3

    move/from16 v3, v16

    :goto_2
    if-eqz p16, :cond_6

    goto :goto_3

    :cond_6
    move/from16 v16, v14

    move v14, v4

    move/from16 v4, v16

    .line 330
    :goto_3
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    .line 331
    iget v15, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    .line 332
    aput v8, v5, v15

    add-int/lit8 v8, v15, 0x1

    .line 333
    aput v9, v5, v8

    add-int/lit8 v8, v15, 0x2

    .line 334
    aput v7, v5, v8

    add-int/lit8 v8, v15, 0x3

    .line 335
    aput v3, v5, v8

    add-int/lit8 v8, v15, 0x4

    .line 336
    aput v4, v5, v8

    add-int/lit8 v8, v15, 0x5

    .line 338
    aput v12, v5, v8

    add-int/lit8 v8, v15, 0x6

    .line 339
    aput v2, v5, v8

    add-int/lit8 v2, v15, 0x7

    .line 340
    aput v7, v5, v2

    add-int/lit8 v2, v15, 0x8

    .line 341
    aput v3, v5, v2

    add-int/lit8 v2, v15, 0x9

    .line 342
    aput v14, v5, v2

    add-int/lit8 v2, v15, 0xa

    .line 344
    aput v1, v5, v2

    add-int/lit8 v1, v15, 0xb

    .line 345
    aput v10, v5, v1

    add-int/lit8 v1, v15, 0xc

    .line 346
    aput v7, v5, v1

    add-int/lit8 v1, v15, 0xd

    .line 347
    aput v6, v5, v1

    add-int/lit8 v1, v15, 0xe

    .line 348
    aput v14, v5, v1

    add-int/lit8 v1, v15, 0xf

    .line 350
    aput v11, v5, v1

    add-int/lit8 v1, v15, 0x10

    .line 351
    aput v13, v5, v1

    add-int/lit8 v1, v15, 0x11

    .line 352
    aput v7, v5, v1

    add-int/lit8 v1, v15, 0x12

    .line 353
    aput v6, v5, v1

    add-int/lit8 v1, v15, 0x13

    .line 354
    aput v4, v5, v1

    add-int/lit8 v15, v15, 0x14

    .line 355
    iput v15, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    return-void

    .line 230
    :cond_7
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "SpriteBatch.begin must be called before draw."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FFFFIIIIZZ)V
    .locals 4

    .line 361
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_4

    .line 363
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    .line 365
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq p1, v1, :cond_0

    .line 366
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 367
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    array-length v1, v0

    if-ne p1, v1, :cond_1

    .line 368
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    :cond_1
    :goto_0
    int-to-float p1, p6

    .line 370
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->invTexWidth:F

    mul-float p1, p1, v1

    add-int/2addr p9, p7

    int-to-float p9, p9

    .line 371
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->invTexHeight:F

    mul-float p9, p9, v2

    add-int/2addr p6, p8

    int-to-float p6, p6

    mul-float p6, p6, v1

    int-to-float p7, p7

    mul-float p7, p7, v2

    add-float/2addr p4, p2

    add-float/2addr p5, p3

    if-eqz p10, :cond_2

    move v3, p6

    move p6, p1

    move p1, v3

    :cond_2
    if-eqz p11, :cond_3

    goto :goto_1

    :cond_3
    move v3, p9

    move p9, p7

    move p7, v3

    .line 389
    :goto_1
    iget p8, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    .line 390
    iget p10, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    .line 391
    aput p2, v0, p10

    add-int/lit8 p11, p10, 0x1

    .line 392
    aput p3, v0, p11

    add-int/lit8 p11, p10, 0x2

    .line 393
    aput p8, v0, p11

    add-int/lit8 p11, p10, 0x3

    .line 394
    aput p1, v0, p11

    add-int/lit8 p11, p10, 0x4

    .line 395
    aput p7, v0, p11

    add-int/lit8 p11, p10, 0x5

    .line 397
    aput p2, v0, p11

    add-int/lit8 p2, p10, 0x6

    .line 398
    aput p5, v0, p2

    add-int/lit8 p2, p10, 0x7

    .line 399
    aput p8, v0, p2

    add-int/lit8 p2, p10, 0x8

    .line 400
    aput p1, v0, p2

    add-int/lit8 p1, p10, 0x9

    .line 401
    aput p9, v0, p1

    add-int/lit8 p1, p10, 0xa

    .line 403
    aput p4, v0, p1

    add-int/lit8 p1, p10, 0xb

    .line 404
    aput p5, v0, p1

    add-int/lit8 p1, p10, 0xc

    .line 405
    aput p8, v0, p1

    add-int/lit8 p1, p10, 0xd

    .line 406
    aput p6, v0, p1

    add-int/lit8 p1, p10, 0xe

    .line 407
    aput p9, v0, p1

    add-int/lit8 p1, p10, 0xf

    .line 409
    aput p4, v0, p1

    add-int/lit8 p1, p10, 0x10

    .line 410
    aput p3, v0, p1

    add-int/lit8 p1, p10, 0x11

    .line 411
    aput p8, v0, p1

    add-int/lit8 p1, p10, 0x12

    .line 412
    aput p6, v0, p1

    add-int/lit8 p1, p10, 0x13

    .line 413
    aput p7, v0, p1

    add-int/lit8 p10, p10, 0x14

    .line 414
    iput p10, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    return-void

    .line 361
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "SpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;FFIIII)V
    .locals 5

    .line 419
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_2

    .line 421
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    .line 423
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq p1, v1, :cond_0

    .line 424
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 425
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    array-length v1, v0

    if-ne p1, v1, :cond_1

    .line 426
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    :cond_1
    :goto_0
    int-to-float p1, p4

    .line 428
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->invTexWidth:F

    mul-float p1, p1, v1

    add-int v2, p5, p7

    int-to-float v2, v2

    .line 429
    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->invTexHeight:F

    mul-float v2, v2, v3

    add-int/2addr p4, p6

    int-to-float p4, p4

    mul-float p4, p4, v1

    int-to-float p5, p5

    mul-float p5, p5, v3

    int-to-float p6, p6

    add-float/2addr p6, p2

    int-to-float p7, p7

    add-float/2addr p7, p3

    .line 435
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    .line 436
    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    .line 437
    aput p2, v0, v3

    add-int/lit8 v4, v3, 0x1

    .line 438
    aput p3, v0, v4

    add-int/lit8 v4, v3, 0x2

    .line 439
    aput v1, v0, v4

    add-int/lit8 v4, v3, 0x3

    .line 440
    aput p1, v0, v4

    add-int/lit8 v4, v3, 0x4

    .line 441
    aput v2, v0, v4

    add-int/lit8 v4, v3, 0x5

    .line 443
    aput p2, v0, v4

    add-int/lit8 p2, v3, 0x6

    .line 444
    aput p7, v0, p2

    add-int/lit8 p2, v3, 0x7

    .line 445
    aput v1, v0, p2

    add-int/lit8 p2, v3, 0x8

    .line 446
    aput p1, v0, p2

    add-int/lit8 p1, v3, 0x9

    .line 447
    aput p5, v0, p1

    add-int/lit8 p1, v3, 0xa

    .line 449
    aput p6, v0, p1

    add-int/lit8 p1, v3, 0xb

    .line 450
    aput p7, v0, p1

    add-int/lit8 p1, v3, 0xc

    .line 451
    aput v1, v0, p1

    add-int/lit8 p1, v3, 0xd

    .line 452
    aput p4, v0, p1

    add-int/lit8 p1, v3, 0xe

    .line 453
    aput p5, v0, p1

    add-int/lit8 p1, v3, 0xf

    .line 455
    aput p6, v0, p1

    add-int/lit8 p1, v3, 0x10

    .line 456
    aput p3, v0, p1

    add-int/lit8 p1, v3, 0x11

    .line 457
    aput v1, v0, p1

    add-int/lit8 p1, v3, 0x12

    .line 458
    aput p4, v0, p1

    add-int/lit8 p1, v3, 0x13

    .line 459
    aput v2, v0, p1

    add-int/lit8 v3, v3, 0x14

    .line 460
    iput v3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    return-void

    .line 419
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "SpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/Texture;[FII)V
    .locals 3

    .line 558
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_3

    .line 560
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    array-length v0, v0

    .line 562
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq p1, v1, :cond_0

    .line 563
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 565
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    sub-int p1, v0, p1

    if-nez p1, :cond_1

    .line 567
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    :goto_0
    move p1, v0

    .line 571
    :cond_1
    invoke-static {p1, p4}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 573
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    invoke-static {p2, p3, v1, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 574
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    add-int/2addr v1, p1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    :goto_1
    sub-int/2addr p4, p1

    if-lez p4, :cond_2

    add-int/2addr p3, p1

    .line 578
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    .line 579
    invoke-static {v0, p4}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 580
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    const/4 v2, 0x0

    invoke-static {p2, p3, v1, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 581
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    add-int/2addr v1, p1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    goto :goto_1

    :cond_2
    return-void

    .line 558
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "SpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FF)V
    .locals 7

    .line 588
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

    invoke-virtual/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFF)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFF)V
    .locals 7

    .line 593
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_2

    .line 595
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    .line 597
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 598
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq v1, v2, :cond_0

    .line 599
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 600
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    array-length v2, v0

    if-ne v1, v2, :cond_1

    .line 601
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    :cond_1
    :goto_0
    add-float/2addr p4, p2

    add-float/2addr p5, p3

    .line 605
    iget v1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 606
    iget v2, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 607
    iget v3, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 608
    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 610
    iget v4, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    .line 611
    iget v5, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    .line 612
    aput p2, v0, v5

    add-int/lit8 v6, v5, 0x1

    .line 613
    aput p3, v0, v6

    add-int/lit8 v6, v5, 0x2

    .line 614
    aput v4, v0, v6

    add-int/lit8 v6, v5, 0x3

    .line 615
    aput v1, v0, v6

    add-int/lit8 v6, v5, 0x4

    .line 616
    aput v2, v0, v6

    add-int/lit8 v6, v5, 0x5

    .line 618
    aput p2, v0, v6

    add-int/lit8 p2, v5, 0x6

    .line 619
    aput p5, v0, p2

    add-int/lit8 p2, v5, 0x7

    .line 620
    aput v4, v0, p2

    add-int/lit8 p2, v5, 0x8

    .line 621
    aput v1, v0, p2

    add-int/lit8 p2, v5, 0x9

    .line 622
    aput p1, v0, p2

    add-int/lit8 p2, v5, 0xa

    .line 624
    aput p4, v0, p2

    add-int/lit8 p2, v5, 0xb

    .line 625
    aput p5, v0, p2

    add-int/lit8 p2, v5, 0xc

    .line 626
    aput v4, v0, p2

    add-int/lit8 p2, v5, 0xd

    .line 627
    aput v3, v0, p2

    add-int/lit8 p2, v5, 0xe

    .line 628
    aput p1, v0, p2

    add-int/lit8 p1, v5, 0xf

    .line 630
    aput p4, v0, p1

    add-int/lit8 p1, v5, 0x10

    .line 631
    aput p3, v0, p1

    add-int/lit8 p1, v5, 0x11

    .line 632
    aput v4, v0, p1

    add-int/lit8 p1, v5, 0x12

    .line 633
    aput v3, v0, p1

    add-int/lit8 p1, v5, 0x13

    .line 634
    aput v2, v0, p1

    add-int/lit8 v5, v5, 0x14

    .line 635
    iput v5, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    return-void

    .line 593
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "SpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFFFFFFF)V
    .locals 5

    .line 641
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_5

    .line 643
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    .line 645
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 646
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq v1, v2, :cond_0

    .line 647
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 648
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    array-length v2, v0

    if-ne v1, v2, :cond_1

    .line 649
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    :cond_1
    :goto_0
    add-float/2addr p2, p4

    add-float/2addr p3, p5

    neg-float v1, p4

    neg-float v2, p5

    sub-float/2addr p6, p4

    sub-float/2addr p7, p5

    const/high16 p4, 0x3f800000    # 1.0f

    cmpl-float p5, p8, p4

    if-nez p5, :cond_2

    cmpl-float p4, p9, p4

    if-eqz p4, :cond_3

    :cond_2
    mul-float v1, v1, p8

    mul-float v2, v2, p9

    mul-float p6, p6, p8

    mul-float p7, p7, p9

    :cond_3
    const/4 p4, 0x0

    cmpl-float p4, p10, p4

    if-eqz p4, :cond_4

    .line 688
    invoke-static {p10}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result p4

    .line 689
    invoke-static {p10}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result p5

    mul-float p8, p4, v1

    mul-float p9, p5, v2

    sub-float p9, p8, p9

    mul-float v1, v1, p5

    mul-float v2, v2, p4

    add-float/2addr v2, v1

    mul-float p10, p5, p7

    sub-float/2addr p8, p10

    mul-float p7, p7, p4

    add-float/2addr v1, p7

    mul-float p4, p4, p6

    sub-float/2addr p4, p10

    mul-float p5, p5, p6

    add-float/2addr p7, p5

    sub-float p5, p4, p8

    add-float p6, p9, p5

    sub-float p5, v1, v2

    sub-float p5, p7, p5

    move p10, p5

    move p5, p7

    move p7, v1

    goto :goto_1

    :cond_4
    move p4, p6

    move p5, p7

    move p8, v1

    move p9, p8

    move p10, v2

    :goto_1
    add-float/2addr p9, p2

    add-float/2addr v2, p3

    add-float/2addr p8, p2

    add-float/2addr p7, p3

    add-float/2addr p4, p2

    add-float/2addr p5, p3

    add-float/2addr p6, p2

    add-float/2addr p10, p3

    .line 725
    iget p2, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 726
    iget p3, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 727
    iget v1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 728
    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 730
    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    .line 731
    iget v4, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    .line 732
    aput p9, v0, v4

    add-int/lit8 p9, v4, 0x1

    .line 733
    aput v2, v0, p9

    add-int/lit8 p9, v4, 0x2

    .line 734
    aput v3, v0, p9

    add-int/lit8 p9, v4, 0x3

    .line 735
    aput p2, v0, p9

    add-int/lit8 p9, v4, 0x4

    .line 736
    aput p3, v0, p9

    add-int/lit8 p9, v4, 0x5

    .line 738
    aput p8, v0, p9

    add-int/lit8 p8, v4, 0x6

    .line 739
    aput p7, v0, p8

    add-int/lit8 p7, v4, 0x7

    .line 740
    aput v3, v0, p7

    add-int/lit8 p7, v4, 0x8

    .line 741
    aput p2, v0, p7

    add-int/lit8 p2, v4, 0x9

    .line 742
    aput p1, v0, p2

    add-int/lit8 p2, v4, 0xa

    .line 744
    aput p4, v0, p2

    add-int/lit8 p2, v4, 0xb

    .line 745
    aput p5, v0, p2

    add-int/lit8 p2, v4, 0xc

    .line 746
    aput v3, v0, p2

    add-int/lit8 p2, v4, 0xd

    .line 747
    aput v1, v0, p2

    add-int/lit8 p2, v4, 0xe

    .line 748
    aput p1, v0, p2

    add-int/lit8 p1, v4, 0xf

    .line 750
    aput p6, v0, p1

    add-int/lit8 p1, v4, 0x10

    .line 751
    aput p10, v0, p1

    add-int/lit8 p1, v4, 0x11

    .line 752
    aput v3, v0, p1

    add-int/lit8 p1, v4, 0x12

    .line 753
    aput v1, v0, p1

    add-int/lit8 p1, v4, 0x13

    .line 754
    aput p3, v0, p1

    add-int/lit8 v4, v4, 0x14

    .line 755
    iput v4, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    return-void

    .line 641
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "SpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFFFFFFFZ)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p4

    move/from16 v3, p5

    .line 761
    iget-boolean v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v4, :cond_6

    .line 763
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    .line 765
    iget-object v5, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 766
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq v5, v6, :cond_0

    .line 767
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 768
    :cond_0
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    array-length v6, v4

    if-ne v5, v6, :cond_1

    .line 769
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    :cond_1
    :goto_0
    add-float v5, p2, v2

    add-float v6, p3, v3

    neg-float v7, v2

    neg-float v8, v3

    sub-float v2, p6, v2

    sub-float v3, p7, v3

    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v10, p8, v9

    if-nez v10, :cond_2

    cmpl-float v9, p9, v9

    if-eqz v9, :cond_3

    :cond_2
    mul-float v7, v7, p8

    mul-float v8, v8, p9

    mul-float v2, v2, p8

    mul-float v3, v3, p9

    :cond_3
    const/4 v9, 0x0

    cmpl-float v9, p10, v9

    if-eqz v9, :cond_4

    .line 808
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v9

    .line 809
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

    move/from16 v18, v10

    move v10, v2

    move v2, v3

    move v3, v7

    move v7, v12

    move/from16 v12, v18

    goto :goto_1

    :cond_4
    move v9, v2

    move v10, v9

    move v2, v3

    move v11, v7

    move v12, v8

    :goto_1
    add-float/2addr v7, v5

    add-float/2addr v8, v6

    add-float/2addr v11, v5

    add-float/2addr v3, v6

    add-float/2addr v9, v5

    add-float/2addr v2, v6

    add-float/2addr v10, v5

    add-float/2addr v12, v6

    if-eqz p11, :cond_5

    .line 847
    iget v5, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 848
    iget v6, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 849
    iget v13, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 850
    iget v14, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 851
    iget v15, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    move/from16 p2, v5

    .line 852
    iget v5, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    move/from16 p3, v5

    .line 853
    iget v5, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 854
    iget v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    goto :goto_2

    .line 856
    :cond_5
    iget v5, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 857
    iget v6, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 858
    iget v13, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 859
    iget v14, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 860
    iget v15, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    move/from16 p2, v5

    .line 861
    iget v5, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    move/from16 p3, v5

    .line 862
    iget v5, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 863
    iget v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    :goto_2
    move/from16 v17, v1

    move/from16 v16, v5

    move/from16 v1, p2

    move/from16 v5, p3

    move/from16 p2, v12

    .line 866
    iget v12, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    move/from16 p3, v10

    .line 867
    iget v10, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    .line 868
    aput v7, v4, v10

    add-int/lit8 v7, v10, 0x1

    .line 869
    aput v8, v4, v7

    add-int/lit8 v7, v10, 0x2

    .line 870
    aput v12, v4, v7

    add-int/lit8 v7, v10, 0x3

    .line 871
    aput v1, v4, v7

    add-int/lit8 v1, v10, 0x4

    .line 872
    aput v6, v4, v1

    add-int/lit8 v1, v10, 0x5

    .line 874
    aput v11, v4, v1

    add-int/lit8 v1, v10, 0x6

    .line 875
    aput v3, v4, v1

    add-int/lit8 v1, v10, 0x7

    .line 876
    aput v12, v4, v1

    add-int/lit8 v1, v10, 0x8

    .line 877
    aput v13, v4, v1

    add-int/lit8 v1, v10, 0x9

    .line 878
    aput v14, v4, v1

    add-int/lit8 v1, v10, 0xa

    .line 880
    aput v9, v4, v1

    add-int/lit8 v1, v10, 0xb

    .line 881
    aput v2, v4, v1

    add-int/lit8 v1, v10, 0xc

    .line 882
    aput v12, v4, v1

    add-int/lit8 v1, v10, 0xd

    .line 883
    aput v15, v4, v1

    add-int/lit8 v1, v10, 0xe

    .line 884
    aput v5, v4, v1

    add-int/lit8 v1, v10, 0xf

    .line 886
    aput p3, v4, v1

    add-int/lit8 v1, v10, 0x10

    .line 887
    aput p2, v4, v1

    add-int/lit8 v1, v10, 0x11

    .line 888
    aput v12, v4, v1

    add-int/lit8 v1, v10, 0x12

    .line 889
    aput v16, v4, v1

    add-int/lit8 v1, v10, 0x13

    .line 890
    aput v17, v4, v1

    add-int/lit8 v10, v10, 0x14

    .line 891
    iput v10, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    return-void

    .line 761
    :cond_6
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "SpriteBatch.begin must be called before draw."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFLcom/badlogic/gdx/math/Affine2;)V
    .locals 11

    .line 896
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_2

    .line 898
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    .line 900
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 901
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    if-eq v1, v2, :cond_0

    .line 902
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    goto :goto_0

    .line 903
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    array-length v2, v0

    if-ne v1, v2, :cond_1

    .line 904
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    .line 908
    :cond_1
    :goto_0
    iget v1, p4, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 909
    iget v2, p4, Lcom/badlogic/gdx/math/Affine2;->m12:F

    .line 910
    iget v3, p4, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v3, v3, p3

    iget v4, p4, Lcom/badlogic/gdx/math/Affine2;->m02:F

    add-float/2addr v3, v4

    .line 911
    iget v4, p4, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v4, v4, p3

    iget v5, p4, Lcom/badlogic/gdx/math/Affine2;->m12:F

    add-float/2addr v4, v5

    .line 912
    iget v5, p4, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v5, v5, p2

    iget v6, p4, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v6, v6, p3

    add-float/2addr v5, v6

    iget v6, p4, Lcom/badlogic/gdx/math/Affine2;->m02:F

    add-float/2addr v5, v6

    .line 913
    iget v6, p4, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v6, v6, p2

    iget v7, p4, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v7, v7, p3

    add-float/2addr v6, v7

    iget p3, p4, Lcom/badlogic/gdx/math/Affine2;->m12:F

    add-float/2addr v6, p3

    .line 914
    iget p3, p4, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float p3, p3, p2

    iget v7, p4, Lcom/badlogic/gdx/math/Affine2;->m02:F

    add-float/2addr p3, v7

    .line 915
    iget v7, p4, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v7, v7, p2

    iget p2, p4, Lcom/badlogic/gdx/math/Affine2;->m12:F

    add-float/2addr v7, p2

    .line 917
    iget p2, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 918
    iget p4, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 919
    iget v8, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 920
    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 922
    iget v9, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    .line 923
    iget v10, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    .line 924
    aput v1, v0, v10

    add-int/lit8 v1, v10, 0x1

    .line 925
    aput v2, v0, v1

    add-int/lit8 v1, v10, 0x2

    .line 926
    aput v9, v0, v1

    add-int/lit8 v1, v10, 0x3

    .line 927
    aput p2, v0, v1

    add-int/lit8 v1, v10, 0x4

    .line 928
    aput p4, v0, v1

    add-int/lit8 v1, v10, 0x5

    .line 930
    aput v3, v0, v1

    add-int/lit8 v1, v10, 0x6

    .line 931
    aput v4, v0, v1

    add-int/lit8 v1, v10, 0x7

    .line 932
    aput v9, v0, v1

    add-int/lit8 v1, v10, 0x8

    .line 933
    aput p2, v0, v1

    add-int/lit8 p2, v10, 0x9

    .line 934
    aput p1, v0, p2

    add-int/lit8 p2, v10, 0xa

    .line 936
    aput v5, v0, p2

    add-int/lit8 p2, v10, 0xb

    .line 937
    aput v6, v0, p2

    add-int/lit8 p2, v10, 0xc

    .line 938
    aput v9, v0, p2

    add-int/lit8 p2, v10, 0xd

    .line 939
    aput v8, v0, p2

    add-int/lit8 p2, v10, 0xe

    .line 940
    aput p1, v0, p2

    add-int/lit8 p1, v10, 0xf

    .line 942
    aput p3, v0, p1

    add-int/lit8 p1, v10, 0x10

    .line 943
    aput v7, v0, p1

    add-int/lit8 p1, v10, 0x11

    .line 944
    aput v9, v0, p1

    add-int/lit8 p1, v10, 0x12

    .line 945
    aput v8, v0, p1

    add-int/lit8 p1, v10, 0x13

    .line 946
    aput p4, v0, p1

    add-int/lit8 v10, v10, 0x14

    .line 947
    iput v10, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    return-void

    .line 896
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "SpriteBatch.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public enableBlending()V
    .locals 1

    .line 987
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendingDisabled:Z

    if-nez v0, :cond_0

    return-void

    .line 988
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    const/4 v0, 0x0

    .line 989
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendingDisabled:Z

    return-void
.end method

.method public end()V
    .locals 2

    .line 184
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_3

    .line 185
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    :cond_0
    const/4 v0, 0x0

    .line 186
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    const/4 v0, 0x0

    .line 187
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    .line 189
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x1

    .line 190
    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDepthMask(Z)V

    .line 191
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->isBlendingEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0xbe2

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    .line 193
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v0, :cond_2

    .line 194
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    goto :goto_0

    .line 196
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    :goto_0
    return-void

    .line 184
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "SpriteBatch.begin must be called before end."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public flush()V
    .locals 8

    .line 952
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    if-nez v0, :cond_0

    return-void

    .line 954
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->renderCalls:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->renderCalls:I

    .line 955
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->totalRenderCalls:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->totalRenderCalls:I

    .line 956
    div-int/lit8 v0, v0, 0x14

    .line 957
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->maxSpritesInBatch:I

    if-le v0, v1, :cond_1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->maxSpritesInBatch:I

    :cond_1
    mul-int/lit8 v0, v0, 0x6

    .line 960
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->bind()V

    .line 961
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 962
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->vertices:[F

    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;

    .line 963
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Mesh;->getIndicesBuffer()Ljava/nio/ShortBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 964
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Mesh;->getIndicesBuffer()Ljava/nio/ShortBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/nio/ShortBuffer;->limit(I)Ljava/nio/Buffer;

    .line 966
    iget-boolean v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendingDisabled:Z

    const/16 v3, 0xbe2

    if-eqz v2, :cond_2

    .line 967
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glDisable(I)V

    goto :goto_0

    .line 969
    :cond_2
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glEnable(I)V

    .line 970
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendSrcFunc:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendSrcFunc:I

    iget v5, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendDstFunc:I

    iget v6, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendSrcFuncAlpha:I

    iget v7, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendDstFuncAlpha:I

    invoke-interface {v2, v3, v5, v6, v7}, Lcom/badlogic/gdx/graphics/GL20;->glBlendFuncSeparate(IIII)V

    .line 973
    :cond_3
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v2, :cond_4

    goto :goto_1

    :cond_4
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    :goto_1
    const/4 v3, 0x4

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    .line 975
    iput v4, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->idx:I

    return-void
.end method

.method public getBlendDstFunc()I
    .locals 1

    .line 1015
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendDstFunc:I

    return v0
.end method

.method public getBlendDstFuncAlpha()I
    .locals 1

    .line 1025
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendDstFuncAlpha:I

    return v0
.end method

.method public getBlendSrcFunc()I
    .locals 1

    .line 1010
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendSrcFunc:I

    return v0
.end method

.method public getBlendSrcFuncAlpha()I
    .locals 1

    .line 1020
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendSrcFuncAlpha:I

    return v0
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 213
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public getPackedColor()F
    .locals 1

    .line 224
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    return v0
.end method

.method public getProjectionMatrix()Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 1036
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    return-object v0
.end method

.method public getShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;
    .locals 1

    .line 1097
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-nez v0, :cond_0

    .line 1098
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    :cond_0
    return-object v0
.end method

.method public getTransformMatrix()Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 1041
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    return-object v0
.end method

.method public isBlendingEnabled()Z
    .locals 1

    .line 1105
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendingDisabled:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isDrawing()Z
    .locals 1

    .line 1109
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    return v0
.end method

.method public setBlendFunction(II)V
    .locals 0

    .line 994
    invoke-virtual {p0, p1, p2, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->setBlendFunctionSeparate(IIII)V

    return-void
.end method

.method public setBlendFunctionSeparate(IIII)V
    .locals 1

    .line 999
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendSrcFunc:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendDstFunc:I

    if-ne v0, p2, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendSrcFuncAlpha:I

    if-ne v0, p3, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendDstFuncAlpha:I

    if-ne v0, p4, :cond_0

    return-void

    .line 1001
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    .line 1002
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendSrcFunc:I

    .line 1003
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendDstFunc:I

    .line 1004
    iput p3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendSrcFuncAlpha:I

    .line 1005
    iput p4, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->blendDstFuncAlpha:I

    return-void
.end method

.method public setColor(FFFF)V
    .locals 1

    .line 207
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    .line 208
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 1

    .line 201
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 202
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    return-void
.end method

.method public setPackedColor(F)V
    .locals 1

    .line 218
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-static {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->abgr8888ToColor(Lcom/badlogic/gdx/graphics/Color;F)V

    .line 219
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->colorPacked:F

    return-void
.end method

.method public setProjectionMatrix(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 1046
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    .line 1047
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 1048
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->setupMatrices()V

    :cond_1
    return-void
.end method

.method public setShader(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    .line 1078
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_1

    .line 1079
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    .line 1080
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v0, :cond_0

    .line 1081
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    goto :goto_0

    .line 1083
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    .line 1085
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 1086
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz p1, :cond_3

    .line 1087
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz p1, :cond_2

    .line 1088
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    goto :goto_1

    .line 1090
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 1091
    :goto_1
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->setupMatrices()V

    :cond_3
    return-void
.end method

.method public setTransformMatrix(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 1053
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    .line 1054
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 1055
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->drawing:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->setupMatrices()V

    :cond_1
    return-void
.end method

.method protected switchTexture(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 2

    .line 1070
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->flush()V

    .line 1071
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->lastTexture:Lcom/badlogic/gdx/graphics/Texture;

    .line 1072
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float v0, v1, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->invTexWidth:F

    .line 1073
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v1, p1

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;->invTexHeight:F

    return-void
.end method
