.class public final Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;
.super Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;
.source "WeightMeshSpawnShapeValue.java"


# instance fields
.field private distribution:Lcom/badlogic/gdx/math/CumulativeDistribution;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/math/CumulativeDistribution<",
            "Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;-><init>()V

    .line 39
    new-instance v0, Lcom/badlogic/gdx/math/CumulativeDistribution;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/CumulativeDistribution;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->distribution:Lcom/badlogic/gdx/math/CumulativeDistribution;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;)V
    .locals 1

    .line 32
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;)V

    .line 33
    new-instance v0, Lcom/badlogic/gdx/math/CumulativeDistribution;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/CumulativeDistribution;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->distribution:Lcom/badlogic/gdx/math/CumulativeDistribution;

    .line 34
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V

    return-void
.end method


# virtual methods
.method public calculateWeights()V
    .locals 21

    move-object/from16 v0, p0

    .line 50
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->distribution:Lcom/badlogic/gdx/math/CumulativeDistribution;

    invoke-virtual {v1}, Lcom/badlogic/gdx/math/CumulativeDistribution;->clear()V

    .line 51
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v1

    .line 52
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v2

    .line 53
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    move-result v3

    .line 54
    iget v4, v1, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/lit8 v4, v4, 0x4

    int-to-short v4, v4

    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/graphics/VertexAttributes;->findByUsage(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v1

    iget v1, v1, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/lit8 v1, v1, 0x4

    int-to-short v1, v1

    mul-int v5, v3, v4

    .line 55
    new-array v5, v5, [F

    .line 56
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v6, v5}, Lcom/badlogic/gdx/graphics/Mesh;->getVertices([F)[F

    const/high16 v6, 0x40000000    # 2.0f

    const/4 v7, 0x0

    if-lez v2, :cond_0

    .line 58
    new-array v3, v2, [S

    .line 59
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v8, v3}, Lcom/badlogic/gdx/graphics/Mesh;->getIndices([S)V

    :goto_0
    if-ge v7, v2, :cond_1

    .line 63
    aget-short v8, v3, v7

    mul-int v8, v8, v4

    add-int/2addr v8, v1

    add-int/lit8 v9, v7, 0x1

    aget-short v9, v3, v9

    mul-int v9, v9, v4

    add-int/2addr v9, v1

    add-int/lit8 v10, v7, 0x2

    aget-short v10, v3, v10

    mul-int v10, v10, v4

    add-int/2addr v10, v1

    .line 65
    aget v12, v5, v8

    add-int/lit8 v11, v8, 0x1

    aget v13, v5, v11

    add-int/lit8 v8, v8, 0x2

    aget v14, v5, v8

    aget v15, v5, v9

    add-int/lit8 v8, v9, 0x1

    aget v16, v5, v8

    add-int/lit8 v9, v9, 0x2

    aget v17, v5, v9

    aget v18, v5, v10

    add-int/lit8 v8, v10, 0x1

    aget v19, v5, v8

    add-int/lit8 v10, v10, 0x2

    aget v20, v5, v10

    sub-float v8, v16, v19

    mul-float v8, v8, v12

    sub-float v9, v19, v13

    mul-float v9, v9, v15

    add-float/2addr v8, v9

    sub-float v9, v13, v16

    mul-float v9, v9, v18

    add-float/2addr v8, v9

    div-float/2addr v8, v6

    .line 66
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    .line 67
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->distribution:Lcom/badlogic/gdx/math/CumulativeDistribution;

    new-instance v10, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;

    move-object v11, v10

    invoke-direct/range {v11 .. v20}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;-><init>(FFFFFFFFF)V

    invoke-virtual {v9, v10, v8}, Lcom/badlogic/gdx/math/CumulativeDistribution;->add(Ljava/lang/Object;F)V

    add-int/lit8 v7, v7, 0x3

    goto :goto_0

    :cond_0
    :goto_1
    if-ge v7, v3, :cond_1

    add-int v2, v7, v1

    add-int v8, v2, v4

    add-int v9, v8, v4

    .line 73
    aget v11, v5, v2

    add-int/lit8 v10, v2, 0x1

    aget v12, v5, v10

    add-int/lit8 v2, v2, 0x2

    aget v13, v5, v2

    aget v14, v5, v8

    add-int/lit8 v2, v8, 0x1

    aget v15, v5, v2

    add-int/lit8 v8, v8, 0x2

    aget v16, v5, v8

    aget v17, v5, v9

    add-int/lit8 v2, v9, 0x1

    aget v18, v5, v2

    add-int/lit8 v9, v9, 0x2

    aget v19, v5, v9

    sub-float v2, v15, v18

    mul-float v2, v2, v11

    sub-float v8, v18, v12

    mul-float v8, v8, v14

    add-float/2addr v2, v8

    sub-float v8, v12, v15

    mul-float v8, v8, v17

    add-float/2addr v2, v8

    div-float/2addr v2, v6

    .line 74
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 75
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->distribution:Lcom/badlogic/gdx/math/CumulativeDistribution;

    new-instance v9, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;

    move-object v10, v9

    invoke-direct/range {v10 .. v19}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;-><init>(FFFFFFFFF)V

    invoke-virtual {v8, v9, v2}, Lcom/badlogic/gdx/math/CumulativeDistribution;->add(Ljava/lang/Object;F)V

    add-int/2addr v7, v4

    goto :goto_1

    .line 80
    :cond_1
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->distribution:Lcom/badlogic/gdx/math/CumulativeDistribution;

    invoke-virtual {v1}, Lcom/badlogic/gdx/math/CumulativeDistribution;->generateNormalized()V

    return-void
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;
    .locals 1

    .line 93
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;)V

    return-object v0
.end method

.method public init()V
    .locals 0

    .line 44
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->calculateWeights()V

    return-void
.end method

.method public spawnAux(Lcom/badlogic/gdx/math/Vector3;F)V
    .locals 7

    .line 85
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/WeightMeshSpawnShapeValue;->distribution:Lcom/badlogic/gdx/math/CumulativeDistribution;

    invoke-virtual {p2}, Lcom/badlogic/gdx/math/CumulativeDistribution;->value()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;

    .line 86
    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v0

    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v1

    .line 87
    iget v2, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->x1:F

    iget v3, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->x2:F

    iget v4, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->x1:F

    sub-float/2addr v3, v4

    mul-float v3, v3, v0

    add-float/2addr v2, v3

    iget v3, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->x3:F

    iget v4, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->x1:F

    sub-float/2addr v3, v4

    mul-float v3, v3, v1

    add-float/2addr v2, v3

    iget v3, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->y1:F

    iget v4, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->y2:F

    iget v5, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->y1:F

    sub-float/2addr v4, v5

    mul-float v4, v4, v0

    add-float/2addr v3, v4

    iget v4, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->y3:F

    iget v5, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->y1:F

    sub-float/2addr v4, v5

    mul-float v4, v4, v1

    add-float/2addr v3, v4

    iget v4, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->z1:F

    iget v5, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->z2:F

    iget v6, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->z1:F

    sub-float/2addr v5, v6

    mul-float v0, v0, v5

    add-float/2addr v4, v0

    iget v0, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->z3:F

    iget p2, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->z1:F

    sub-float/2addr v0, p2

    mul-float v1, v1, v0

    add-float/2addr v4, v1

    invoke-virtual {p1, v2, v3, v4}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method
