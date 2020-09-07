.class public Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;
.super Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;
.source "BillboardParticleBatch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$Config;,
        Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch<",
        "Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;",
        ">;"
    }
.end annotation


# static fields
.field private static final CPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

.field private static final CPU_COLOR_OFFSET:I

.field private static final CPU_POSITION_OFFSET:I

.field private static final CPU_UV_OFFSET:I

.field private static final CPU_VERTEX_SIZE:I

.field private static final GPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

.field private static final GPU_COLOR_OFFSET:I

.field private static final GPU_POSITION_OFFSET:I

.field private static final GPU_SIZE_ROTATION_OFFSET:I

.field private static final GPU_UV_OFFSET:I

.field private static final GPU_VERTEX_SIZE:I

.field private static final MAX_PARTICLES_PER_MESH:I = 0x1fff

.field private static final MAX_VERTICES_PER_MESH:I = 0x7ffc

.field protected static final TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

.field protected static final TMP_V1:Lcom/badlogic/gdx/math/Vector3;

.field protected static final TMP_V2:Lcom/badlogic/gdx/math/Vector3;

.field protected static final TMP_V3:Lcom/badlogic/gdx/math/Vector3;

.field protected static final TMP_V4:Lcom/badlogic/gdx/math/Vector3;

.field protected static final TMP_V5:Lcom/badlogic/gdx/math/Vector3;

.field protected static final TMP_V6:Lcom/badlogic/gdx/math/Vector3;

.field protected static final directionUsage:I = 0x400

.field protected static final sizeAndRotationUsage:I = 0x200


# instance fields
.field protected blendingAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

.field private currentAttributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

.field private currentVertexSize:I

.field protected depthTestAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;

.field private indices:[S

.field protected mode:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

.field private renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

.field private renderables:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;"
        }
    .end annotation
.end field

.field shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

.field protected texture:Lcom/badlogic/gdx/graphics/Texture;

.field protected useGPU:Z

.field private vertices:[F


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 50
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V3:Lcom/badlogic/gdx/math/Vector3;

    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V4:Lcom/badlogic/gdx/math/Vector3;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V5:Lcom/badlogic/gdx/math/Vector3;

    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    .line 52
    new-instance v0, Lcom/badlogic/gdx/math/Matrix3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

    .line 55
    new-instance v0, Lcom/badlogic/gdx/graphics/VertexAttributes;

    const/4 v1, 0x4

    new-array v2, v1, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v3, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v4, "a_position"

    const/4 v5, 0x3

    const/4 v6, 0x1

    invoke-direct {v3, v6, v5, v4}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    const/4 v7, 0x0

    aput-object v3, v2, v7

    new-instance v3, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v8, "a_texCoord0"

    const/16 v9, 0x10

    const/4 v10, 0x2

    invoke-direct {v3, v9, v10, v8}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v3, v2, v6

    new-instance v3, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v11, "a_color"

    invoke-direct {v3, v10, v1, v11}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v3, v2, v10

    new-instance v3, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/16 v12, 0x200

    const-string v13, "a_sizeAndRotation"

    invoke-direct {v3, v12, v1, v13}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v3, v2, v5

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/graphics/VertexAttributes;-><init>([Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    .line 66
    new-instance v0, Lcom/badlogic/gdx/graphics/VertexAttributes;

    new-array v2, v5, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v3, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-direct {v3, v6, v5, v4}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v3, v2, v7

    new-instance v3, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-direct {v3, v9, v10, v8}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v3, v2, v6

    new-instance v3, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-direct {v3, v10, v1, v11}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v3, v2, v10

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/graphics/VertexAttributes;-><init>([Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    .line 71
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/graphics/VertexAttributes;->findByUsage(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/2addr v0, v1

    int-to-short v0, v0

    sput v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_POSITION_OFFSET:I

    .line 72
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0, v9}, Lcom/badlogic/gdx/graphics/VertexAttributes;->findByUsage(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/2addr v0, v1

    int-to-short v0, v0

    sput v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_UV_OFFSET:I

    .line 73
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0, v12}, Lcom/badlogic/gdx/graphics/VertexAttributes;->findByUsage(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/2addr v0, v1

    int-to-short v0, v0

    sput v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_SIZE_ROTATION_OFFSET:I

    .line 74
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0, v10}, Lcom/badlogic/gdx/graphics/VertexAttributes;->findByUsage(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/2addr v0, v1

    int-to-short v0, v0

    sput v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_COLOR_OFFSET:I

    .line 75
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v0, v0, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/2addr v0, v1

    sput v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_VERTEX_SIZE:I

    .line 87
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/graphics/VertexAttributes;->findByUsage(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/2addr v0, v1

    int-to-short v0, v0

    sput v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_POSITION_OFFSET:I

    .line 88
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0, v9}, Lcom/badlogic/gdx/graphics/VertexAttributes;->findByUsage(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/2addr v0, v1

    int-to-short v0, v0

    sput v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_UV_OFFSET:I

    .line 89
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0, v10}, Lcom/badlogic/gdx/graphics/VertexAttributes;->findByUsage(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/2addr v0, v1

    int-to-short v0, v0

    sput v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_COLOR_OFFSET:I

    .line 90
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v0, v0, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/2addr v0, v1

    sput v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_VERTEX_SIZE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 159
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;->Screen:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    const/4 v1, 0x0

    const/16 v2, 0x64

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;ZI)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 163
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;->Screen:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;ZI)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;ZI)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    .line 155
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;ZILcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;ZILcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;)V
    .locals 3

    .line 137
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;-><init>(Ljava/lang/Class;)V

    const/4 v0, 0x0

    .line 120
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    .line 122
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->useGPU:Z

    .line 123
    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;->Screen:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->mode:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    .line 138
    new-instance v1, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v1}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    .line 139
    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    invoke-direct {v1, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;)V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    .line 140
    iput-object p4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->blendingAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

    .line 141
    iput-object p5, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->depthTestAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;

    .line 143
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->blendingAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

    if-nez p4, :cond_0

    .line 144
    new-instance p4, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

    const/4 p5, 0x1

    const/16 v1, 0x303

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p4, p5, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;-><init>(IIF)V

    iput-object p4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->blendingAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

    .line 145
    :cond_0
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->depthTestAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;

    if-nez p4, :cond_1

    new-instance p4, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;

    const/16 p5, 0x203

    invoke-direct {p4, p5, v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;-><init>(IZ)V

    iput-object p4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->depthTestAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;

    .line 147
    :cond_1
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->allocIndices()V

    .line 148
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->initRenderData()V

    .line 149
    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->ensureCapacity(I)V

    .line 150
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->setUseGpu(Z)V

    .line 151
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->setAlignMode(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;)V

    return-void
.end method

.method private allocIndices()V
    .locals 7

    const v0, 0xbffa

    .line 185
    new-array v1, v0, [S

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->indices:[S

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 187
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->indices:[S

    int-to-short v4, v2

    aput-short v4, v3, v1

    add-int/lit8 v5, v1, 0x1

    add-int/lit8 v6, v2, 0x1

    int-to-short v6, v6

    .line 188
    aput-short v6, v3, v5

    add-int/lit8 v5, v1, 0x2

    add-int/lit8 v6, v2, 0x2

    int-to-short v6, v6

    .line 189
    aput-short v6, v3, v5

    add-int/lit8 v5, v1, 0x3

    .line 190
    aput-short v6, v3, v5

    add-int/lit8 v5, v1, 0x4

    add-int/lit8 v6, v2, 0x3

    int-to-short v6, v6

    .line 191
    aput-short v6, v3, v5

    add-int/lit8 v5, v1, 0x5

    .line 192
    aput-short v4, v3, v5

    add-int/lit8 v1, v1, 0x6

    add-int/lit8 v2, v2, 0x4

    goto :goto_0

    :cond_0
    return-void
.end method

.method private allocRenderables(I)V
    .locals 3

    .line 198
    div-int/lit16 p1, p1, 0x1fff

    int-to-float p1, p1

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->ceil(F)I

    move-result p1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->getFree()I

    move-result v0

    if-ge v0, p1, :cond_0

    const/4 v1, 0x0

    sub-int/2addr p1, v0

    :goto_0
    if-ge v1, p1, :cond_0

    .line 201
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->newObject()Lcom/badlogic/gdx/graphics/g3d/Renderable;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->free(Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private allocShader()V
    .locals 2

    .line 212
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->allocRenderable()Lcom/badlogic/gdx/graphics/g3d/Renderable;

    move-result-object v0

    .line 213
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->getShader(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Shader;

    move-result-object v1

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    .line 214
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->free(Ljava/lang/Object;)V

    return-void
.end method

.method private clearRenderablesPool()V
    .locals 3

    .line 218
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->freeAll(Lcom/badlogic/gdx/utils/Array;)V

    .line 219
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->getFree()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 220
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->obtain()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 221
    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 223
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method private fillVerticesGPU([I)V
    .locals 56

    move-object/from16 v0, p0

    .line 354
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderData:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v3, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;

    .line 355
    iget-object v5, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->scaleChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 356
    iget-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->regionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 357
    iget-object v7, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 358
    iget-object v8, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->colorChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 359
    iget-object v9, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 360
    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    move v10, v3

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v4, :cond_0

    .line 361
    aget v11, p1, v10

    iget v12, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    mul-int v11, v11, v12

    mul-int/lit8 v11, v11, 0x4

    .line 362
    iget-object v12, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    iget v13, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v13, v13, v3

    aget v12, v12, v13

    .line 363
    iget v13, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v13, v13, v3

    .line 364
    iget v14, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v14, v14, v3

    .line 365
    iget v15, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v15, v15, v3

    .line 366
    iget v2, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v2, v2, v3

    move-object/from16 v27, v1

    .line 367
    iget-object v1, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v14, 0x0

    aget v1, v1, v16

    move/from16 v43, v4

    iget-object v4, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v14, 0x1

    aget v4, v4, v16

    move-object/from16 v44, v5

    .line 368
    iget-object v5, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v14, v14, 0x2

    aget v5, v5, v14

    .line 369
    iget-object v14, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v13, 0x0

    aget v45, v14, v16

    .line 370
    iget-object v14, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v13, 0x1

    aget v46, v14, v16

    .line 371
    iget-object v14, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v13, 0x2

    aget v47, v14, v16

    .line 372
    iget-object v14, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v13, 0x3

    aget v34, v14, v16

    .line 373
    iget-object v14, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v13, 0x4

    aget v14, v14, v16

    mul-float v14, v14, v12

    move-object/from16 v48, v7

    iget-object v7, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v13, v13, 0x5

    aget v7, v7, v13

    mul-float v7, v7, v12

    .line 376
    iget-object v12, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v13, v15, 0x0

    aget v49, v12, v13

    .line 377
    iget-object v12, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v13, v15, 0x1

    aget v50, v12, v13

    .line 378
    iget-object v12, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v13, v15, 0x2

    aget v51, v12, v13

    .line 379
    iget-object v12, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v15, v15, 0x3

    aget v52, v12, v15

    .line 380
    iget-object v12, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v13, v2, 0x0

    aget v53, v12, v13

    .line 381
    iget-object v12, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v2, v2, 0x1

    aget v2, v12, v2

    .line 384
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    neg-float v15, v14

    neg-float v13, v7

    move/from16 v36, v13

    move v13, v11

    move/from16 v54, v14

    move v14, v1

    move/from16 v55, v15

    move v15, v4

    move/from16 v16, v5

    move/from16 v17, v45

    move/from16 v18, v34

    move/from16 v19, v55

    move/from16 v20, v36

    move/from16 v21, v53

    move/from16 v22, v2

    move/from16 v23, v49

    move/from16 v24, v50

    move/from16 v25, v51

    move/from16 v26, v52

    invoke-static/range {v12 .. v26}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FIFFFFFFFFFFFFF)V

    .line 385
    iget v12, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int/2addr v11, v12

    .line 386
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    move-object/from16 v28, v12

    move/from16 v29, v11

    move/from16 v30, v1

    move/from16 v31, v4

    move/from16 v32, v5

    move/from16 v33, v47

    move/from16 v35, v54

    move/from16 v37, v53

    move/from16 v38, v2

    move/from16 v39, v49

    move/from16 v40, v50

    move/from16 v41, v51

    move/from16 v42, v52

    invoke-static/range {v28 .. v42}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FIFFFFFFFFFFFFF)V

    .line 387
    iget v12, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int/2addr v11, v12

    .line 388
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    move-object/from16 v28, v12

    move/from16 v29, v11

    move/from16 v34, v46

    move/from16 v36, v7

    invoke-static/range {v28 .. v42}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FIFFFFFFFFFFFFF)V

    .line 389
    iget v12, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int v29, v11, v12

    .line 390
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    move-object/from16 v28, v11

    move/from16 v33, v45

    move/from16 v35, v55

    invoke-static/range {v28 .. v42}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FIFFFFFFFFFFFFF)V

    .line 391
    iget v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v10, v10, 0x1

    move-object/from16 v1, v27

    move/from16 v4, v43

    move-object/from16 v5, v44

    move-object/from16 v7, v48

    goto/16 :goto_1

    :cond_0
    move v3, v10

    goto/16 :goto_0

    :cond_1
    return-void
.end method

.method private fillVerticesToScreenCPU([I)V
    .locals 50

    move-object/from16 v0, p0

    .line 540
    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V3:Lcom/badlogic/gdx/math/Vector3;

    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/Camera;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v1

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v1

    .line 541
    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V4:Lcom/badlogic/gdx/math/Vector3;

    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    invoke-virtual {v2}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    .line 542
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    .line 545
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderData:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v4}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v4

    const/4 v6, 0x0

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;

    .line 546
    iget-object v8, v7, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->scaleChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 547
    iget-object v9, v7, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->regionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 548
    iget-object v10, v7, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 549
    iget-object v11, v7, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->colorChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 550
    iget-object v12, v7, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 552
    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    move v13, v6

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v7, :cond_1

    .line 553
    aget v14, p1, v13

    iget v15, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    mul-int v14, v14, v15

    mul-int/lit8 v14, v14, 0x4

    .line 554
    iget-object v15, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    iget v5, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v5, v5, v6

    aget v5, v15, v5

    .line 555
    iget v15, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v15, v15, v6

    move-object/from16 v24, v4

    .line 556
    iget v4, v10, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v4, v4, v6

    move/from16 v25, v7

    .line 557
    iget v7, v11, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v7, v7, v6

    move-object/from16 v26, v8

    .line 558
    iget v8, v12, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v8, v8, v6

    move/from16 v27, v13

    .line 559
    iget-object v13, v10, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v4, 0x0

    aget v13, v13, v16

    move/from16 v28, v6

    iget-object v6, v10, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v4, 0x1

    aget v6, v6, v16

    move/from16 v29, v14

    .line 560
    iget-object v14, v10, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v4, v4, 0x2

    aget v4, v14, v4

    .line 561
    iget-object v14, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v15, 0x0

    aget v33, v14, v16

    .line 562
    iget-object v14, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v15, 0x1

    aget v14, v14, v16

    move-object/from16 v43, v10

    .line 563
    iget-object v10, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v15, 0x2

    aget v10, v10, v16

    move/from16 v44, v14

    .line 564
    iget-object v14, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v15, 0x3

    aget v38, v14, v16

    .line 565
    iget-object v14, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v15, 0x4

    aget v14, v14, v16

    mul-float v14, v14, v5

    move/from16 v30, v10

    iget-object v10, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v15, v15, 0x5

    aget v10, v10, v15

    mul-float v10, v10, v5

    .line 568
    iget-object v5, v11, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v15, v7, 0x0

    aget v5, v5, v15

    .line 569
    iget-object v15, v11, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v7, 0x1

    aget v45, v15, v16

    .line 570
    iget-object v15, v11, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v7, 0x2

    aget v46, v15, v16

    .line 571
    iget-object v15, v11, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v7, v7, 0x3

    aget v7, v15, v7

    .line 572
    iget-object v15, v12, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v8, 0x0

    aget v15, v15, v16

    move-object/from16 v47, v9

    .line 573
    iget-object v9, v12, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v8, v8, 0x1

    aget v8, v9, v8

    .line 574
    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v9, v2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v9

    invoke-virtual {v9, v14}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    .line 575
    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v9, v3}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v9

    invoke-virtual {v9, v10}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v9, v15, v9

    if-eqz v9, :cond_0

    .line 578
    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v9, v1, v15, v8}, Lcom/badlogic/gdx/math/Matrix3;->setToRotation(Lcom/badlogic/gdx/math/Vector3;FF)Lcom/badlogic/gdx/math/Matrix3;

    .line 579
    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector3;->x:F

    neg-float v9, v9

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v9, v10

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->y:F

    neg-float v10, v10

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v10, v14

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    neg-float v14, v14

    move-object/from16 v48, v1

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr v14, v1

    .line 580
    invoke-virtual {v8, v9, v10, v14}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v1

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v1, v8}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v1

    invoke-virtual {v1, v13, v6, v4}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v17

    move/from16 v16, v29

    move/from16 v18, v33

    move/from16 v19, v38

    move/from16 v20, v5

    move/from16 v21, v45

    move/from16 v22, v46

    move/from16 v23, v7

    .line 579
    invoke-static/range {v15 .. v23}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 582
    iget v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int v1, v29, v1

    .line 583
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v10, v14

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->y:F

    sget-object v15, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v15, v15, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v14, v15

    sget-object v15, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v15, v15, Lcom/badlogic/gdx/math/Vector3;->z:F

    move-object/from16 v49, v2

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr v15, v2

    .line 584
    invoke-virtual {v9, v10, v14, v15}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v2, v9}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    invoke-virtual {v2, v13, v6, v4}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v36

    move-object/from16 v34, v8

    move/from16 v35, v1

    move/from16 v37, v30

    move/from16 v39, v5

    move/from16 v40, v45

    move/from16 v41, v46

    move/from16 v42, v7

    .line 583
    invoke-static/range {v34 .. v42}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 586
    iget v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int/2addr v1, v2

    .line 587
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v9, v10

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->y:F

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v10, v14

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    sget-object v15, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v15, v15, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v14, v15

    .line 588
    invoke-virtual {v8, v9, v10, v14}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v8

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v8, v9}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v8

    invoke-virtual {v8, v13, v6, v4}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v36

    move-object/from16 v34, v2

    move/from16 v35, v1

    move/from16 v38, v44

    .line 587
    invoke-static/range {v34 .. v42}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 590
    iget v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int v31, v1, v2

    .line 591
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector3;->x:F

    neg-float v8, v8

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v8, v9

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector3;->y:F

    neg-float v9, v9

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v9, v10

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->z:F

    neg-float v10, v10

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v10, v14

    .line 592
    invoke-virtual {v2, v8, v9, v10}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v2, v8}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    invoke-virtual {v2, v13, v6, v4}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v32

    move-object/from16 v30, v1

    move/from16 v34, v44

    move/from16 v35, v5

    move/from16 v36, v45

    move/from16 v37, v46

    move/from16 v38, v7

    .line 591
    invoke-static/range {v30 .. v38}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    goto/16 :goto_2

    :cond_0
    move-object/from16 v48, v1

    move-object/from16 v49, v2

    .line 595
    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->x:F

    neg-float v2, v2

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v2, v8

    add-float/2addr v2, v13

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector3;->y:F

    neg-float v8, v8

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v8, v9

    add-float/2addr v8, v6

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector3;->z:F

    neg-float v9, v9

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr v9, v10

    add-float/2addr v9, v4

    .line 596
    invoke-virtual {v1, v2, v8, v9}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v17

    move/from16 v16, v29

    move/from16 v18, v33

    move/from16 v19, v38

    move/from16 v20, v5

    move/from16 v21, v45

    move/from16 v22, v46

    move/from16 v23, v7

    .line 595
    invoke-static/range {v15 .. v23}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 597
    iget v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int v1, v29, v1

    .line 598
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v9, v10

    add-float/2addr v9, v13

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->y:F

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v10, v14

    add-float/2addr v10, v6

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    sget-object v15, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v15, v15, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr v14, v15

    add-float/2addr v14, v4

    .line 599
    invoke-virtual {v8, v9, v10, v14}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v36

    move-object/from16 v34, v2

    move/from16 v35, v1

    move/from16 v37, v30

    move/from16 v39, v5

    move/from16 v40, v45

    move/from16 v41, v46

    move/from16 v42, v7

    .line 598
    invoke-static/range {v34 .. v42}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 600
    iget v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int/2addr v1, v2

    .line 601
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v9, v10

    add-float/2addr v9, v13

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->y:F

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v10, v14

    add-float/2addr v10, v6

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    sget-object v15, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v15, v15, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v14, v15

    add-float/2addr v14, v4

    .line 602
    invoke-virtual {v8, v9, v10, v14}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v36

    move-object/from16 v34, v2

    move/from16 v35, v1

    move/from16 v38, v44

    .line 601
    invoke-static/range {v34 .. v42}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 603
    iget v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int v31, v1, v2

    .line 604
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector3;->x:F

    neg-float v8, v8

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v8, v9

    add-float/2addr v8, v13

    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector3;->y:F

    neg-float v9, v9

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v9, v10

    add-float/2addr v9, v6

    sget-object v6, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v6, v6, Lcom/badlogic/gdx/math/Vector3;->z:F

    neg-float v6, v6

    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v6, v10

    add-float/2addr v6, v4

    .line 605
    invoke-virtual {v2, v8, v9, v6}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v32

    move-object/from16 v30, v1

    move/from16 v34, v44

    move/from16 v35, v5

    move/from16 v36, v45

    move/from16 v37, v46

    move/from16 v38, v7

    .line 604
    invoke-static/range {v30 .. v38}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    :goto_2
    add-int/lit8 v6, v28, 0x1

    add-int/lit8 v13, v27, 0x1

    move-object/from16 v4, v24

    move/from16 v7, v25

    move-object/from16 v8, v26

    move-object/from16 v10, v43

    move-object/from16 v9, v47

    move-object/from16 v1, v48

    move-object/from16 v2, v49

    goto/16 :goto_1

    :cond_1
    move/from16 v27, v13

    move/from16 v6, v27

    goto/16 :goto_0

    :cond_2
    return-void
.end method

.method private fillVerticesToViewPointCPU([I)V
    .locals 44

    move-object/from16 v0, p0

    .line 470
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderData:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v3, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;

    .line 471
    iget-object v5, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->scaleChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 472
    iget-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->regionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 473
    iget-object v7, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->positionChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 474
    iget-object v8, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->colorChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 475
    iget-object v9, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->rotationChannel:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;

    .line 477
    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/renderers/BillboardControllerRenderData;->controller:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleController;->particles:Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;

    iget v4, v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray;->size:I

    move v10, v3

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v4, :cond_1

    .line 478
    aget v11, p1, v10

    iget v12, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    mul-int v11, v11, v12

    mul-int/lit8 v11, v11, 0x4

    .line 479
    iget-object v12, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    iget v13, v5, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v13, v13, v3

    aget v12, v12, v13

    .line 480
    iget v13, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v13, v13, v3

    .line 481
    iget v14, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v14, v14, v3

    .line 482
    iget v15, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v15, v15, v3

    .line 483
    iget v2, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->strideSize:I

    mul-int v2, v2, v3

    move-object/from16 v21, v1

    .line 484
    iget-object v1, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v14, 0x0

    aget v1, v1, v16

    move/from16 v22, v4

    iget-object v4, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v14, 0x1

    aget v4, v4, v16

    move-object/from16 v23, v5

    .line 485
    iget-object v5, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v14, v14, 0x2

    aget v5, v5, v14

    .line 486
    iget-object v14, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v13, 0x0

    aget v27, v14, v16

    .line 487
    iget-object v14, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v13, 0x1

    aget v37, v14, v16

    .line 488
    iget-object v14, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v13, 0x2

    aget v24, v14, v16

    .line 489
    iget-object v14, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v13, 0x3

    aget v32, v14, v16

    .line 490
    iget-object v14, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v16, v13, 0x4

    aget v14, v14, v16

    mul-float v14, v14, v12

    move-object/from16 v38, v7

    iget-object v7, v6, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v13, v13, 0x5

    aget v7, v7, v13

    mul-float v7, v7, v12

    .line 493
    iget-object v12, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v13, v15, 0x0

    aget v39, v12, v13

    .line 494
    iget-object v12, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v13, v15, 0x1

    aget v40, v12, v13

    .line 495
    iget-object v12, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v13, v15, 0x2

    aget v41, v12, v13

    .line 496
    iget-object v12, v8, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v15, v15, 0x3

    aget v42, v12, v15

    .line 497
    iget-object v12, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v13, v2, 0x0

    aget v12, v12, v13

    .line 498
    iget-object v13, v9, Lcom/badlogic/gdx/graphics/g3d/particles/ParallelArray$FloatChannel;->data:[F

    add-int/lit8 v2, v2, 0x1

    aget v2, v13, v2

    .line 499
    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V3:Lcom/badlogic/gdx/math/Vector3;

    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v15, v15, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v13, v15}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v13

    invoke-virtual {v13, v1, v4, v5}, Lcom/badlogic/gdx/math/Vector3;->sub(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v13

    invoke-virtual {v13}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v13

    .line 500
    sget-object v15, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    move-object/from16 v43, v6

    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v6, v6, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v15, v6}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v6

    invoke-virtual {v6, v13}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v6

    invoke-virtual {v6}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v6

    .line 501
    sget-object v15, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v15, v13}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v15

    invoke-virtual {v15, v6}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v15

    .line 502
    invoke-virtual {v6, v14}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    .line 503
    invoke-virtual {v15, v7}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v6, v12, v6

    if-eqz v6, :cond_0

    .line 506
    sget-object v6, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v6, v13, v12, v2}, Lcom/badlogic/gdx/math/Matrix3;->setToRotation(Lcom/badlogic/gdx/math/Vector3;FF)Lcom/badlogic/gdx/math/Matrix3;

    .line 507
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v6, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v6, v6, Lcom/badlogic/gdx/math/Vector3;->x:F

    neg-float v6, v6

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v6, v7

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector3;->y:F

    neg-float v7, v7

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v7, v13

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->z:F

    neg-float v13, v13

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr v13, v14

    .line 508
    invoke-virtual {v2, v6, v7, v13}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    sget-object v6, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v2, v6}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    invoke-virtual {v2, v1, v4, v5}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v14

    move v13, v11

    move/from16 v15, v27

    move/from16 v16, v32

    move/from16 v17, v39

    move/from16 v18, v40

    move/from16 v19, v41

    move/from16 v20, v42

    .line 507
    invoke-static/range {v12 .. v20}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 510
    iget v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int/2addr v2, v11

    .line 511
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v11, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v11, v12

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector3;->y:F

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v12, v13

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->z:F

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr v13, v14

    .line 512
    invoke-virtual {v7, v11, v12, v13}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v7

    sget-object v11, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v7, v11}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v7

    invoke-virtual {v7, v1, v4, v5}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v30

    move-object/from16 v28, v6

    move/from16 v29, v2

    move/from16 v31, v24

    move/from16 v33, v39

    move/from16 v34, v40

    move/from16 v35, v41

    move/from16 v36, v42

    .line 511
    invoke-static/range {v28 .. v36}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 514
    iget v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int/2addr v2, v6

    .line 515
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v11, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v11, v12

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector3;->y:F

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v12, v13

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->z:F

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v13, v14

    .line 516
    invoke-virtual {v7, v11, v12, v13}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v7

    sget-object v11, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v7, v11}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v7

    invoke-virtual {v7, v1, v4, v5}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v30

    move-object/from16 v28, v6

    move/from16 v29, v2

    move/from16 v32, v37

    .line 515
    invoke-static/range {v28 .. v36}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 518
    iget v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int v25, v2, v6

    .line 519
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v6, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector3;->x:F

    neg-float v7, v7

    sget-object v11, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v7, v11

    sget-object v11, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector3;->y:F

    neg-float v11, v11

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v11, v12

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector3;->z:F

    neg-float v12, v12

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v12, v13

    .line 520
    invoke-virtual {v6, v7, v11, v12}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v6

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_M3:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v6, v7}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v6

    invoke-virtual {v6, v1, v4, v5}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v26

    move-object/from16 v24, v2

    move/from16 v28, v37

    move/from16 v29, v39

    move/from16 v30, v40

    move/from16 v31, v41

    move/from16 v32, v42

    .line 519
    invoke-static/range {v24 .. v32}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    goto/16 :goto_2

    .line 523
    :cond_0
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v6, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v6, v6, Lcom/badlogic/gdx/math/Vector3;->x:F

    neg-float v6, v6

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v6, v7

    add-float/2addr v6, v1

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector3;->y:F

    neg-float v7, v7

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v7, v13

    add-float/2addr v7, v4

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->z:F

    neg-float v13, v13

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr v13, v14

    add-float/2addr v13, v5

    .line 524
    invoke-virtual {v2, v6, v7, v13}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v14

    move v13, v11

    move/from16 v15, v27

    move/from16 v16, v32

    move/from16 v17, v39

    move/from16 v18, v40

    move/from16 v19, v41

    move/from16 v20, v42

    .line 523
    invoke-static/range {v12 .. v20}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 525
    iget v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int/2addr v2, v11

    .line 526
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v11, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v11, v12

    add-float/2addr v11, v1

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector3;->y:F

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v12, v13

    add-float/2addr v12, v4

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->z:F

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr v13, v14

    add-float/2addr v13, v5

    .line 527
    invoke-virtual {v7, v11, v12, v13}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v30

    move-object/from16 v28, v6

    move/from16 v29, v2

    move/from16 v31, v24

    move/from16 v33, v39

    move/from16 v34, v40

    move/from16 v35, v41

    move/from16 v36, v42

    .line 526
    invoke-static/range {v28 .. v36}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 528
    iget v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int/2addr v2, v6

    .line 529
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v11, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v11, v12

    add-float/2addr v11, v1

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector3;->y:F

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v12, v13

    add-float/2addr v12, v4

    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector3;->z:F

    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v13, v14

    add-float/2addr v13, v5

    .line 530
    invoke-virtual {v7, v11, v12, v13}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v30

    move-object/from16 v28, v6

    move/from16 v29, v2

    move/from16 v32, v37

    .line 529
    invoke-static/range {v28 .. v36}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    .line 531
    iget v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    add-int v25, v2, v6

    .line 532
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    sget-object v6, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V6:Lcom/badlogic/gdx/math/Vector3;

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector3;->x:F

    neg-float v7, v7

    sget-object v11, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v7, v11

    add-float/2addr v7, v1

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    neg-float v1, v1

    sget-object v11, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v1, v11

    add-float/2addr v1, v4

    sget-object v4, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V1:Lcom/badlogic/gdx/math/Vector3;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector3;->z:F

    neg-float v4, v4

    sget-object v11, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->TMP_V2:Lcom/badlogic/gdx/math/Vector3;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v4, v11

    add-float/2addr v4, v5

    .line 533
    invoke-virtual {v6, v7, v1, v4}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v26

    move-object/from16 v24, v2

    move/from16 v28, v37

    move/from16 v29, v39

    move/from16 v30, v40

    move/from16 v31, v41

    move/from16 v32, v42

    .line 532
    invoke-static/range {v24 .. v32}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V

    :goto_2
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v10, v10, 0x1

    move-object/from16 v1, v21

    move/from16 v4, v22

    move-object/from16 v5, v23

    move-object/from16 v7, v38

    move-object/from16 v6, v43

    goto/16 :goto_1

    :cond_1
    move v3, v10

    goto/16 :goto_0

    :cond_2
    return-void
.end method

.method private initRenderData()V
    .locals 0

    .line 243
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->setVertexData()V

    .line 244
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->clearRenderablesPool()V

    .line 245
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->allocShader()V

    .line 246
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->resetCapacity()V

    return-void
.end method

.method private static putVertex([FIFFFFFFFFFFFFF)V
    .locals 2

    .line 304
    sget v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_POSITION_OFFSET:I

    add-int v1, p1, v0

    aput p2, p0, v1

    add-int v1, p1, v0

    add-int/lit8 v1, v1, 0x1

    .line 305
    aput p3, p0, v1

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x2

    .line 306
    aput p4, p0, v0

    .line 308
    sget v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_UV_OFFSET:I

    add-int v1, p1, v0

    aput p5, p0, v1

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x1

    .line 309
    aput p6, p0, v0

    .line 311
    sget v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_SIZE_ROTATION_OFFSET:I

    add-int v1, p1, v0

    aput p7, p0, v1

    add-int v1, p1, v0

    add-int/lit8 v1, v1, 0x1

    .line 312
    aput p8, p0, v1

    add-int v1, p1, v0

    add-int/lit8 v1, v1, 0x2

    .line 313
    aput p9, p0, v1

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x3

    .line 314
    aput p10, p0, v0

    .line 316
    sget v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_COLOR_OFFSET:I

    add-int v1, p1, v0

    aput p11, p0, v1

    add-int v1, p1, v0

    add-int/lit8 v1, v1, 0x1

    .line 317
    aput p12, p0, v1

    add-int v1, p1, v0

    add-int/lit8 v1, v1, 0x2

    .line 318
    aput p13, p0, v1

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x3

    .line 319
    aput p14, p0, v0

    return-void
.end method

.method private static putVertex([FILcom/badlogic/gdx/math/Vector3;FFFFFF)V
    .locals 2

    .line 339
    sget v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_POSITION_OFFSET:I

    add-int/2addr v0, p1

    iget v1, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    aput v1, p0, v0

    .line 340
    sget v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_POSITION_OFFSET:I

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x1

    iget v1, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    aput v1, p0, v0

    .line 341
    sget v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_POSITION_OFFSET:I

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x2

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    aput p2, p0, v0

    .line 343
    sget p2, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_UV_OFFSET:I

    add-int v0, p1, p2

    aput p3, p0, v0

    add-int/2addr p2, p1

    add-int/lit8 p2, p2, 0x1

    .line 344
    aput p4, p0, p2

    .line 346
    sget p2, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_COLOR_OFFSET:I

    add-int p3, p1, p2

    aput p5, p0, p3

    add-int p3, p1, p2

    add-int/lit8 p3, p3, 0x1

    .line 347
    aput p6, p0, p3

    add-int p3, p1, p2

    add-int/lit8 p3, p3, 0x2

    .line 348
    aput p7, p0, p3

    add-int/2addr p1, p2

    add-int/lit8 p1, p1, 0x3

    .line 349
    aput p8, p0, p1

    return-void
.end method


# virtual methods
.method public allocParticlesData(I)V
    .locals 1

    .line 168
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    mul-int/lit8 v0, v0, 0x4

    mul-int v0, v0, p1

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    .line 169
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->allocRenderables(I)V

    return-void
.end method

.method protected allocRenderable()Lcom/badlogic/gdx/graphics/g3d/Renderable;
    .locals 7

    .line 173
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/Renderable;-><init>()V

    .line 174
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    const/4 v2, 0x4

    iput v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    .line 175
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    const/4 v2, 0x0

    iput v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    .line 176
    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/Material;

    const/4 v3, 0x3

    new-array v3, v3, [Lcom/badlogic/gdx/graphics/g3d/Attribute;

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->blendingAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

    aput-object v4, v3, v2

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->depthTestAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-static {v4}, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->createDiffuse(Lcom/badlogic/gdx/graphics/Texture;)Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    invoke-direct {v1, v3}, Lcom/badlogic/gdx/graphics/g3d/Material;-><init>([Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    .line 177
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    new-instance v3, Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentAttributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    const/16 v5, 0x7ffc

    const v6, 0xbffa

    invoke-direct {v3, v2, v5, v6, v4}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(ZIILcom/badlogic/gdx/graphics/VertexAttributes;)V

    iput-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 178
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->indices:[S

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/Mesh;->setIndices([S)Lcom/badlogic/gdx/graphics/Mesh;

    .line 179
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    return-object v0
.end method

.method public begin()V
    .locals 2

    .line 294
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BufferedParticleBatch;->begin()V

    .line 295
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->freeAll(Lcom/badlogic/gdx/utils/Array;)V

    .line 296
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method protected flush([I)V
    .locals 7

    .line 615
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->useGPU:Z

    if-eqz v0, :cond_0

    .line 617
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->fillVerticesGPU([I)V

    goto :goto_0

    .line 621
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->mode:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;->Screen:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    if-ne v0, v1, :cond_1

    .line 622
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->fillVerticesToScreenCPU([I)V

    goto :goto_0

    .line 623
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->mode:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;->ViewPoint:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    if-ne v0, v1, :cond_2

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->fillVerticesToViewPointCPU([I)V

    .line 630
    :cond_2
    :goto_0
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->bufferedParticlesCount:I

    mul-int/lit8 p1, p1, 0x4

    const/4 v0, 0x0

    :goto_1
    if-ge v0, p1, :cond_3

    sub-int v1, p1, v0

    const/16 v2, 0x7ffc

    .line 632
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 633
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->obtain()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 634
    iget-object v3, v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    div-int/lit8 v4, v1, 0x4

    mul-int/lit8 v4, v4, 0x6

    iput v4, v3, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    .line 635
    iget-object v3, v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->vertices:[F

    iget v5, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    mul-int v6, v5, v0

    mul-int v5, v5, v1

    invoke-virtual {v3, v4, v6, v5}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;

    .line 636
    iget-object v3, v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->update()V

    .line 637
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/2addr v0, v1

    goto :goto_1

    :cond_3
    return-void
.end method

.method public getAlignMode()Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;
    .locals 1

    .line 261
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->mode:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    return-object v0
.end method

.method public getRenderables(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Pool;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;",
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;)V"
        }
    .end annotation

    .line 643
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 644
    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/graphics/g3d/Renderable;->set(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Renderable;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected getShader(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Shader;
    .locals 3

    .line 206
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->useGPU:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;

    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->mode:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;)V

    invoke-direct {v0, p1, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V

    .line 207
    :goto_0
    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/g3d/Shader;->init()V

    return-object v0
.end method

.method public getTexture()Lcom/badlogic/gdx/graphics/Texture;
    .locals 1

    .line 289
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    return-object v0
.end method

.method public isUseGPU()Z
    .locals 1

    .line 274
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->useGPU:Z

    return v0
.end method

.method public load(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V
    .locals 1

    const-string v0, "billboardBatch"

    .line 656
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->getSaveData(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 658
    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->loadAsset()Lcom/badlogic/gdx/assets/AssetDescriptor;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/assets/AssetManager;->get(Lcom/badlogic/gdx/assets/AssetDescriptor;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->setTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    const-string p1, "cfg"

    .line 659
    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->load(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$Config;

    .line 660
    iget-boolean p2, p1, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$Config;->useGPU:Z

    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->setUseGpu(Z)V

    .line 661
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$Config;->mode:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->setAlignMode(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;)V

    :cond_0
    return-void
.end method

.method public save(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V
    .locals 3

    const-string v0, "billboardBatch"

    .line 649
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->createSaveData(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    move-result-object p2

    .line 650
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$Config;

    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->useGPU:Z

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->mode:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$Config;-><init>(ZLcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;)V

    const-string v1, "cfg"

    invoke-virtual {p2, v1, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->save(Ljava/lang/String;Ljava/lang/Object;)V

    .line 651
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/assets/AssetManager;->getAssetFileName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-class v0, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {p2, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->saveAsset(Ljava/lang/String;Ljava/lang/Class;)V

    return-void
.end method

.method public setAlignMode(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;)V
    .locals 1

    .line 251
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->mode:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    if-eq p1, v0, :cond_0

    .line 252
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->mode:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    .line 253
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->useGPU:Z

    if-eqz p1, :cond_0

    .line 254
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->initRenderData()V

    .line 255
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->bufferedParticlesCount:I

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->allocRenderables(I)V

    :cond_0
    return-void
.end method

.method public setTexture(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 5

    .line 278
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->freeAll(Lcom/badlogic/gdx/utils/Array;)V

    .line 279
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 280
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->getFree()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 281
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->renderablePool:Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch$RenderablePool;->obtain()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 282
    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    sget-wide v3, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Diffuse:J

    invoke-virtual {v2, v3, v4}, Lcom/badlogic/gdx/graphics/g3d/Material;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;

    .line 283
    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->textureDescription:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    iput-object p1, v2, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->texture:Lcom/badlogic/gdx/graphics/GLTexture;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 285
    :cond_0
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->texture:Lcom/badlogic/gdx/graphics/Texture;

    return-void
.end method

.method public setUseGpu(Z)V
    .locals 1

    .line 266
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->useGPU:Z

    if-eq v0, p1, :cond_0

    .line 267
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->useGPU:Z

    .line 268
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->initRenderData()V

    .line 269
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->bufferedParticlesCount:I

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->allocRenderables(I)V

    :cond_0
    return-void
.end method

.method public setVertexData()V
    .locals 1

    .line 228
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->useGPU:Z

    if-eqz v0, :cond_0

    .line 229
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentAttributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    .line 230
    sget v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->GPU_VERTEX_SIZE:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    goto :goto_0

    .line 236
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_ATTRIBUTES:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentAttributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    .line 237
    sget v0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->CPU_VERTEX_SIZE:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/batches/BillboardParticleBatch;->currentVertexSize:I

    :goto_0
    return-void
.end method
