.class public Lbox2dLight/ChainLight;
.super Lbox2dLight/Light;
.source "ChainLight.java"


# static fields
.field public static defaultRayStartOffset:F = 0.001f


# instance fields
.field protected body:Lcom/badlogic/gdx/physics/box2d/Body;

.field protected bodyAngle:F

.field protected bodyAngleOffset:F

.field protected final bodyPosition:Lcom/badlogic/gdx/math/Vector2;

.field public final chain:Lcom/badlogic/gdx/utils/FloatArray;

.field protected final chainLightBounds:Lcom/badlogic/gdx/math/Rectangle;

.field protected final endX:[F

.field protected final endY:[F

.field protected rayDirection:I

.field protected final rayHandlerBounds:Lcom/badlogic/gdx/math/Rectangle;

.field public rayStartOffset:F

.field protected final restorePosition:Lcom/badlogic/gdx/math/Matrix3;

.field protected final rotateAroundZero:Lcom/badlogic/gdx/math/Matrix3;

.field protected final segmentAngles:Lcom/badlogic/gdx/utils/FloatArray;

.field protected final segmentLengths:Lcom/badlogic/gdx/utils/FloatArray;

.field protected final startX:[F

.field protected final startY:[F

.field protected final tmpEnd:Lcom/badlogic/gdx/math/Vector2;

.field protected final tmpPerp:Lcom/badlogic/gdx/math/Vector2;

.field protected final tmpStart:Lcom/badlogic/gdx/math/Vector2;

.field protected final tmpVec:Lcom/badlogic/gdx/math/Vector2;

.field protected final zeroPosition:Lcom/badlogic/gdx/math/Matrix3;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FI)V
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    .line 80
    invoke-direct/range {v0 .. v6}, Lbox2dLight/ChainLight;-><init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FI[F)V

    return-void
.end method

.method public constructor <init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FI[F)V
    .locals 16

    move-object/from16 v6, p0

    move/from16 v7, p2

    move-object/from16 v8, p6

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, p4

    .line 108
    invoke-direct/range {v0 .. v5}, Lbox2dLight/Light;-><init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FF)V

    .line 38
    new-instance v0, Lcom/badlogic/gdx/utils/FloatArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/FloatArray;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->segmentAngles:Lcom/badlogic/gdx/utils/FloatArray;

    .line 39
    new-instance v0, Lcom/badlogic/gdx/utils/FloatArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/FloatArray;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->segmentLengths:Lcom/badlogic/gdx/utils/FloatArray;

    .line 46
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->bodyPosition:Lcom/badlogic/gdx/math/Vector2;

    .line 47
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    .line 48
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->tmpStart:Lcom/badlogic/gdx/math/Vector2;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->tmpPerp:Lcom/badlogic/gdx/math/Vector2;

    .line 50
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    .line 52
    new-instance v0, Lcom/badlogic/gdx/math/Matrix3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix3;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->zeroPosition:Lcom/badlogic/gdx/math/Matrix3;

    .line 53
    new-instance v0, Lcom/badlogic/gdx/math/Matrix3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix3;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->rotateAroundZero:Lcom/badlogic/gdx/math/Matrix3;

    .line 54
    new-instance v0, Lcom/badlogic/gdx/math/Matrix3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix3;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->restorePosition:Lcom/badlogic/gdx/math/Matrix3;

    .line 56
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->chainLightBounds:Lcom/badlogic/gdx/math/Rectangle;

    .line 57
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object v0, v6, Lbox2dLight/ChainLight;->rayHandlerBounds:Lcom/badlogic/gdx/math/Rectangle;

    .line 109
    sget v0, Lbox2dLight/ChainLight;->defaultRayStartOffset:F

    iput v0, v6, Lbox2dLight/ChainLight;->rayStartOffset:F

    move/from16 v0, p5

    .line 110
    iput v0, v6, Lbox2dLight/ChainLight;->rayDirection:I

    .line 111
    iget v0, v6, Lbox2dLight/ChainLight;->vertexNum:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x2

    mul-int/lit8 v0, v0, 0x2

    iput v0, v6, Lbox2dLight/ChainLight;->vertexNum:I

    .line 112
    new-array v0, v7, [F

    iput-object v0, v6, Lbox2dLight/ChainLight;->endX:[F

    .line 113
    new-array v0, v7, [F

    iput-object v0, v6, Lbox2dLight/ChainLight;->endY:[F

    .line 114
    new-array v0, v7, [F

    iput-object v0, v6, Lbox2dLight/ChainLight;->startX:[F

    .line 115
    new-array v0, v7, [F

    iput-object v0, v6, Lbox2dLight/ChainLight;->startY:[F

    if-eqz v8, :cond_0

    .line 116
    new-instance v0, Lcom/badlogic/gdx/utils/FloatArray;

    invoke-direct {v0, v8}, Lcom/badlogic/gdx/utils/FloatArray;-><init>([F)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/FloatArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/FloatArray;-><init>()V

    :goto_0
    iput-object v0, v6, Lbox2dLight/ChainLight;->chain:Lcom/badlogic/gdx/utils/FloatArray;

    .line 119
    new-instance v0, Lcom/badlogic/gdx/graphics/Mesh;

    sget-object v3, Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;->VertexArray:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    const/4 v4, 0x0

    iget v5, v6, Lbox2dLight/ChainLight;->vertexNum:I

    const/4 v7, 0x0

    const/4 v8, 0x3

    new-array v9, v8, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v10, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v11, "vertex_positions"

    invoke-direct {v10, v1, v2, v11}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    const/4 v12, 0x0

    aput-object v10, v9, v12

    new-instance v10, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v13, "quad_colors"

    const/4 v14, 0x4

    invoke-direct {v10, v14, v14, v13}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v10, v9, v1

    new-instance v10, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v15, "s"

    const/16 v14, 0x20

    invoke-direct {v10, v14, v1, v15}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v10, v9, v2

    move-object/from16 p1, v0

    move-object/from16 p2, v3

    move/from16 p3, v4

    move/from16 p4, v5

    move/from16 p5, v7

    move-object/from16 p6, v9

    invoke-direct/range {p1 .. p6}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    iput-object v0, v6, Lbox2dLight/ChainLight;->lightMesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 124
    new-instance v0, Lcom/badlogic/gdx/graphics/Mesh;

    sget-object v3, Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;->VertexArray:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    iget v5, v6, Lbox2dLight/ChainLight;->vertexNum:I

    mul-int/lit8 v5, v5, 0x2

    new-array v8, v8, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v9, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-direct {v9, v1, v2, v11}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v9, v8, v12

    new-instance v9, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/4 v10, 0x4

    invoke-direct {v9, v10, v10, v13}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v9, v8, v1

    new-instance v9, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-direct {v9, v14, v1, v15}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v9, v8, v2

    move-object/from16 p1, v0

    move-object/from16 p2, v3

    move/from16 p4, v5

    move-object/from16 p6, v8

    invoke-direct/range {p1 .. p6}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    iput-object v0, v6, Lbox2dLight/ChainLight;->softShadowMesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 129
    invoke-virtual/range {p0 .. p0}, Lbox2dLight/ChainLight;->setMesh()V

    return-void
.end method


# virtual methods
.method applyAttachment()V
    .locals 4

    .line 391
    iget-object v0, p0, Lbox2dLight/ChainLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lbox2dLight/ChainLight;->staticLight:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 393
    :cond_0
    iget-object v0, p0, Lbox2dLight/ChainLight;->restorePosition:Lcom/badlogic/gdx/math/Matrix3;

    iget-object v1, p0, Lbox2dLight/ChainLight;->bodyPosition:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Matrix3;->setToTranslation(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Matrix3;

    .line 394
    iget-object v0, p0, Lbox2dLight/ChainLight;->rotateAroundZero:Lcom/badlogic/gdx/math/Matrix3;

    iget v1, p0, Lbox2dLight/ChainLight;->bodyAngle:F

    iget v2, p0, Lbox2dLight/ChainLight;->bodyAngleOffset:F

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Matrix3;->setToRotationRad(F)Lcom/badlogic/gdx/math/Matrix3;

    const/4 v0, 0x0

    .line 395
    :goto_0
    iget v1, p0, Lbox2dLight/ChainLight;->rayNum:I

    if-ge v0, v1, :cond_1

    .line 396
    iget-object v1, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lbox2dLight/ChainLight;->startX:[F

    aget v2, v2, v0

    iget-object v3, p0, Lbox2dLight/ChainLight;->startY:[F

    aget v3, v3, v0

    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    iget-object v2, p0, Lbox2dLight/ChainLight;->rotateAroundZero:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    iget-object v2, p0, Lbox2dLight/ChainLight;->restorePosition:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector2;

    .line 397
    iget-object v1, p0, Lbox2dLight/ChainLight;->startX:[F

    iget-object v2, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v2, v1, v0

    .line 398
    iget-object v1, p0, Lbox2dLight/ChainLight;->startY:[F

    iget-object v2, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v2, v1, v0

    .line 399
    iget-object v1, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lbox2dLight/ChainLight;->endX:[F

    aget v2, v2, v0

    iget-object v3, p0, Lbox2dLight/ChainLight;->endY:[F

    aget v3, v3, v0

    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    iget-object v2, p0, Lbox2dLight/ChainLight;->rotateAroundZero:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    iget-object v2, p0, Lbox2dLight/ChainLight;->restorePosition:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector2;

    .line 400
    iget-object v1, p0, Lbox2dLight/ChainLight;->endX:[F

    iget-object v2, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v2, v1, v0

    .line 401
    iget-object v1, p0, Lbox2dLight/ChainLight;->endY:[F

    iget-object v2, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public attachToBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 1

    const/4 v0, 0x0

    .line 181
    invoke-virtual {p0, p1, v0}, Lbox2dLight/ChainLight;->attachToBody(Lcom/badlogic/gdx/physics/box2d/Body;F)V

    return-void
.end method

.method public attachToBody(Lcom/badlogic/gdx/physics/box2d/Body;F)V
    .locals 2

    .line 195
    iput-object p1, p0, Lbox2dLight/ChainLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 196
    iget-object v0, p0, Lbox2dLight/ChainLight;->bodyPosition:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Body;->getPosition()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    const v0, 0x3c8efa35

    mul-float p2, p2, v0

    .line 197
    iput p2, p0, Lbox2dLight/ChainLight;->bodyAngleOffset:F

    .line 198
    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Body;->getAngle()F

    move-result p1

    iput p1, p0, Lbox2dLight/ChainLight;->bodyAngle:F

    .line 199
    invoke-virtual {p0}, Lbox2dLight/ChainLight;->applyAttachment()V

    .line 200
    iget-boolean p1, p0, Lbox2dLight/ChainLight;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/ChainLight;->dirty:Z

    :cond_0
    return-void
.end method

.method public contains(FF)Z
    .locals 11

    .line 235
    iget-object v0, p0, Lbox2dLight/ChainLight;->chainLightBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Rectangle;->contains(FF)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 238
    :cond_0
    const-class v0, Lcom/badlogic/gdx/utils/FloatArray;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/FloatArray;

    .line 239
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/FloatArray;->clear()V

    const/4 v2, 0x0

    .line 241
    :goto_0
    iget v3, p0, Lbox2dLight/ChainLight;->rayNum:I

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ge v2, v3, :cond_1

    .line 242
    new-array v3, v4, [F

    iget-object v4, p0, Lbox2dLight/ChainLight;->mx:[F

    aget v4, v4, v2

    aput v4, v3, v1

    iget-object v4, p0, Lbox2dLight/ChainLight;->my:[F

    aget v4, v4, v2

    aput v4, v3, v5

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/FloatArray;->addAll([F)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 244
    :cond_1
    iget v2, p0, Lbox2dLight/ChainLight;->rayNum:I

    sub-int/2addr v2, v5

    :goto_1
    const/4 v3, -0x1

    if-le v2, v3, :cond_2

    .line 245
    new-array v3, v4, [F

    iget-object v6, p0, Lbox2dLight/ChainLight;->startX:[F

    aget v6, v6, v2

    aput v6, v3, v1

    iget-object v6, p0, Lbox2dLight/ChainLight;->startY:[F

    aget v6, v6, v2

    aput v6, v3, v5

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/FloatArray;->addAll([F)V

    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 249
    :goto_2
    iget v4, v0, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-ge v2, v4, :cond_6

    .line 250
    iget-object v4, v0, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    aget v4, v4, v2

    .line 251
    iget-object v6, v0, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    add-int/lit8 v7, v2, 0x1

    aget v6, v6, v7

    .line 252
    iget-object v7, v0, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    add-int/lit8 v8, v2, 0x2

    iget v9, v0, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    rem-int v9, v8, v9

    aget v7, v7, v9

    .line 253
    iget-object v9, v0, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    add-int/lit8 v2, v2, 0x3

    iget v10, v0, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    rem-int/2addr v2, v10

    aget v2, v9, v2

    cmpg-float v9, v6, p2

    if-gtz v9, :cond_3

    cmpg-float v9, p2, v2

    if-ltz v9, :cond_4

    :cond_3
    cmpg-float v9, v2, p2

    if-gtz v9, :cond_5

    cmpg-float v9, p2, v6

    if-gez v9, :cond_5

    :cond_4
    sub-float/2addr v7, v4

    sub-float/2addr v2, v6

    div-float/2addr v7, v2

    sub-float v2, p2, v6

    mul-float v7, v7, v2

    add-float/2addr v7, v4

    cmpg-float v2, p1, v7

    if-gez v2, :cond_5

    add-int/lit8 v3, v3, 0x1

    :cond_5
    move v2, v8

    goto :goto_2

    :cond_6
    and-int/lit8 p1, v3, 0x1

    if-ne p1, v5, :cond_7

    const/4 v1, 0x1

    .line 260
    :cond_7
    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    return v1
.end method

.method protected cull()Z
    .locals 3

    .line 406
    iget-object v0, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-boolean v0, v0, Lbox2dLight/RayHandler;->culling:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 407
    iput-boolean v1, p0, Lbox2dLight/ChainLight;->culled:Z

    goto :goto_0

    .line 409
    :cond_0
    invoke-virtual {p0}, Lbox2dLight/ChainLight;->updateBoundingRects()V

    .line 410
    iget-object v0, p0, Lbox2dLight/ChainLight;->chainLightBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1

    iget-object v0, p0, Lbox2dLight/ChainLight;->chainLightBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1

    iget-object v0, p0, Lbox2dLight/ChainLight;->chainLightBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v2, p0, Lbox2dLight/ChainLight;->rayHandlerBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/math/Rectangle;->overlaps(Lcom/badlogic/gdx/math/Rectangle;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    iput-boolean v1, p0, Lbox2dLight/ChainLight;->culled:Z

    .line 414
    :goto_0
    iget-boolean v0, p0, Lbox2dLight/ChainLight;->culled:Z

    return v0
.end method

.method public debugRender(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;)V
    .locals 7

    .line 166
    sget-object v0, Lcom/badlogic/gdx/graphics/Color;->YELLOW:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 167
    const-class v0, Lcom/badlogic/gdx/utils/FloatArray;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/FloatArray;

    .line 168
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/FloatArray;->clear()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 169
    :goto_0
    iget v3, p0, Lbox2dLight/ChainLight;->rayNum:I

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ge v2, v3, :cond_0

    .line 170
    new-array v3, v4, [F

    iget-object v4, p0, Lbox2dLight/ChainLight;->mx:[F

    aget v4, v4, v2

    aput v4, v3, v1

    iget-object v4, p0, Lbox2dLight/ChainLight;->my:[F

    aget v4, v4, v2

    aput v4, v3, v5

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/FloatArray;->addAll([F)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 172
    :cond_0
    iget v2, p0, Lbox2dLight/ChainLight;->rayNum:I

    sub-int/2addr v2, v5

    :goto_1
    const/4 v3, -0x1

    if-le v2, v3, :cond_1

    .line 173
    new-array v3, v4, [F

    iget-object v6, p0, Lbox2dLight/ChainLight;->startX:[F

    aget v6, v6, v2

    aput v6, v3, v1

    iget-object v6, p0, Lbox2dLight/ChainLight;->startY:[F

    aget v6, v6, v2

    aput v6, v3, v5

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/FloatArray;->addAll([F)V

    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 175
    :cond_1
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/FloatArray;->shrink()[F

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->polygon([F)V

    .line 176
    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    return-void
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 205
    iget-object v0, p0, Lbox2dLight/ChainLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getX()F
    .locals 1

    .line 210
    iget-object v0, p0, Lbox2dLight/ChainLight;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 215
    iget-object v0, p0, Lbox2dLight/ChainLight;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    return v0
.end method

.method render()V
    .locals 5

    .line 150
    iget-object v0, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-boolean v0, v0, Lbox2dLight/RayHandler;->culling:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lbox2dLight/ChainLight;->culled:Z

    if-eqz v0, :cond_0

    return-void

    .line 152
    :cond_0
    iget-object v0, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v1, v0, Lbox2dLight/RayHandler;->lightRenderedLastFrame:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lbox2dLight/RayHandler;->lightRenderedLastFrame:I

    .line 153
    iget-object v0, p0, Lbox2dLight/ChainLight;->lightMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, v1, Lbox2dLight/RayHandler;->lightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget v2, p0, Lbox2dLight/ChainLight;->vertexNum:I

    const/4 v3, 0x0

    const/4 v4, 0x5

    invoke-virtual {v0, v1, v4, v3, v2}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    .line 156
    iget-boolean v0, p0, Lbox2dLight/ChainLight;->soft:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lbox2dLight/ChainLight;->xray:Z

    if-nez v0, :cond_1

    .line 157
    iget-object v0, p0, Lbox2dLight/ChainLight;->softShadowMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, v1, Lbox2dLight/RayHandler;->lightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget v2, p0, Lbox2dLight/ChainLight;->vertexNum:I

    invoke-virtual {v0, v1, v4, v3, v2}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    :cond_1
    return-void
.end method

.method public setDirection(F)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setDistance(F)V
    .locals 2

    .line 272
    sget v0, Lbox2dLight/RayHandler;->gammaCorrectionParameter:F

    mul-float p1, p1, v0

    const v0, 0x3c23d70a    # 0.01f

    cmpg-float v1, p1, v0

    if-gez v1, :cond_0

    const p1, 0x3c23d70a    # 0.01f

    .line 273
    :cond_0
    iput p1, p0, Lbox2dLight/ChainLight;->distance:F

    const/4 p1, 0x1

    .line 274
    iput-boolean p1, p0, Lbox2dLight/ChainLight;->dirty:Z

    return-void
.end method

.method protected setMesh()V
    .locals 8

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 460
    :goto_0
    iget v3, p0, Lbox2dLight/ChainLight;->rayNum:I

    const/high16 v4, 0x3f800000    # 1.0f

    if-ge v1, v3, :cond_0

    .line 461
    iget-object v3, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v5, v2, 0x1

    iget-object v6, p0, Lbox2dLight/ChainLight;->startX:[F

    aget v6, v6, v1

    aput v6, v3, v2

    .line 462
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v3, v5, 0x1

    iget-object v6, p0, Lbox2dLight/ChainLight;->startY:[F

    aget v6, v6, v1

    aput v6, v2, v5

    .line 463
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v5, v3, 0x1

    iget v6, p0, Lbox2dLight/ChainLight;->colorF:F

    aput v6, v2, v3

    .line 464
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v3, v5, 0x1

    aput v4, v2, v5

    .line 465
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v5, v3, 0x1

    iget-object v6, p0, Lbox2dLight/ChainLight;->mx:[F

    aget v6, v6, v1

    aput v6, v2, v3

    .line 466
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v3, v5, 0x1

    iget-object v6, p0, Lbox2dLight/ChainLight;->my:[F

    aget v6, v6, v1

    aput v6, v2, v5

    .line 467
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v5, v3, 0x1

    iget v6, p0, Lbox2dLight/ChainLight;->colorF:F

    aput v6, v2, v3

    .line 468
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v3, v5, 0x1

    iget-object v6, p0, Lbox2dLight/ChainLight;->f:[F

    aget v6, v6, v1

    sub-float/2addr v4, v6

    aput v4, v2, v5

    add-int/lit8 v1, v1, 0x1

    move v2, v3

    goto :goto_0

    .line 470
    :cond_0
    iget-object v1, p0, Lbox2dLight/ChainLight;->lightMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v3, p0, Lbox2dLight/ChainLight;->segments:[F

    invoke-virtual {v1, v3, v0, v2}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;

    .line 471
    iget-boolean v1, p0, Lbox2dLight/ChainLight;->soft:Z

    if-eqz v1, :cond_3

    iget-boolean v1, p0, Lbox2dLight/ChainLight;->xray:Z

    if-eqz v1, :cond_1

    goto/16 :goto_2

    :cond_1
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 474
    :goto_1
    iget v3, p0, Lbox2dLight/ChainLight;->rayNum:I

    if-ge v1, v3, :cond_2

    .line 475
    iget-object v3, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v5, v2, 0x1

    iget-object v6, p0, Lbox2dLight/ChainLight;->mx:[F

    aget v6, v6, v1

    aput v6, v3, v2

    .line 476
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v3, v5, 0x1

    iget-object v6, p0, Lbox2dLight/ChainLight;->my:[F

    aget v6, v6, v1

    aput v6, v2, v5

    .line 477
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v5, v3, 0x1

    iget v6, p0, Lbox2dLight/ChainLight;->colorF:F

    aput v6, v2, v3

    .line 478
    iget-object v2, p0, Lbox2dLight/ChainLight;->f:[F

    aget v2, v2, v1

    sub-float v2, v4, v2

    .line 479
    iget-object v3, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v6, v5, 0x1

    aput v2, v3, v5

    .line 480
    iget-object v3, p0, Lbox2dLight/ChainLight;->tmpPerp:Lcom/badlogic/gdx/math/Vector2;

    iget-object v5, p0, Lbox2dLight/ChainLight;->mx:[F

    aget v5, v5, v1

    iget-object v7, p0, Lbox2dLight/ChainLight;->my:[F

    aget v7, v7, v1

    invoke-virtual {v3, v5, v7}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v3

    iget-object v5, p0, Lbox2dLight/ChainLight;->startX:[F

    aget v5, v5, v1

    iget-object v7, p0, Lbox2dLight/ChainLight;->startY:[F

    aget v7, v7, v1

    invoke-virtual {v3, v5, v7}, Lcom/badlogic/gdx/math/Vector2;->sub(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v3

    invoke-virtual {v3}, Lcom/badlogic/gdx/math/Vector2;->nor()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v3

    iget v5, p0, Lbox2dLight/ChainLight;->softShadowLength:F

    mul-float v5, v5, v2

    invoke-virtual {v3, v5}, Lcom/badlogic/gdx/math/Vector2;->scl(F)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v2

    iget-object v3, p0, Lbox2dLight/ChainLight;->mx:[F

    aget v3, v3, v1

    iget-object v5, p0, Lbox2dLight/ChainLight;->my:[F

    aget v5, v5, v1

    invoke-virtual {v2, v3, v5}, Lcom/badlogic/gdx/math/Vector2;->add(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 482
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v3, v6, 0x1

    iget-object v5, p0, Lbox2dLight/ChainLight;->tmpPerp:Lcom/badlogic/gdx/math/Vector2;

    iget v5, v5, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v5, v2, v6

    .line 483
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v5, v3, 0x1

    iget-object v6, p0, Lbox2dLight/ChainLight;->tmpPerp:Lcom/badlogic/gdx/math/Vector2;

    iget v6, v6, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v6, v2, v3

    .line 484
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v3, v5, 0x1

    sget v6, Lbox2dLight/ChainLight;->zeroColorBits:F

    aput v6, v2, v5

    .line 485
    iget-object v2, p0, Lbox2dLight/ChainLight;->segments:[F

    add-int/lit8 v5, v3, 0x1

    const/4 v6, 0x0

    aput v6, v2, v3

    add-int/lit8 v1, v1, 0x1

    move v2, v5

    goto/16 :goto_1

    .line 487
    :cond_2
    iget-object v1, p0, Lbox2dLight/ChainLight;->softShadowMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v3, p0, Lbox2dLight/ChainLight;->segments:[F

    invoke-virtual {v1, v3, v0, v2}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;

    :cond_3
    :goto_2
    return-void
.end method

.method public setPosition(FF)V
    .locals 1

    .line 220
    iget-object v0, p0, Lbox2dLight/ChainLight;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    iput p1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 221
    iget-object p1, p0, Lbox2dLight/ChainLight;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    iput p2, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 222
    iget-boolean p1, p0, Lbox2dLight/ChainLight;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/ChainLight;->dirty:Z

    :cond_0
    return-void
.end method

.method public setPosition(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 2

    .line 227
    iget-object v0, p0, Lbox2dLight/ChainLight;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 228
    iget-object v0, p0, Lbox2dLight/ChainLight;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput p1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 229
    iget-boolean p1, p0, Lbox2dLight/ChainLight;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/ChainLight;->dirty:Z

    :cond_0
    return-void
.end method

.method update()V
    .locals 1

    .line 134
    iget-boolean v0, p0, Lbox2dLight/ChainLight;->dirty:Z

    if-eqz v0, :cond_0

    .line 135
    invoke-virtual {p0}, Lbox2dLight/ChainLight;->updateChain()V

    .line 136
    invoke-virtual {p0}, Lbox2dLight/ChainLight;->applyAttachment()V

    goto :goto_0

    .line 138
    :cond_0
    invoke-virtual {p0}, Lbox2dLight/ChainLight;->updateBody()V

    .line 141
    :goto_0
    invoke-virtual {p0}, Lbox2dLight/ChainLight;->cull()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 142
    :cond_1
    iget-boolean v0, p0, Lbox2dLight/ChainLight;->staticLight:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lbox2dLight/ChainLight;->dirty:Z

    if-nez v0, :cond_2

    return-void

    :cond_2
    const/4 v0, 0x0

    .line 143
    iput-boolean v0, p0, Lbox2dLight/ChainLight;->dirty:Z

    .line 145
    invoke-virtual {p0}, Lbox2dLight/ChainLight;->updateMesh()V

    return-void
.end method

.method updateBody()V
    .locals 4

    .line 418
    iget-object v0, p0, Lbox2dLight/ChainLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lbox2dLight/ChainLight;->staticLight:Z

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 420
    :cond_0
    iget-object v0, p0, Lbox2dLight/ChainLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/Body;->getPosition()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    .line 421
    iget-object v1, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    iget-object v2, p0, Lbox2dLight/ChainLight;->bodyPosition:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->sub(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 422
    iget-object v1, p0, Lbox2dLight/ChainLight;->bodyPosition:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 423
    iget-object v0, p0, Lbox2dLight/ChainLight;->zeroPosition:Lcom/badlogic/gdx/math/Matrix3;

    iget-object v1, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Matrix3;->setToTranslation(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Matrix3;

    .line 424
    iget-object v0, p0, Lbox2dLight/ChainLight;->restorePosition:Lcom/badlogic/gdx/math/Matrix3;

    iget-object v1, p0, Lbox2dLight/ChainLight;->bodyPosition:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Matrix3;->setToTranslation(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Matrix3;

    .line 425
    iget-object v0, p0, Lbox2dLight/ChainLight;->rotateAroundZero:Lcom/badlogic/gdx/math/Matrix3;

    iget v1, p0, Lbox2dLight/ChainLight;->bodyAngle:F

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Matrix3;->setToRotationRad(F)Lcom/badlogic/gdx/math/Matrix3;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Matrix3;->inv()Lcom/badlogic/gdx/math/Matrix3;

    move-result-object v0

    iget-object v1, p0, Lbox2dLight/ChainLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-virtual {v1}, Lcom/badlogic/gdx/physics/box2d/Body;->getAngle()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Matrix3;->rotateRad(F)Lcom/badlogic/gdx/math/Matrix3;

    .line 426
    iget-object v0, p0, Lbox2dLight/ChainLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/Body;->getAngle()F

    move-result v0

    iput v0, p0, Lbox2dLight/ChainLight;->bodyAngle:F

    const/4 v0, 0x0

    .line 428
    :goto_0
    iget v1, p0, Lbox2dLight/ChainLight;->rayNum:I

    if-ge v0, v1, :cond_1

    .line 429
    iget-object v1, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lbox2dLight/ChainLight;->startX:[F

    aget v2, v2, v0

    iget-object v3, p0, Lbox2dLight/ChainLight;->startY:[F

    aget v3, v3, v0

    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    iget-object v2, p0, Lbox2dLight/ChainLight;->zeroPosition:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    iget-object v2, p0, Lbox2dLight/ChainLight;->rotateAroundZero:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    iget-object v2, p0, Lbox2dLight/ChainLight;->restorePosition:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector2;

    .line 431
    iget-object v1, p0, Lbox2dLight/ChainLight;->startX:[F

    iget-object v2, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v2, v1, v0

    .line 432
    iget-object v1, p0, Lbox2dLight/ChainLight;->startY:[F

    iget-object v2, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v2, v1, v0

    .line 434
    iget-object v1, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lbox2dLight/ChainLight;->endX:[F

    aget v2, v2, v0

    iget-object v3, p0, Lbox2dLight/ChainLight;->endY:[F

    aget v3, v3, v0

    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    iget-object v2, p0, Lbox2dLight/ChainLight;->zeroPosition:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    iget-object v2, p0, Lbox2dLight/ChainLight;->rotateAroundZero:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    iget-object v2, p0, Lbox2dLight/ChainLight;->restorePosition:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector2;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector2;

    .line 436
    iget-object v1, p0, Lbox2dLight/ChainLight;->endX:[F

    iget-object v2, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v2, v1, v0

    .line 437
    iget-object v1, p0, Lbox2dLight/ChainLight;->endY:[F

    iget-object v2, p0, Lbox2dLight/ChainLight;->tmpVec:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method protected updateBoundingRects()V
    .locals 7

    .line 492
    iget-object v0, p0, Lbox2dLight/ChainLight;->startX:[F

    const/4 v1, 0x0

    aget v2, v0, v1

    .line 493
    aget v0, v0, v1

    .line 494
    iget-object v3, p0, Lbox2dLight/ChainLight;->startY:[F

    aget v4, v3, v1

    .line 495
    aget v3, v3, v1

    .line 497
    :goto_0
    iget v5, p0, Lbox2dLight/ChainLight;->rayNum:I

    if-ge v1, v5, :cond_8

    .line 498
    iget-object v5, p0, Lbox2dLight/ChainLight;->startX:[F

    aget v6, v5, v1

    cmpl-float v6, v2, v6

    if-lez v6, :cond_0

    goto :goto_1

    :cond_0
    aget v2, v5, v1

    .line 499
    :goto_1
    iget-object v5, p0, Lbox2dLight/ChainLight;->mx:[F

    aget v5, v5, v1

    cmpl-float v5, v2, v5

    if-lez v5, :cond_1

    goto :goto_2

    :cond_1
    iget-object v2, p0, Lbox2dLight/ChainLight;->mx:[F

    aget v2, v2, v1

    .line 500
    :goto_2
    iget-object v5, p0, Lbox2dLight/ChainLight;->startX:[F

    aget v6, v5, v1

    cmpg-float v6, v0, v6

    if-gez v6, :cond_2

    goto :goto_3

    :cond_2
    aget v0, v5, v1

    .line 501
    :goto_3
    iget-object v5, p0, Lbox2dLight/ChainLight;->mx:[F

    aget v5, v5, v1

    cmpg-float v5, v0, v5

    if-gez v5, :cond_3

    goto :goto_4

    :cond_3
    iget-object v0, p0, Lbox2dLight/ChainLight;->mx:[F

    aget v0, v0, v1

    .line 502
    :goto_4
    iget-object v5, p0, Lbox2dLight/ChainLight;->startY:[F

    aget v6, v5, v1

    cmpl-float v6, v4, v6

    if-lez v6, :cond_4

    goto :goto_5

    :cond_4
    aget v4, v5, v1

    .line 503
    :goto_5
    iget-object v5, p0, Lbox2dLight/ChainLight;->my:[F

    aget v5, v5, v1

    cmpl-float v5, v4, v5

    if-lez v5, :cond_5

    goto :goto_6

    :cond_5
    iget-object v4, p0, Lbox2dLight/ChainLight;->my:[F

    aget v4, v4, v1

    .line 504
    :goto_6
    iget-object v5, p0, Lbox2dLight/ChainLight;->startY:[F

    aget v6, v5, v1

    cmpg-float v6, v3, v6

    if-gez v6, :cond_6

    goto :goto_7

    :cond_6
    aget v3, v5, v1

    .line 505
    :goto_7
    iget-object v5, p0, Lbox2dLight/ChainLight;->my:[F

    aget v5, v5, v1

    cmpg-float v5, v3, v5

    if-gez v5, :cond_7

    goto :goto_8

    :cond_7
    iget-object v3, p0, Lbox2dLight/ChainLight;->my:[F

    aget v3, v3, v1

    :goto_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 507
    :cond_8
    iget-object v1, p0, Lbox2dLight/ChainLight;->chainLightBounds:Lcom/badlogic/gdx/math/Rectangle;

    sub-float/2addr v2, v0

    sub-float/2addr v4, v3

    invoke-virtual {v1, v0, v3, v2, v4}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    .line 508
    iget-object v0, p0, Lbox2dLight/ChainLight;->rayHandlerBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v1, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v1, v1, Lbox2dLight/RayHandler;->x1:F

    iget-object v2, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v2, v2, Lbox2dLight/RayHandler;->y1:F

    iget-object v3, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v3, v3, Lbox2dLight/RayHandler;->x2:F

    iget-object v4, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v4, v4, Lbox2dLight/RayHandler;->x1:F

    sub-float/2addr v3, v4

    iget-object v4, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v4, v4, Lbox2dLight/RayHandler;->y2:F

    iget-object v5, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v5, v5, Lbox2dLight/RayHandler;->y1:F

    sub-float/2addr v4, v5

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    return-void
.end method

.method public updateChain()V
    .locals 25

    move-object/from16 v0, p0

    .line 288
    const-class v1, Lcom/badlogic/gdx/math/Vector2;

    invoke-static {v1}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/math/Vector2;

    .line 289
    const-class v2, Lcom/badlogic/gdx/math/Vector2;

    invoke-static {v2}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/math/Vector2;

    .line 290
    const-class v3, Lcom/badlogic/gdx/math/Vector2;

    invoke-static {v3}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/math/Vector2;

    .line 291
    const-class v4, Lcom/badlogic/gdx/math/Vector2;

    invoke-static {v4}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/math/Vector2;

    .line 292
    const-class v5, Lcom/badlogic/gdx/math/Vector2;

    invoke-static {v5}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/badlogic/gdx/math/Vector2;

    .line 293
    const-class v6, Lbox2dLight/Spinor;

    invoke-static {v6}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lbox2dLight/Spinor;

    .line 295
    const-class v7, Lbox2dLight/Spinor;

    invoke-static {v7}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lbox2dLight/Spinor;

    .line 296
    const-class v8, Lbox2dLight/Spinor;

    invoke-static {v8}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lbox2dLight/Spinor;

    .line 297
    const-class v9, Lbox2dLight/Spinor;

    invoke-static {v9}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lbox2dLight/Spinor;

    .line 300
    const-class v10, Lbox2dLight/Spinor;

    invoke-static {v10}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lbox2dLight/Spinor;

    .line 301
    const-class v11, Lbox2dLight/Spinor;

    invoke-static {v11}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lbox2dLight/Spinor;

    .line 302
    const-class v12, Lbox2dLight/Spinor;

    invoke-static {v12}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lbox2dLight/Spinor;

    .line 304
    iget-object v13, v0, Lbox2dLight/ChainLight;->chain:Lcom/badlogic/gdx/utils/FloatArray;

    iget v13, v13, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    div-int/lit8 v13, v13, 0x2

    add-int/lit8 v13, v13, -0x1

    .line 306
    iget-object v14, v0, Lbox2dLight/ChainLight;->segmentAngles:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v14}, Lcom/badlogic/gdx/utils/FloatArray;->clear()V

    .line 307
    iget-object v14, v0, Lbox2dLight/ChainLight;->segmentLengths:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v14}, Lcom/badlogic/gdx/utils/FloatArray;->clear()V

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    .line 310
    :goto_0
    iget-object v14, v0, Lbox2dLight/ChainLight;->chain:Lcom/badlogic/gdx/utils/FloatArray;

    iget v14, v14, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    add-int/lit8 v14, v14, -0x2

    if-ge v15, v14, :cond_0

    .line 311
    iget-object v14, v0, Lbox2dLight/ChainLight;->chain:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v14, v14, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    add-int/lit8 v18, v15, 0x2

    aget v14, v14, v18

    move-object/from16 v19, v6

    iget-object v6, v0, Lbox2dLight/ChainLight;->chain:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v6, v6, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    add-int/lit8 v20, v15, 0x3

    aget v6, v6, v20

    invoke-virtual {v1, v14, v6}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v6

    iget-object v14, v0, Lbox2dLight/ChainLight;->chain:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v14, v14, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    aget v14, v14, v15

    move-object/from16 v20, v2

    iget-object v2, v0, Lbox2dLight/ChainLight;->chain:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v2, v2, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    add-int/lit8 v15, v15, 0x1

    aget v2, v2, v15

    invoke-virtual {v6, v14, v2}, Lcom/badlogic/gdx/math/Vector2;->sub(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 313
    iget-object v2, v0, Lbox2dLight/ChainLight;->segmentLengths:Lcom/badlogic/gdx/utils/FloatArray;

    invoke-virtual {v1}, Lcom/badlogic/gdx/math/Vector2;->len()F

    move-result v6

    invoke-virtual {v2, v6}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 314
    iget-object v2, v0, Lbox2dLight/ChainLight;->segmentAngles:Lcom/badlogic/gdx/utils/FloatArray;

    iget v6, v0, Lbox2dLight/ChainLight;->rayDirection:I

    invoke-virtual {v1, v6}, Lcom/badlogic/gdx/math/Vector2;->rotate90(I)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v6

    invoke-virtual {v6}, Lcom/badlogic/gdx/math/Vector2;->angle()F

    move-result v6

    const v14, 0x3c8efa35

    mul-float v6, v6, v14

    invoke-virtual {v2, v6}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 317
    iget-object v2, v0, Lbox2dLight/ChainLight;->segmentLengths:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v2, v2, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    aget v2, v2, v17

    add-float v16, v16, v2

    add-int/lit8 v17, v17, 0x1

    move/from16 v15, v18

    move-object/from16 v6, v19

    move-object/from16 v2, v20

    goto :goto_0

    :cond_0
    move-object/from16 v20, v2

    move-object/from16 v19, v6

    .line 321
    iget v2, v0, Lbox2dLight/ChainLight;->rayNum:I

    move v6, v2

    const/4 v2, 0x0

    const/4 v14, 0x0

    :goto_1
    if-ge v2, v13, :cond_5

    if-nez v2, :cond_1

    .line 325
    iget-object v15, v0, Lbox2dLight/ChainLight;->segmentAngles:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    aget v15, v15, v2

    goto :goto_2

    :cond_1
    iget-object v15, v0, Lbox2dLight/ChainLight;->segmentAngles:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    add-int/lit8 v17, v2, -0x1

    aget v15, v15, v17

    :goto_2
    invoke-virtual {v7, v15}, Lbox2dLight/Spinor;->set(F)Lbox2dLight/Spinor;

    .line 328
    iget-object v15, v0, Lbox2dLight/ChainLight;->segmentAngles:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    aget v15, v15, v2

    invoke-virtual {v8, v15}, Lbox2dLight/Spinor;->set(F)Lbox2dLight/Spinor;

    .line 329
    iget-object v15, v0, Lbox2dLight/ChainLight;->segmentAngles:Lcom/badlogic/gdx/utils/FloatArray;

    iget v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    add-int/lit8 v15, v15, -0x1

    if-ne v2, v15, :cond_2

    iget-object v15, v0, Lbox2dLight/ChainLight;->segmentAngles:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    aget v15, v15, v2

    goto :goto_3

    :cond_2
    iget-object v15, v0, Lbox2dLight/ChainLight;->segmentAngles:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    add-int/lit8 v17, v2, 0x1

    aget v15, v15, v17

    :goto_3
    invoke-virtual {v9, v15}, Lbox2dLight/Spinor;->set(F)Lbox2dLight/Spinor;

    .line 334
    invoke-virtual {v10, v7}, Lbox2dLight/Spinor;->set(Lbox2dLight/Spinor;)Lbox2dLight/Spinor;

    move-result-object v15

    move/from16 v17, v14

    const/high16 v14, 0x3f000000    # 0.5f

    invoke-virtual {v15, v8, v14}, Lbox2dLight/Spinor;->slerp(Lbox2dLight/Spinor;F)Lbox2dLight/Spinor;

    .line 335
    invoke-virtual {v11, v8}, Lbox2dLight/Spinor;->set(Lbox2dLight/Spinor;)Lbox2dLight/Spinor;

    move-result-object v15

    invoke-virtual {v15, v9, v14}, Lbox2dLight/Spinor;->slerp(Lbox2dLight/Spinor;F)Lbox2dLight/Spinor;

    mul-int/lit8 v14, v2, 0x2

    .line 338
    iget-object v15, v0, Lbox2dLight/ChainLight;->chain:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    aget v15, v15, v14

    move-object/from16 v18, v9

    iget-object v9, v0, Lbox2dLight/ChainLight;->chain:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v9, v9, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    add-int/lit8 v21, v14, 0x1

    aget v9, v9, v21

    invoke-virtual {v3, v15, v9}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 340
    iget-object v9, v0, Lbox2dLight/ChainLight;->chain:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v9, v9, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    add-int/lit8 v15, v14, 0x2

    aget v9, v9, v15

    iget-object v15, v0, Lbox2dLight/ChainLight;->chain:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    add-int/lit8 v14, v14, 0x3

    aget v14, v15, v14

    invoke-virtual {v4, v9, v14}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v9

    invoke-virtual {v9, v3}, Lcom/badlogic/gdx/math/Vector2;->sub(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v9

    invoke-virtual {v9}, Lcom/badlogic/gdx/math/Vector2;->nor()Lcom/badlogic/gdx/math/Vector2;

    int-to-float v9, v6

    div-float v14, v16, v9

    add-int/lit8 v15, v13, -0x1

    if-ne v2, v15, :cond_3

    move v9, v6

    goto :goto_4

    .line 345
    :cond_3
    iget-object v15, v0, Lbox2dLight/ChainLight;->segmentLengths:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v15, v15, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    aget v15, v15, v2

    div-float v15, v15, v16

    mul-float v15, v15, v9

    float-to-int v9, v15

    :goto_4
    const/4 v15, 0x0

    :goto_5
    if-ge v15, v9, :cond_4

    move/from16 v21, v13

    int-to-float v13, v15

    mul-float v13, v13, v14

    move/from16 v22, v14

    .line 354
    invoke-virtual {v12, v10}, Lbox2dLight/Spinor;->set(Lbox2dLight/Spinor;)Lbox2dLight/Spinor;

    move-result-object v14

    move-object/from16 v23, v10

    iget-object v10, v0, Lbox2dLight/ChainLight;->segmentLengths:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v10, v10, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    aget v10, v10, v2

    div-float v10, v13, v10

    invoke-virtual {v14, v11, v10}, Lbox2dLight/Spinor;->slerp(Lbox2dLight/Spinor;F)Lbox2dLight/Spinor;

    .line 356
    invoke-virtual {v12}, Lbox2dLight/Spinor;->angle()F

    move-result v10

    .line 357
    iget v14, v0, Lbox2dLight/ChainLight;->rayStartOffset:F

    move-object/from16 v24, v12

    const/4 v12, 0x0

    invoke-virtual {v5, v14, v12}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v14

    invoke-virtual {v14, v10}, Lcom/badlogic/gdx/math/Vector2;->rotateRad(F)Lcom/badlogic/gdx/math/Vector2;

    .line 358
    invoke-virtual {v1, v4}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v12

    invoke-virtual {v12, v13}, Lcom/badlogic/gdx/math/Vector2;->scl(F)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v12

    invoke-virtual {v12, v3}, Lcom/badlogic/gdx/math/Vector2;->add(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v12

    invoke-virtual {v12, v5}, Lcom/badlogic/gdx/math/Vector2;->add(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 360
    iget-object v12, v0, Lbox2dLight/ChainLight;->startX:[F

    iget v13, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v13, v12, v17

    .line 361
    iget-object v12, v0, Lbox2dLight/ChainLight;->startY:[F

    iget v13, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v13, v12, v17

    .line 362
    iget v12, v0, Lbox2dLight/ChainLight;->distance:F

    move-object/from16 v13, v20

    const/4 v14, 0x0

    invoke-virtual {v13, v12, v14}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v12

    invoke-virtual {v12, v10}, Lcom/badlogic/gdx/math/Vector2;->rotateRad(F)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v10

    invoke-virtual {v10, v1}, Lcom/badlogic/gdx/math/Vector2;->add(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 363
    iget-object v10, v0, Lbox2dLight/ChainLight;->endX:[F

    iget v12, v13, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v12, v10, v17

    .line 364
    iget-object v10, v0, Lbox2dLight/ChainLight;->endY:[F

    iget v12, v13, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v12, v10, v17

    add-int/lit8 v17, v17, 0x1

    add-int/lit8 v15, v15, 0x1

    move/from16 v13, v21

    move/from16 v14, v22

    move-object/from16 v10, v23

    move-object/from16 v12, v24

    goto :goto_5

    :cond_4
    move-object/from16 v23, v10

    move-object/from16 v24, v12

    move/from16 v21, v13

    move-object/from16 v13, v20

    const/4 v14, 0x0

    sub-int/2addr v6, v9

    .line 369
    iget-object v9, v0, Lbox2dLight/ChainLight;->segmentLengths:Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v9, v9, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    aget v9, v9, v2

    sub-float v16, v16, v9

    add-int/lit8 v2, v2, 0x1

    move/from16 v14, v17

    move-object/from16 v9, v18

    move/from16 v13, v21

    goto/16 :goto_1

    :cond_5
    move-object/from16 v18, v9

    move-object/from16 v23, v10

    move-object/from16 v24, v12

    move-object/from16 v13, v20

    .line 373
    invoke-static {v1}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    .line 374
    invoke-static {v13}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    .line 375
    invoke-static {v3}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    .line 376
    invoke-static {v4}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    .line 377
    invoke-static {v5}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    .line 378
    invoke-static {v7}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    .line 379
    invoke-static {v8}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    .line 380
    invoke-static/range {v18 .. v18}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    .line 381
    invoke-static/range {v23 .. v23}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    .line 382
    invoke-static {v11}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    .line 383
    invoke-static/range {v24 .. v24}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    .line 384
    invoke-static/range {v19 .. v19}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    return-void
.end method

.method protected updateMesh()V
    .locals 5

    const/4 v0, 0x0

    .line 442
    :goto_0
    iget v1, p0, Lbox2dLight/ChainLight;->rayNum:I

    if-ge v0, v1, :cond_1

    .line 443
    iput v0, p0, Lbox2dLight/ChainLight;->m_index:I

    .line 444
    iget-object v1, p0, Lbox2dLight/ChainLight;->f:[F

    const/high16 v2, 0x3f800000    # 1.0f

    aput v2, v1, v0

    .line 445
    iget-object v1, p0, Lbox2dLight/ChainLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lbox2dLight/ChainLight;->endX:[F

    aget v2, v2, v0

    iput v2, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 446
    iget-object v1, p0, Lbox2dLight/ChainLight;->mx:[F

    iget-object v2, p0, Lbox2dLight/ChainLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v2, v1, v0

    .line 447
    iget-object v1, p0, Lbox2dLight/ChainLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lbox2dLight/ChainLight;->endY:[F

    aget v2, v2, v0

    iput v2, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 448
    iget-object v1, p0, Lbox2dLight/ChainLight;->my:[F

    iget-object v2, p0, Lbox2dLight/ChainLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v2, v1, v0

    .line 449
    iget-object v1, p0, Lbox2dLight/ChainLight;->tmpStart:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lbox2dLight/ChainLight;->startX:[F

    aget v2, v2, v0

    iput v2, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 450
    iget-object v2, p0, Lbox2dLight/ChainLight;->startY:[F

    aget v2, v2, v0

    iput v2, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 451
    iget-object v1, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, v1, Lbox2dLight/RayHandler;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lbox2dLight/ChainLight;->xray:Z

    if-nez v1, :cond_0

    .line 452
    iget-object v1, p0, Lbox2dLight/ChainLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, v1, Lbox2dLight/RayHandler;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-object v2, p0, Lbox2dLight/ChainLight;->ray:Lcom/badlogic/gdx/physics/box2d/RayCastCallback;

    iget-object v3, p0, Lbox2dLight/ChainLight;->tmpStart:Lcom/badlogic/gdx/math/Vector2;

    iget-object v4, p0, Lbox2dLight/ChainLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v1, v2, v3, v4}, Lcom/badlogic/gdx/physics/box2d/World;->rayCast(Lcom/badlogic/gdx/physics/box2d/RayCastCallback;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 455
    :cond_1
    invoke-virtual {p0}, Lbox2dLight/ChainLight;->setMesh()V

    return-void
.end method
