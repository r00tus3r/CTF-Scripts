.class public Lcom/uwsoft/editor/renderer/data/MeshVO;
.super Ljava/lang/Object;
.source "MeshVO.java"


# instance fields
.field public initialProperties:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

.field public minPolygonData:[[Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clone()Lcom/uwsoft/editor/renderer/data/MeshVO;
    .locals 7

    .line 12
    new-instance v0, Lcom/uwsoft/editor/renderer/data/MeshVO;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/data/MeshVO;-><init>()V

    .line 13
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/MeshVO;->minPolygonData:[[Lcom/badlogic/gdx/math/Vector2;

    array-length v1, v1

    new-array v1, v1, [[Lcom/badlogic/gdx/math/Vector2;

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 15
    :goto_0
    iget-object v4, p0, Lcom/uwsoft/editor/renderer/data/MeshVO;->minPolygonData:[[Lcom/badlogic/gdx/math/Vector2;

    array-length v5, v4

    if-ge v3, v5, :cond_1

    .line 16
    aget-object v4, v4, v3

    array-length v4, v4

    new-array v4, v4, [Lcom/badlogic/gdx/math/Vector2;

    aput-object v4, v1, v3

    const/4 v4, 0x0

    .line 17
    :goto_1
    iget-object v5, p0, Lcom/uwsoft/editor/renderer/data/MeshVO;->minPolygonData:[[Lcom/badlogic/gdx/math/Vector2;

    aget-object v6, v5, v3

    array-length v6, v6

    if-ge v4, v6, :cond_0

    .line 18
    aget-object v6, v1, v3

    aget-object v5, v5, v3

    aget-object v5, v5, v4

    invoke-virtual {v5}, Lcom/badlogic/gdx/math/Vector2;->cpy()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v5

    aput-object v5, v6, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 21
    :cond_1
    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/MeshVO;->minPolygonData:[[Lcom/badlogic/gdx/math/Vector2;

    .line 23
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/MeshVO;->initialProperties:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    if-eqz v1, :cond_2

    .line 24
    new-instance v2, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    invoke-direct {v2, v1}, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;-><init>(Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;)V

    iput-object v2, v0, Lcom/uwsoft/editor/renderer/data/MeshVO;->initialProperties:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    :cond_2
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 6
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/data/MeshVO;->clone()Lcom/uwsoft/editor/renderer/data/MeshVO;

    move-result-object v0

    return-object v0
.end method
