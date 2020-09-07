.class public abstract Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;
.super Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;
.source "MeshSpawnShapeValue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;
    }
.end annotation


# instance fields
.field protected mesh:Lcom/badlogic/gdx/graphics/Mesh;

.field protected model:Lcom/badlogic/gdx/graphics/g3d/Model;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;)V
    .locals 0

    .line 67
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;-><init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;)V

    return-void
.end method


# virtual methods
.method public load(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V
    .locals 2

    .line 102
    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->getSaveData()Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    move-result-object p2

    .line 103
    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->loadAsset()Lcom/badlogic/gdx/assets/AssetDescriptor;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 105
    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/assets/AssetManager;->get(Lcom/badlogic/gdx/assets/AssetDescriptor;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Model;

    .line 106
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/Model;->meshes:Lcom/badlogic/gdx/utils/Array;

    const-string v1, "index"

    invoke-virtual {p2, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->load(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {p0, p2, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->setMesh(Lcom/badlogic/gdx/graphics/Mesh;Lcom/badlogic/gdx/graphics/g3d/Model;)V

    :cond_0
    return-void
.end method

.method public load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V
    .locals 1

    .line 75
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V

    .line 76
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;

    .line 77
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->setMesh(Lcom/badlogic/gdx/graphics/Mesh;Lcom/badlogic/gdx/graphics/g3d/Model;)V

    return-void
.end method

.method public save(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V
    .locals 2

    .line 93
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    if-eqz v0, :cond_0

    .line 94
    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;->createSaveData()Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;

    move-result-object p2

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/assets/AssetManager;->getAssetFileName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-class v0, Lcom/badlogic/gdx/graphics/g3d/Model;

    invoke-virtual {p2, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->saveAsset(Ljava/lang/String;Ljava/lang/Class;)V

    .line 96
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/Model;->meshes:Lcom/badlogic/gdx/utils/Array;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/utils/Array;->indexOf(Ljava/lang/Object;Z)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v0, "index"

    invoke-virtual {p2, v0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$SaveData;->save(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public setMesh(Lcom/badlogic/gdx/graphics/Mesh;)V
    .locals 1

    const/4 v0, 0x0

    .line 88
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->setMesh(Lcom/badlogic/gdx/graphics/Mesh;Lcom/badlogic/gdx/graphics/g3d/Model;)V

    return-void
.end method

.method public setMesh(Lcom/badlogic/gdx/graphics/Mesh;Lcom/badlogic/gdx/graphics/g3d/Model;)V
    .locals 1

    const/4 v0, 0x1

    .line 81
    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 83
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    .line 84
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    return-void

    .line 82
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Mesh vertices must have Usage.Position"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
