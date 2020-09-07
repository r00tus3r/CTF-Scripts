.class Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/RenderableShapeBuilder$RenderablePool;
.super Lcom/badlogic/gdx/utils/FlushablePool;
.source "RenderableShapeBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/RenderableShapeBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RenderablePool"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/utils/FlushablePool<",
        "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/FlushablePool;-><init>()V

    return-void
.end method


# virtual methods
.method protected newObject()Lcom/badlogic/gdx/graphics/g3d/Renderable;
    .locals 1

    .line 39
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/Renderable;-><init>()V

    return-object v0
.end method

.method protected bridge synthetic newObject()Ljava/lang/Object;
    .locals 1

    .line 32
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/RenderableShapeBuilder$RenderablePool;->newObject()Lcom/badlogic/gdx/graphics/g3d/Renderable;

    move-result-object v0

    return-object v0
.end method

.method public obtain()Lcom/badlogic/gdx/graphics/g3d/Renderable;
    .locals 8

    .line 44
    invoke-super {p0}, Lcom/badlogic/gdx/utils/FlushablePool;->obtain()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    const/4 v1, 0x0

    .line 45
    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    .line 46
    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    .line 47
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    const-string v3, ""

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->set(Ljava/lang/String;Lcom/badlogic/gdx/graphics/Mesh;III)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    .line 48
    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    .line 49
    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->userData:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic obtain()Ljava/lang/Object;
    .locals 1

    .line 32
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/RenderableShapeBuilder$RenderablePool;->obtain()Lcom/badlogic/gdx/graphics/g3d/Renderable;

    move-result-object v0

    return-object v0
.end method
