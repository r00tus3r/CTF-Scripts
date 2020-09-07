.class public final Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;
.super Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;
.source "UnweightedMeshSpawnShapeValue.java"


# instance fields
.field private indices:[S

.field private positionOffset:I

.field private triangleCount:I

.field private vertexCount:I

.field private vertexSize:I

.field private vertices:[F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;)V

    .line 34
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V

    return-void
.end method


# virtual methods
.method public copy()Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;
    .locals 1

    .line 77
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;)V

    return-object v0
.end method

.method public setMesh(Lcom/badlogic/gdx/graphics/Mesh;Lcom/badlogic/gdx/graphics/g3d/Model;)V
    .locals 1

    .line 42
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->setMesh(Lcom/badlogic/gdx/graphics/Mesh;Lcom/badlogic/gdx/graphics/g3d/Model;)V

    .line 43
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexSize()I

    move-result p2

    div-int/lit8 p2, p2, 0x4

    iput p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->vertexSize:I

    const/4 p2, 0x1

    .line 44
    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object p2

    iget p2, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/lit8 p2, p2, 0x4

    iput p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->positionOffset:I

    .line 45
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result p2

    if-lez p2, :cond_0

    .line 47
    new-array p2, p2, [S

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->indices:[S

    .line 48
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->indices:[S

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/Mesh;->getIndices([S)V

    .line 49
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->indices:[S

    array-length p2, p2

    div-int/lit8 p2, p2, 0x3

    iput p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->triangleCount:I

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 51
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->indices:[S

    .line 52
    :goto_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    move-result p2

    iput p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->vertexCount:I

    .line 53
    iget p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->vertexCount:I

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->vertexSize:I

    mul-int p2, p2, v0

    new-array p2, p2, [F

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->vertices:[F

    .line 54
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->vertices:[F

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/Mesh;->getVertices([F)[F

    return-void
.end method

.method public spawnAux(Lcom/badlogic/gdx/math/Vector3;F)V
    .locals 17

    move-object/from16 v0, p0

    .line 59
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->indices:[S

    if-nez v1, :cond_0

    .line 61
    iget v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->vertexCount:I

    add-int/lit8 v1, v1, -0x3

    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v1

    iget v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->vertexSize:I

    mul-int v1, v1, v2

    .line 62
    iget v3, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->positionOffset:I

    add-int/2addr v1, v3

    add-int v3, v1, v2

    add-int/2addr v2, v3

    .line 63
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->vertices:[F

    aget v5, v4, v1

    add-int/lit8 v6, v1, 0x1

    aget v6, v4, v6

    add-int/lit8 v1, v1, 0x2

    aget v7, v4, v1

    aget v8, v4, v3

    add-int/lit8 v1, v3, 0x1

    aget v9, v4, v1

    add-int/lit8 v3, v3, 0x2

    aget v10, v4, v3

    aget v11, v4, v2

    add-int/lit8 v1, v2, 0x1

    aget v12, v4, v1

    add-int/lit8 v2, v2, 0x2

    aget v13, v4, v2

    move-object/from16 v14, p1

    .line 64
    invoke-static/range {v5 .. v14}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->pick(FFFFFFFFFLcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    goto :goto_0

    .line 67
    :cond_0
    iget v1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->triangleCount:I

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v1

    mul-int/lit8 v1, v1, 0x3

    .line 68
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->indices:[S

    aget-short v3, v2, v1

    iget v4, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->vertexSize:I

    mul-int v3, v3, v4

    iget v5, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->positionOffset:I

    add-int/2addr v3, v5

    add-int/lit8 v6, v1, 0x1

    aget-short v6, v2, v6

    mul-int v6, v6, v4

    add-int/2addr v6, v5

    add-int/lit8 v1, v1, 0x2

    .line 69
    aget-short v1, v2, v1

    mul-int v1, v1, v4

    add-int/2addr v1, v5

    .line 70
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/UnweightedMeshSpawnShapeValue;->vertices:[F

    aget v7, v2, v3

    add-int/lit8 v4, v3, 0x1

    aget v8, v2, v4

    add-int/lit8 v3, v3, 0x2

    aget v9, v2, v3

    aget v10, v2, v6

    add-int/lit8 v3, v6, 0x1

    aget v11, v2, v3

    add-int/lit8 v6, v6, 0x2

    aget v12, v2, v6

    aget v13, v2, v1

    add-int/lit8 v3, v1, 0x1

    aget v14, v2, v3

    add-int/lit8 v1, v1, 0x2

    aget v15, v2, v1

    move-object/from16 v16, p1

    .line 71
    invoke-static/range {v7 .. v16}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->pick(FFFFFFFFFLcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    :goto_0
    return-void
.end method
