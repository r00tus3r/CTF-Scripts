.class public Lcom/badlogic/gdx/graphics/g2d/SpriteCache;
.super Ljava/lang/Object;
.source "SpriteCache.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;
    }
.end annotation


# static fields
.field private static final tempVertices:[F


# instance fields
.field private caches:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;",
            ">;"
        }
    .end annotation
.end field

.field private final color:Lcom/badlogic/gdx/graphics/Color;

.field private colorPacked:F

.field private final combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

.field private final counts:Lcom/badlogic/gdx/utils/IntArray;

.field private currentCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

.field private customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

.field private drawing:Z

.field private final mesh:Lcom/badlogic/gdx/graphics/Mesh;

.field private final projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

.field public renderCalls:I

.field private final shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

.field private final textures:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/Texture;",
            ">;"
        }
    .end annotation
.end field

.field public totalRenderCalls:I

.field private final transformMatrix:Lcom/badlogic/gdx/math/Matrix4;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x1e

    .line 70
    new-array v0, v0, [F

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x3e8

    const/4 v1, 0x0

    .line 98
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;-><init>(IZ)V

    return-void
.end method

.method public constructor <init>(ILcom/badlogic/gdx/graphics/glutils/ShaderProgram;Z)V
    .locals 11

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    .line 75
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    .line 76
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->caches:Lcom/badlogic/gdx/utils/Array;

    .line 78
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    .line 82
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->textures:Lcom/badlogic/gdx/utils/Array;

    .line 83
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->counts:Lcom/badlogic/gdx/utils/IntArray;

    .line 85
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 86
    sget v0, Lcom/badlogic/gdx/graphics/Color;->WHITE_FLOAT_BITS:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    const/4 v0, 0x0

    .line 88
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const/4 v0, 0x0

    .line 91
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->renderCalls:I

    .line 94
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->totalRenderCalls:I

    .line 114
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz p3, :cond_1

    const/16 p2, 0x1fff

    if-gt p1, p2, :cond_0

    goto :goto_0

    .line 116
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Can\'t have more than 8191 sprites per batch: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 118
    :cond_1
    :goto_0
    new-instance p2, Lcom/badlogic/gdx/graphics/Mesh;

    const/4 v1, 0x6

    const/4 v2, 0x4

    if-eqz p3, :cond_2

    const/4 v3, 0x4

    goto :goto_1

    :cond_2
    const/4 v3, 0x6

    :goto_1
    mul-int v3, v3, p1

    if-eqz p3, :cond_3

    mul-int/lit8 v4, p1, 0x6

    goto :goto_2

    :cond_3
    const/4 v4, 0x0

    :goto_2
    const/4 v5, 0x3

    new-array v5, v5, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v6, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/4 v7, 0x2

    const/4 v8, 0x1

    const-string v9, "a_position"

    invoke-direct {v6, v8, v7, v9}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v6, v5, v0

    new-instance v6, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v9, "a_color"

    invoke-direct {v6, v2, v2, v9}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v6, v5, v8

    new-instance v6, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/16 v9, 0x10

    const-string v10, "a_texCoord0"

    invoke-direct {v6, v9, v7, v10}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v6, v5, v7

    invoke-direct {p2, v8, v3, v4, v5}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 121
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/graphics/Mesh;->setAutoBind(Z)V

    if-eqz p3, :cond_5

    mul-int/lit8 p1, p1, 0x6

    .line 125
    new-array p2, p1, [S

    const/4 p3, 0x0

    :goto_3
    if-ge v0, p1, :cond_4

    add-int/lit8 v1, v0, 0x0

    .line 128
    aput-short p3, p2, v1

    add-int/lit8 v1, v0, 0x1

    add-int/lit8 v3, p3, 0x1

    int-to-short v3, v3

    .line 129
    aput-short v3, p2, v1

    add-int/lit8 v1, v0, 0x2

    add-int/lit8 v3, p3, 0x2

    int-to-short v3, v3

    .line 130
    aput-short v3, p2, v1

    add-int/lit8 v1, v0, 0x3

    .line 131
    aput-short v3, p2, v1

    add-int/lit8 v1, v0, 0x4

    add-int/lit8 v3, p3, 0x3

    int-to-short v3, v3

    .line 132
    aput-short v3, p2, v1

    add-int/lit8 v1, v0, 0x5

    .line 133
    aput-short p3, p2, v1

    add-int/lit8 v0, v0, 0x6

    add-int/2addr p3, v2

    int-to-short p3, p3

    goto :goto_3

    .line 135
    :cond_4
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/Mesh;->setIndices([S)Lcom/badlogic/gdx/graphics/Mesh;

    .line 138
    :cond_5
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    sget-object p2, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {p2}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result p2

    int-to-float p2, p2

    sget-object p3, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {p3}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result p3

    int-to-float p3, p3

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p2, p3}, Lcom/badlogic/gdx/math/Matrix4;->setToOrtho2D(FFFF)Lcom/badlogic/gdx/math/Matrix4;

    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 1

    .line 106
    invoke-static {}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->createDefaultShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;-><init>(ILcom/badlogic/gdx/graphics/glutils/ShaderProgram;Z)V

    return-void
.end method

.method static createDefaultShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;
    .locals 4

    .line 1003
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const-string v1, "attribute vec4 a_position;\nattribute vec4 a_color;\nattribute vec2 a_texCoord0;\nuniform mat4 u_projectionViewMatrix;\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\n\nvoid main()\n{\n   v_color = a_color;\n   v_color.a = v_color.a * (255.0/254.0);\n   v_texCoords = a_texCoord0;\n   gl_Position =  u_projectionViewMatrix * a_position;\n}\n"

    const-string v2, "#ifdef GL_ES\nprecision mediump float;\n#endif\nvarying vec4 v_color;\nvarying vec2 v_texCoords;\nuniform sampler2D u_texture;\nvoid main()\n{\n  gl_FragColor = v_color * texture2D(u_texture, v_texCoords);\n}"

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1004
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


# virtual methods
.method public add(Lcom/badlogic/gdx/graphics/Texture;FF)V
    .locals 12

    .line 266
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, p2

    .line 267
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v1, p3

    .line 269
    sget-object v2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/4 v3, 0x0

    aput p2, v2, v3

    const/4 v4, 0x1

    .line 270
    aput p3, v2, v4

    .line 271
    iget v4, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    const/4 v5, 0x2

    aput v4, v2, v5

    const/4 v5, 0x0

    const/4 v6, 0x3

    .line 272
    aput v5, v2, v6

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x4

    .line 273
    aput v6, v2, v7

    const/4 v7, 0x5

    .line 275
    aput p2, v2, v7

    const/4 v7, 0x6

    .line 276
    aput v1, v2, v7

    const/4 v7, 0x7

    .line 277
    aput v4, v2, v7

    const/16 v7, 0x8

    .line 278
    aput v5, v2, v7

    const/16 v7, 0x9

    .line 279
    aput v5, v2, v7

    const/16 v7, 0xa

    .line 281
    aput v0, v2, v7

    const/16 v7, 0xb

    .line 282
    aput v1, v2, v7

    const/16 v7, 0xc

    .line 283
    aput v4, v2, v7

    const/16 v4, 0xd

    .line 284
    aput v6, v2, v4

    const/16 v4, 0xe

    .line 285
    aput v5, v2, v4

    .line 287
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v2

    const/16 v4, 0x14

    const/16 v7, 0x13

    const/16 v8, 0x12

    const/16 v9, 0x11

    const/16 v10, 0x10

    const/16 v11, 0xf

    if-lez v2, :cond_0

    .line 288
    sget-object p2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v0, p2, v11

    .line 289
    aput p3, p2, v10

    .line 290
    iget p3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput p3, p2, v9

    .line 291
    aput v6, p2, v8

    .line 292
    aput v6, p2, v7

    .line 293
    invoke-virtual {p0, p1, p2, v3, v4}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    goto :goto_0

    .line 295
    :cond_0
    sget-object v2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v0, v2, v11

    .line 296
    aput v1, v2, v10

    .line 297
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v1, v2, v9

    .line 298
    aput v6, v2, v8

    .line 299
    aput v5, v2, v7

    .line 301
    aput v0, v2, v4

    const/16 v0, 0x15

    .line 302
    aput p3, v2, v0

    const/16 v0, 0x16

    .line 303
    aput v1, v2, v0

    const/16 v0, 0x17

    .line 304
    aput v6, v2, v0

    const/16 v0, 0x18

    .line 305
    aput v6, v2, v0

    const/16 v0, 0x19

    .line 307
    aput p2, v2, v0

    const/16 p2, 0x1a

    .line 308
    aput p3, v2, p2

    const/16 p2, 0x1b

    .line 309
    aput v1, v2, p2

    const/16 p2, 0x1c

    .line 310
    aput v5, v2, p2

    const/16 p2, 0x1d

    .line 311
    aput v6, v2, p2

    const/16 p2, 0x1e

    .line 312
    invoke-virtual {p0, p1, v2, v3, p2}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    :goto_0
    return-void
.end method

.method public add(Lcom/badlogic/gdx/graphics/Texture;FFFFFFFFFIIIIZZ)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p4

    move/from16 v3, p5

    move/from16 v4, p11

    move/from16 v5, p12

    add-float v6, p2, v2

    add-float v7, p3, v3

    neg-float v8, v2

    neg-float v9, v3

    sub-float v2, p6, v2

    sub-float v3, p7, v3

    const/high16 v10, 0x3f800000    # 1.0f

    cmpl-float v11, p8, v10

    if-nez v11, :cond_0

    cmpl-float v11, p9, v10

    if-eqz v11, :cond_1

    :cond_0
    mul-float v8, v8, p8

    mul-float v9, v9, p9

    mul-float v2, v2, p8

    mul-float v3, v3, p9

    :cond_1
    const/4 v11, 0x0

    cmpl-float v11, p10, v11

    if-eqz v11, :cond_2

    .line 539
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v11

    .line 540
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v12

    mul-float v13, v11, v8

    mul-float v14, v12, v9

    sub-float v14, v13, v14

    mul-float v8, v8, v12

    mul-float v9, v9, v11

    add-float/2addr v9, v8

    mul-float v15, v12, v3

    sub-float/2addr v13, v15

    mul-float v3, v3, v11

    add-float/2addr v8, v3

    mul-float v11, v11, v2

    sub-float/2addr v11, v15

    mul-float v12, v12, v2

    add-float/2addr v3, v12

    sub-float v2, v11, v13

    add-float/2addr v2, v14

    sub-float v12, v8, v9

    sub-float v12, v3, v12

    move/from16 v19, v12

    move v12, v2

    move v2, v11

    move v11, v3

    move v3, v8

    move v8, v14

    move/from16 v14, v19

    goto :goto_0

    :cond_2
    move v12, v2

    move v11, v3

    move v13, v8

    move v14, v9

    :goto_0
    add-float/2addr v8, v6

    add-float/2addr v9, v7

    add-float/2addr v13, v6

    add-float/2addr v3, v7

    add-float/2addr v2, v6

    add-float/2addr v11, v7

    add-float/2addr v12, v6

    add-float/2addr v14, v7

    .line 576
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v6

    int-to-float v6, v6

    div-float v6, v10, v6

    .line 577
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v10, v7

    int-to-float v7, v4

    mul-float v7, v7, v6

    add-int v15, v5, p14

    int-to-float v15, v15

    mul-float v15, v15, v10

    add-int v4, v4, p13

    int-to-float v4, v4

    mul-float v4, v4, v6

    int-to-float v5, v5

    mul-float v5, v5, v10

    if-eqz p15, :cond_3

    goto :goto_1

    :cond_3
    move/from16 v19, v7

    move v7, v4

    move/from16 v4, v19

    :goto_1
    if-eqz p16, :cond_4

    move/from16 v19, v15

    move v15, v5

    move/from16 v5, v19

    .line 595
    :cond_4
    sget-object v6, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/4 v10, 0x0

    aput v8, v6, v10

    const/16 v16, 0x1

    .line 596
    aput v9, v6, v16

    const/16 v16, 0x2

    .line 597
    iget v10, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v10, v6, v16

    const/16 v16, 0x3

    .line 598
    aput v4, v6, v16

    const/16 v16, 0x4

    .line 599
    aput v15, v6, v16

    const/16 v16, 0x5

    .line 601
    aput v13, v6, v16

    const/4 v13, 0x6

    .line 602
    aput v3, v6, v13

    const/4 v3, 0x7

    .line 603
    aput v10, v6, v3

    const/16 v3, 0x8

    .line 604
    aput v4, v6, v3

    const/16 v3, 0x9

    .line 605
    aput v5, v6, v3

    const/16 v3, 0xa

    .line 607
    aput v2, v6, v3

    const/16 v3, 0xb

    .line 608
    aput v11, v6, v3

    const/16 v3, 0xc

    .line 609
    aput v10, v6, v3

    const/16 v3, 0xd

    .line 610
    aput v7, v6, v3

    const/16 v3, 0xe

    .line 611
    aput v5, v6, v3

    .line 613
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v3

    const/16 v6, 0x14

    const/16 v10, 0x13

    const/16 v13, 0x12

    const/16 v16, 0x11

    const/16 v17, 0x10

    const/16 v18, 0xf

    if-lez v3, :cond_5

    .line 614
    sget-object v2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v12, v2, v18

    .line 615
    aput v14, v2, v17

    .line 616
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v3, v2, v16

    .line 617
    aput v7, v2, v13

    .line 618
    aput v15, v2, v10

    const/4 v3, 0x0

    .line 619
    invoke-virtual {v0, v1, v2, v3, v6}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    goto :goto_2

    .line 621
    :cond_5
    sget-object v3, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v2, v3, v18

    .line 622
    aput v11, v3, v17

    .line 623
    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v2, v3, v16

    .line 624
    aput v7, v3, v13

    .line 625
    aput v5, v3, v10

    .line 627
    aput v12, v3, v6

    const/16 v5, 0x15

    .line 628
    aput v14, v3, v5

    const/16 v5, 0x16

    .line 629
    aput v2, v3, v5

    const/16 v5, 0x17

    .line 630
    aput v7, v3, v5

    const/16 v5, 0x18

    .line 631
    aput v15, v3, v5

    const/16 v5, 0x19

    .line 633
    aput v8, v3, v5

    const/16 v5, 0x1a

    .line 634
    aput v9, v3, v5

    const/16 v5, 0x1b

    .line 635
    aput v2, v3, v5

    const/16 v2, 0x1c

    .line 636
    aput v4, v3, v2

    const/16 v2, 0x1d

    .line 637
    aput v15, v3, v2

    const/16 v2, 0x1e

    const/4 v4, 0x0

    .line 638
    invoke-virtual {v0, v1, v3, v4, v2}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    :goto_2
    return-void
.end method

.method public add(Lcom/badlogic/gdx/graphics/Texture;FFFFIIIIZZ)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p6

    move/from16 v3, p7

    .line 431
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3f800000    # 1.0f

    div-float v4, v5, v4

    .line 432
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    int-to-float v6, v2

    mul-float v6, v6, v4

    add-int v7, v3, p9

    int-to-float v7, v7

    mul-float v7, v7, v5

    add-int v2, v2, p8

    int-to-float v2, v2

    mul-float v2, v2, v4

    int-to-float v3, v3

    mul-float v3, v3, v5

    add-float v4, p2, p4

    add-float v5, p3, p5

    if-eqz p10, :cond_0

    move/from16 v16, v6

    move v6, v2

    move/from16 v2, v16

    :cond_0
    if-eqz p11, :cond_1

    move/from16 v16, v7

    move v7, v3

    move/from16 v3, v16

    .line 451
    :cond_1
    sget-object v8, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/4 v9, 0x0

    aput p2, v8, v9

    const/4 v10, 0x1

    .line 452
    aput p3, v8, v10

    const/4 v10, 0x2

    .line 453
    iget v11, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v11, v8, v10

    const/4 v10, 0x3

    .line 454
    aput v6, v8, v10

    const/4 v10, 0x4

    .line 455
    aput v7, v8, v10

    const/4 v10, 0x5

    .line 457
    aput p2, v8, v10

    const/4 v10, 0x6

    .line 458
    aput v5, v8, v10

    const/4 v10, 0x7

    .line 459
    aput v11, v8, v10

    const/16 v10, 0x8

    .line 460
    aput v6, v8, v10

    const/16 v10, 0x9

    .line 461
    aput v3, v8, v10

    const/16 v10, 0xa

    .line 463
    aput v4, v8, v10

    const/16 v10, 0xb

    .line 464
    aput v5, v8, v10

    const/16 v10, 0xc

    .line 465
    aput v11, v8, v10

    const/16 v10, 0xd

    .line 466
    aput v2, v8, v10

    const/16 v10, 0xe

    .line 467
    aput v3, v8, v10

    .line 469
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v8}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v8

    const/16 v10, 0x14

    const/16 v11, 0x13

    const/16 v12, 0x12

    const/16 v13, 0x11

    const/16 v14, 0x10

    const/16 v15, 0xf

    if-lez v8, :cond_2

    .line 470
    sget-object v3, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v4, v3, v15

    .line 471
    aput p3, v3, v14

    .line 472
    iget v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v4, v3, v13

    .line 473
    aput v2, v3, v12

    .line 474
    aput v7, v3, v11

    .line 475
    invoke-virtual {v0, v1, v3, v9, v10}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    goto :goto_0

    .line 477
    :cond_2
    sget-object v8, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v4, v8, v15

    .line 478
    aput v5, v8, v14

    .line 479
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v5, v8, v13

    .line 480
    aput v2, v8, v12

    .line 481
    aput v3, v8, v11

    .line 483
    aput v4, v8, v10

    const/16 v3, 0x15

    .line 484
    aput p3, v8, v3

    const/16 v3, 0x16

    .line 485
    aput v5, v8, v3

    const/16 v3, 0x17

    .line 486
    aput v2, v8, v3

    const/16 v2, 0x18

    .line 487
    aput v7, v8, v2

    const/16 v2, 0x19

    .line 489
    aput p2, v8, v2

    const/16 v2, 0x1a

    .line 490
    aput p3, v8, v2

    const/16 v2, 0x1b

    .line 491
    aput v5, v8, v2

    const/16 v2, 0x1c

    .line 492
    aput v6, v8, v2

    const/16 v2, 0x1d

    .line 493
    aput v7, v8, v2

    const/16 v2, 0x1e

    .line 494
    invoke-virtual {v0, v1, v8, v9, v2}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    :goto_0
    return-void
.end method

.method public add(Lcom/badlogic/gdx/graphics/Texture;FFIIFFFFF)V
    .locals 12

    move-object v0, p0

    move-object v1, p1

    move/from16 v2, p4

    int-to-float v2, v2

    add-float/2addr v2, p2

    move/from16 v3, p5

    int-to-float v3, v3

    add-float/2addr v3, p3

    .line 322
    sget-object v4, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/4 v5, 0x0

    aput p2, v4, v5

    const/4 v6, 0x1

    .line 323
    aput p3, v4, v6

    const/4 v6, 0x2

    .line 324
    aput p10, v4, v6

    const/4 v6, 0x3

    .line 325
    aput p6, v4, v6

    const/4 v6, 0x4

    .line 326
    aput p7, v4, v6

    const/4 v6, 0x5

    .line 328
    aput p2, v4, v6

    const/4 v6, 0x6

    .line 329
    aput v3, v4, v6

    const/4 v6, 0x7

    .line 330
    aput p10, v4, v6

    const/16 v6, 0x8

    .line 331
    aput p6, v4, v6

    const/16 v6, 0x9

    .line 332
    aput p9, v4, v6

    const/16 v6, 0xa

    .line 334
    aput v2, v4, v6

    const/16 v6, 0xb

    .line 335
    aput v3, v4, v6

    const/16 v6, 0xc

    .line 336
    aput p10, v4, v6

    const/16 v6, 0xd

    .line 337
    aput p8, v4, v6

    const/16 v6, 0xe

    .line 338
    aput p9, v4, v6

    .line 340
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v4

    const/16 v6, 0x14

    const/16 v7, 0x13

    const/16 v8, 0x12

    const/16 v9, 0x11

    const/16 v10, 0x10

    const/16 v11, 0xf

    if-lez v4, :cond_0

    .line 341
    sget-object v3, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v2, v3, v11

    .line 342
    aput p3, v3, v10

    .line 343
    aput p10, v3, v9

    .line 344
    aput p8, v3, v8

    .line 345
    aput p7, v3, v7

    .line 346
    invoke-virtual {p0, p1, v3, v5, v6}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    goto :goto_0

    .line 348
    :cond_0
    sget-object v4, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v2, v4, v11

    .line 349
    aput v3, v4, v10

    .line 350
    aput p10, v4, v9

    .line 351
    aput p8, v4, v8

    .line 352
    aput p9, v4, v7

    .line 354
    aput v2, v4, v6

    const/16 v2, 0x15

    .line 355
    aput p3, v4, v2

    const/16 v2, 0x16

    .line 356
    aput p10, v4, v2

    const/16 v2, 0x17

    .line 357
    aput p8, v4, v2

    const/16 v2, 0x18

    .line 358
    aput p7, v4, v2

    const/16 v2, 0x19

    .line 360
    aput p2, v4, v2

    const/16 v2, 0x1a

    .line 361
    aput p3, v4, v2

    const/16 v2, 0x1b

    .line 362
    aput p10, v4, v2

    const/16 v2, 0x1c

    .line 363
    aput p6, v4, v2

    const/16 v2, 0x1d

    .line 364
    aput p7, v4, v2

    const/16 v2, 0x1e

    .line 365
    invoke-virtual {p0, p1, v4, v5, v2}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    :goto_0
    return-void
.end method

.method public add(Lcom/badlogic/gdx/graphics/Texture;FFIIII)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p4

    move/from16 v3, p5

    move/from16 v4, p6

    move/from16 v5, p7

    .line 371
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v6

    int-to-float v6, v6

    const/high16 v7, 0x3f800000    # 1.0f

    div-float v6, v7, v6

    .line 372
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v7, v8

    int-to-float v8, v2

    mul-float v8, v8, v6

    add-int v9, v3, v5

    int-to-float v9, v9

    mul-float v9, v9, v7

    add-int/2addr v2, v4

    int-to-float v2, v2

    mul-float v2, v2, v6

    int-to-float v3, v3

    mul-float v3, v3, v7

    int-to-float v4, v4

    add-float v4, p2, v4

    int-to-float v5, v5

    add-float v5, p3, v5

    .line 380
    sget-object v6, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/4 v7, 0x0

    aput p2, v6, v7

    const/4 v10, 0x1

    .line 381
    aput p3, v6, v10

    .line 382
    iget v10, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    const/4 v11, 0x2

    aput v10, v6, v11

    const/4 v11, 0x3

    .line 383
    aput v8, v6, v11

    const/4 v11, 0x4

    .line 384
    aput v9, v6, v11

    const/4 v11, 0x5

    .line 386
    aput p2, v6, v11

    const/4 v11, 0x6

    .line 387
    aput v5, v6, v11

    const/4 v11, 0x7

    .line 388
    aput v10, v6, v11

    const/16 v11, 0x8

    .line 389
    aput v8, v6, v11

    const/16 v11, 0x9

    .line 390
    aput v3, v6, v11

    const/16 v11, 0xa

    .line 392
    aput v4, v6, v11

    const/16 v11, 0xb

    .line 393
    aput v5, v6, v11

    const/16 v11, 0xc

    .line 394
    aput v10, v6, v11

    const/16 v10, 0xd

    .line 395
    aput v2, v6, v10

    const/16 v10, 0xe

    .line 396
    aput v3, v6, v10

    .line 398
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v6

    const/16 v10, 0x14

    const/16 v11, 0x13

    const/16 v12, 0x12

    const/16 v13, 0x11

    const/16 v14, 0x10

    const/16 v15, 0xf

    if-lez v6, :cond_0

    .line 399
    sget-object v3, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v4, v3, v15

    .line 400
    aput p3, v3, v14

    .line 401
    iget v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v4, v3, v13

    .line 402
    aput v2, v3, v12

    .line 403
    aput v9, v3, v11

    .line 404
    invoke-virtual {v0, v1, v3, v7, v10}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    goto :goto_0

    .line 406
    :cond_0
    sget-object v6, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v4, v6, v15

    .line 407
    aput v5, v6, v14

    .line 408
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v5, v6, v13

    .line 409
    aput v2, v6, v12

    .line 410
    aput v3, v6, v11

    .line 412
    aput v4, v6, v10

    const/16 v3, 0x15

    .line 413
    aput p3, v6, v3

    const/16 v3, 0x16

    .line 414
    aput v5, v6, v3

    const/16 v3, 0x17

    .line 415
    aput v2, v6, v3

    const/16 v2, 0x18

    .line 416
    aput v9, v6, v2

    const/16 v2, 0x19

    .line 418
    aput p2, v6, v2

    const/16 v2, 0x1a

    .line 419
    aput p3, v6, v2

    const/16 v2, 0x1b

    .line 420
    aput v5, v6, v2

    const/16 v2, 0x1c

    .line 421
    aput v8, v6, v2

    const/16 v2, 0x1d

    .line 422
    aput v9, v6, v2

    const/16 v2, 0x1e

    .line 423
    invoke-virtual {v0, v1, v6, v7, v2}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    :goto_0
    return-void
.end method

.method public add(Lcom/badlogic/gdx/graphics/Texture;[FII)V
    .locals 3

    .line 250
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->currentCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    if-eqz v0, :cond_3

    .line 252
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v0

    const/4 v1, 0x6

    if-lez v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x6

    :goto_0
    mul-int/lit8 v0, v0, 0x5

    .line 253
    div-int v0, p4, v0

    mul-int/lit8 v0, v0, 0x6

    .line 254
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->textures:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_2

    .line 255
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->textures:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p1, :cond_1

    goto :goto_1

    .line 259
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->counts:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/IntArray;->incr(II)V

    goto :goto_2

    .line 256
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->textures:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 257
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->counts:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 261
    :goto_2
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    invoke-virtual {p1, p2, p3, p4}, Ljava/nio/FloatBuffer;->put([FII)Ljava/nio/FloatBuffer;

    return-void

    .line 250
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "beginCache must be called before add."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public add(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V
    .locals 7

    .line 835
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v0

    const/16 v1, 0x14

    const/4 v2, 0x0

    if-lez v0, :cond_0

    .line 836
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v0

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getVertices()[F

    move-result-object p1

    invoke-virtual {p0, v0, p1, v2, v1}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    return-void

    .line 840
    :cond_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getVertices()[F

    move-result-object v0

    .line 841
    sget-object v3, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/16 v4, 0xf

    invoke-static {v0, v2, v3, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/16 v3, 0xa

    .line 842
    sget-object v5, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/4 v6, 0x5

    invoke-static {v0, v3, v5, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 843
    sget-object v3, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    invoke-static {v0, v4, v3, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 844
    sget-object v1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/16 v3, 0x19

    invoke-static {v0, v2, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 845
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object p1

    sget-object v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/16 v1, 0x1e

    invoke-virtual {p0, p1, v0, v2, v1}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    return-void
.end method

.method public add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FF)V
    .locals 7

    .line 644
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

    invoke-virtual/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFF)V

    return-void
.end method

.method public add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFF)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    add-float v2, p2, p4

    add-float v3, p3, p5

    .line 651
    iget v4, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 652
    iget v5, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 653
    iget v6, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 654
    iget v7, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 656
    sget-object v8, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/4 v9, 0x0

    aput p2, v8, v9

    const/4 v10, 0x1

    .line 657
    aput p3, v8, v10

    .line 658
    iget v10, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    const/4 v11, 0x2

    aput v10, v8, v11

    const/4 v11, 0x3

    .line 659
    aput v4, v8, v11

    const/4 v11, 0x4

    .line 660
    aput v5, v8, v11

    const/4 v11, 0x5

    .line 662
    aput p2, v8, v11

    const/4 v11, 0x6

    .line 663
    aput v3, v8, v11

    const/4 v11, 0x7

    .line 664
    aput v10, v8, v11

    const/16 v11, 0x8

    .line 665
    aput v4, v8, v11

    const/16 v11, 0x9

    .line 666
    aput v7, v8, v11

    const/16 v11, 0xa

    .line 668
    aput v2, v8, v11

    const/16 v11, 0xb

    .line 669
    aput v3, v8, v11

    const/16 v11, 0xc

    .line 670
    aput v10, v8, v11

    const/16 v10, 0xd

    .line 671
    aput v6, v8, v10

    const/16 v10, 0xe

    .line 672
    aput v7, v8, v10

    .line 674
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v8}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v8

    const/16 v10, 0x14

    const/16 v11, 0x13

    const/16 v12, 0x12

    const/16 v13, 0x11

    const/16 v14, 0x10

    const/16 v15, 0xf

    if-lez v8, :cond_0

    .line 675
    sget-object v3, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v2, v3, v15

    .line 676
    aput p3, v3, v14

    .line 677
    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v2, v3, v13

    .line 678
    aput v6, v3, v12

    .line 679
    aput v5, v3, v11

    .line 680
    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    sget-object v2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    invoke-virtual {v0, v1, v2, v9, v10}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    goto :goto_0

    .line 682
    :cond_0
    sget-object v8, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v2, v8, v15

    .line 683
    aput v3, v8, v14

    .line 684
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v3, v8, v13

    .line 685
    aput v6, v8, v12

    .line 686
    aput v7, v8, v11

    .line 688
    aput v2, v8, v10

    const/16 v2, 0x15

    .line 689
    aput p3, v8, v2

    const/16 v2, 0x16

    .line 690
    aput v3, v8, v2

    const/16 v2, 0x17

    .line 691
    aput v6, v8, v2

    const/16 v2, 0x18

    .line 692
    aput v5, v8, v2

    const/16 v2, 0x19

    .line 694
    aput p2, v8, v2

    const/16 v2, 0x1a

    .line 695
    aput p3, v8, v2

    const/16 v2, 0x1b

    .line 696
    aput v3, v8, v2

    const/16 v2, 0x1c

    .line 697
    aput v4, v8, v2

    const/16 v2, 0x1d

    .line 698
    aput v5, v8, v2

    .line 699
    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    sget-object v2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/16 v3, 0x1e

    invoke-virtual {v0, v1, v2, v9, v3}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    :goto_0
    return-void
.end method

.method public add(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFFFFFFF)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p4

    move/from16 v3, p5

    add-float v4, p2, v2

    add-float v5, p3, v3

    neg-float v6, v2

    neg-float v7, v3

    sub-float v2, p6, v2

    sub-float v3, p7, v3

    const/high16 v8, 0x3f800000    # 1.0f

    cmpl-float v9, p8, v8

    if-nez v9, :cond_0

    cmpl-float v8, p9, v8

    if-eqz v8, :cond_1

    :cond_0
    mul-float v6, v6, p8

    mul-float v7, v7, p9

    mul-float v2, v2, p8

    mul-float v3, v3, p9

    :cond_1
    const/4 v8, 0x0

    cmpl-float v8, p10, v8

    if-eqz v8, :cond_2

    .line 744
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v8

    .line 745
    invoke-static/range {p10 .. p10}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v9

    mul-float v10, v8, v6

    mul-float v11, v9, v7

    sub-float v11, v10, v11

    mul-float v6, v6, v9

    mul-float v7, v7, v8

    add-float/2addr v7, v6

    mul-float v12, v9, v3

    sub-float/2addr v10, v12

    mul-float v3, v3, v8

    add-float/2addr v6, v3

    mul-float v8, v8, v2

    sub-float/2addr v8, v12

    mul-float v9, v9, v2

    add-float/2addr v3, v9

    sub-float v2, v8, v10

    add-float/2addr v2, v11

    sub-float v9, v6, v7

    sub-float v9, v3, v9

    move/from16 v19, v9

    move v9, v2

    move v2, v3

    move v3, v6

    move v6, v11

    move/from16 v11, v19

    goto :goto_0

    :cond_2
    move v8, v2

    move v9, v8

    move v2, v3

    move v10, v6

    move v11, v7

    :goto_0
    add-float/2addr v6, v4

    add-float/2addr v7, v5

    add-float/2addr v10, v4

    add-float/2addr v3, v5

    add-float/2addr v8, v4

    add-float/2addr v2, v5

    add-float/2addr v9, v4

    add-float/2addr v11, v5

    .line 781
    iget v4, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 782
    iget v5, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 783
    iget v12, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 784
    iget v13, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 786
    sget-object v14, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/4 v15, 0x0

    aput v6, v14, v15

    const/16 v16, 0x1

    .line 787
    aput v7, v14, v16

    const/16 v16, 0x2

    .line 788
    iget v15, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v15, v14, v16

    const/16 v16, 0x3

    .line 789
    aput v4, v14, v16

    const/16 v16, 0x4

    .line 790
    aput v5, v14, v16

    const/16 v16, 0x5

    .line 792
    aput v10, v14, v16

    const/4 v10, 0x6

    .line 793
    aput v3, v14, v10

    const/4 v3, 0x7

    .line 794
    aput v15, v14, v3

    const/16 v3, 0x8

    .line 795
    aput v4, v14, v3

    const/16 v3, 0x9

    .line 796
    aput v13, v14, v3

    const/16 v3, 0xa

    .line 798
    aput v8, v14, v3

    const/16 v3, 0xb

    .line 799
    aput v2, v14, v3

    const/16 v3, 0xc

    .line 800
    aput v15, v14, v3

    const/16 v3, 0xd

    .line 801
    aput v12, v14, v3

    const/16 v3, 0xe

    .line 802
    aput v13, v14, v3

    .line 804
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v3

    const/16 v10, 0x14

    const/16 v14, 0x13

    const/16 v15, 0x12

    const/16 v16, 0x11

    const/16 v17, 0x10

    const/16 v18, 0xf

    if-lez v3, :cond_3

    .line 805
    sget-object v2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v9, v2, v18

    .line 806
    aput v11, v2, v17

    .line 807
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v3, v2, v16

    .line 808
    aput v12, v2, v15

    .line 809
    aput v5, v2, v14

    .line 810
    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    sget-object v2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3, v10}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    goto :goto_1

    .line 812
    :cond_3
    sget-object v3, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    aput v8, v3, v18

    .line 813
    aput v2, v3, v17

    .line 814
    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    aput v2, v3, v16

    .line 815
    aput v12, v3, v15

    .line 816
    aput v13, v3, v14

    .line 818
    aput v9, v3, v10

    const/16 v8, 0x15

    .line 819
    aput v11, v3, v8

    const/16 v8, 0x16

    .line 820
    aput v2, v3, v8

    const/16 v8, 0x17

    .line 821
    aput v12, v3, v8

    const/16 v8, 0x18

    .line 822
    aput v5, v3, v8

    const/16 v8, 0x19

    .line 824
    aput v6, v3, v8

    const/16 v6, 0x1a

    .line 825
    aput v7, v3, v6

    const/16 v6, 0x1b

    .line 826
    aput v2, v3, v6

    const/16 v2, 0x1c

    .line 827
    aput v4, v3, v2

    const/16 v2, 0x1d

    .line 828
    aput v5, v3, v2

    .line 829
    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    sget-object v2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->tempVertices:[F

    const/16 v3, 0x1e

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v4, v3}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->add(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    :goto_1
    return-void
.end method

.method public begin()V
    .locals 5

    .line 850
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->drawing:Z

    if-nez v0, :cond_2

    .line 851
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->currentCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 852
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->renderCalls:I

    .line 853
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Matrix4;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 855
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/GL20;->glDepthMask(Z)V

    .line 857
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const-string v2, "u_texture"

    if-eqz v1, :cond_0

    .line 858
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 859
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    const-string v4, "u_proj"

    invoke-virtual {v1, v4, v3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix(Ljava/lang/String;Lcom/badlogic/gdx/math/Matrix4;)V

    .line 860
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    const-string v4, "u_trans"

    invoke-virtual {v1, v4, v3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix(Ljava/lang/String;Lcom/badlogic/gdx/math/Matrix4;)V

    .line 861
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    const-string v4, "u_projTrans"

    invoke-virtual {v1, v4, v3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix(Ljava/lang/String;Lcom/badlogic/gdx/math/Matrix4;)V

    .line 862
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v1, v2, v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(Ljava/lang/String;I)V

    .line 863
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/Mesh;->bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    goto :goto_0

    .line 865
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    .line 866
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    const-string v4, "u_projectionViewMatrix"

    invoke-virtual {v1, v4, v3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix(Ljava/lang/String;Lcom/badlogic/gdx/math/Matrix4;)V

    .line 867
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v1, v2, v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(Ljava/lang/String;I)V

    .line 868
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/Mesh;->bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    :goto_0
    const/4 v0, 0x1

    .line 870
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->drawing:Z

    return-void

    .line 851
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "endCache must be called before begin"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 850
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "end must be called before begin."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public beginCache()V
    .locals 3

    .line 170
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->drawing:Z

    if-nez v0, :cond_1

    .line 171
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->currentCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    if-nez v0, :cond_0

    .line 172
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v0

    .line 173
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->caches:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/FloatBuffer;->limit()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;-><init>(II)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->currentCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    .line 174
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->caches:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->currentCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 175
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->compact()Ljava/nio/FloatBuffer;

    return-void

    .line 171
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "endCache must be called before begin."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 170
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "end must be called before beginCache"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public beginCache(I)V
    .locals 1

    .line 182
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->drawing:Z

    if-nez v0, :cond_2

    .line 183
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->currentCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    if-nez v0, :cond_1

    .line 184
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->caches:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->caches:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    .line 186
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->offset:I

    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->limit(I)Ljava/nio/Buffer;

    .line 187
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->beginCache()V

    return-void

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->caches:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->currentCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    .line 191
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->currentCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->offset:I

    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    return-void

    .line 183
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "endCache must be called before begin."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 182
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "end must be called before beginCache"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public clear()V
    .locals 1

    .line 242
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->caches:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 243
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/Buffer;->flip()Ljava/nio/Buffer;

    return-void
.end method

.method public dispose()V
    .locals 1

    .line 942
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    .line 943
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->dispose()V

    :cond_0
    return-void
.end method

.method public draw(I)V
    .locals 8

    .line 889
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->drawing:Z

    if-eqz v0, :cond_3

    .line 891
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->caches:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    .line 892
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v0

    const/4 v1, 0x6

    const/4 v2, 0x4

    if-lez v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x6

    .line 893
    :goto_0
    iget v3, p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->offset:I

    mul-int/lit8 v0, v0, 0x5

    div-int/2addr v3, v0

    mul-int/lit8 v3, v3, 0x6

    .line 894
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textures:[Lcom/badlogic/gdx/graphics/Texture;

    .line 895
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->counts:[I

    .line 896
    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    const/4 v4, 0x0

    :goto_1
    if-ge v4, p1, :cond_2

    .line 898
    aget v5, v1, v4

    .line 899
    aget-object v6, v0, v4

    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/Texture;->bind()V

    .line 900
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v6, :cond_1

    .line 901
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v7, v6, v2, v3, v5}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    goto :goto_2

    .line 903
    :cond_1
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v6, v7, v2, v3, v5}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    :goto_2
    add-int/2addr v3, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 906
    :cond_2
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->renderCalls:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->renderCalls:I

    .line 907
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->totalRenderCalls:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->totalRenderCalls:I

    return-void

    .line 889
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "SpriteCache.begin must be called before draw."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method public draw(III)V
    .locals 9

    .line 914
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->drawing:Z

    if-eqz v0, :cond_3

    .line 916
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->caches:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    mul-int/lit8 p2, p2, 0x6

    .line 917
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->offset:I

    add-int/2addr p2, v0

    mul-int/lit8 p3, p3, 0x6

    .line 919
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textures:[Lcom/badlogic/gdx/graphics/Texture;

    .line 920
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->counts:[I

    .line 921
    iget v2, p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    .line 923
    aget-object v4, v0, v3

    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/Texture;->bind()V

    .line 924
    aget v4, v1, v3

    if-le v4, p3, :cond_0

    move v4, p3

    move v3, v2

    goto :goto_1

    :cond_0
    sub-int/2addr p3, v4

    move v8, v4

    move v4, p3

    move p3, v8

    .line 930
    :goto_1
    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const/4 v6, 0x4

    if-eqz v5, :cond_1

    .line 931
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v7, v5, v6, p2, p3}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    goto :goto_2

    .line 933
    :cond_1
    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v5, v7, v6, p2, p3}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    :goto_2
    add-int/2addr p2, p3

    add-int/lit8 v3, v3, 0x1

    move p3, v4

    goto :goto_0

    .line 936
    :cond_2
    iget p2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->renderCalls:I

    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    add-int/2addr p2, p1

    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->renderCalls:I

    .line 937
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->totalRenderCalls:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->totalRenderCalls:I

    return-void

    .line 914
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "SpriteCache.begin must be called before draw."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method public end()V
    .locals 2

    .line 875
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->drawing:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 876
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->drawing:Z

    .line 878
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    .line 879
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x1

    .line 880
    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glDepthMask(Z)V

    .line 881
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    if-eqz v0, :cond_0

    .line 882
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/graphics/Mesh;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    goto :goto_0

    .line 884
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->shader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/Mesh;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    :goto_0
    return-void

    .line 875
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "begin must be called before end."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public endCache()I
    .locals 6

    .line 196
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->currentCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    if-eqz v0, :cond_7

    .line 198
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/FloatBuffer;->position()I

    move-result v1

    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->offset:I

    sub-int/2addr v1, v2

    .line 199
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textures:[Lcom/badlogic/gdx/graphics/Texture;

    const/4 v3, 0x0

    if-nez v2, :cond_1

    .line 201
    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->maxCount:I

    .line 202
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->textures:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    .line 203
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->textures:Lcom/badlogic/gdx/utils/Array;

    const-class v2, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/Array;->toArray(Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/badlogic/gdx/graphics/Texture;

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textures:[Lcom/badlogic/gdx/graphics/Texture;

    .line 204
    iget v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    new-array v1, v1, [I

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->counts:[I

    .line 205
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->counts:Lcom/badlogic/gdx/utils/IntArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntArray;->size:I

    :goto_0
    if-ge v3, v1, :cond_0

    .line 206
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->counts:[I

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->counts:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v4

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 208
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    goto :goto_3

    .line 211
    :cond_1
    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->maxCount:I

    if-gt v1, v2, :cond_6

    .line 217
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->textures:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    iput v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    .line 219
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textures:[Lcom/badlogic/gdx/graphics/Texture;

    array-length v1, v1

    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    if-ge v1, v2, :cond_2

    iget v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    new-array v1, v1, [Lcom/badlogic/gdx/graphics/Texture;

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textures:[Lcom/badlogic/gdx/graphics/Texture;

    .line 220
    :cond_2
    iget v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_3

    .line 221
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textures:[Lcom/badlogic/gdx/graphics/Texture;

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->textures:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v5, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/badlogic/gdx/graphics/Texture;

    aput-object v5, v4, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 223
    :cond_3
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->counts:[I

    array-length v1, v1

    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    if-ge v1, v2, :cond_4

    iget v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    new-array v1, v1, [I

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->counts:[I

    .line 224
    :cond_4
    iget v1, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->textureCount:I

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v1, :cond_5

    .line 225
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->counts:[I

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->counts:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v5, v2}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v5

    aput v5, v4, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 227
    :cond_5
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    .line 228
    invoke-virtual {v1, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 229
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->caches:Lcom/badlogic/gdx/utils/Array;

    iget v3, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    .line 230
    iget v3, v2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->offset:I

    iget v2, v2, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->maxCount:I

    add-int/2addr v3, v2

    invoke-virtual {v1, v3}, Ljava/nio/FloatBuffer;->limit(I)Ljava/nio/Buffer;

    :goto_3
    const/4 v1, 0x0

    .line 233
    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->currentCache:Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;

    .line 234
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->textures:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 235
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->counts:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/IntArray;->clear()V

    .line 237
    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->id:I

    return v0

    .line 212
    :cond_6
    new-instance v2, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "If a cache is not the last created, it cannot be redefined with more entries than when it was first created: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache$Cache;->maxCount:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " max)"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 196
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "beginCache must be called before endCache."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v0

    :goto_5
    goto :goto_4
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 154
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public getCustomShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;
    .locals 1

    .line 1023
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    return-object v0
.end method

.method public getPackedColor()F
    .locals 1

    .line 165
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    return v0
.end method

.method public getProjectionMatrix()Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 947
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    return-object v0
.end method

.method public getTransformMatrix()Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 956
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    return-object v0
.end method

.method public isDrawing()Z
    .locals 1

    .line 1027
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->drawing:Z

    return v0
.end method

.method public setColor(FFFF)V
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    .line 150
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 144
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    return-void
.end method

.method public setPackedColor(F)V
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-static {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->abgr8888ToColor(Lcom/badlogic/gdx/graphics/Color;F)V

    .line 161
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->colorPacked:F

    return-void
.end method

.method public setProjectionMatrix(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 951
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->drawing:Z

    if-nez v0, :cond_0

    .line 952
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    return-void

    .line 951
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Can\'t set the matrix within begin/end."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setShader(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 0

    .line 1018
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->customShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    return-void
.end method

.method public setTransformMatrix(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 960
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->drawing:Z

    if-nez v0, :cond_0

    .line 961
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/SpriteCache;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    return-void

    .line 960
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Can\'t set the matrix within begin/end."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
