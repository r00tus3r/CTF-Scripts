.class public Lcom/badlogic/gdx/graphics/Mesh;
.super Ljava/lang/Object;
.source "Mesh.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;
    }
.end annotation


# static fields
.field static final meshes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/badlogic/gdx/Application;",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/Mesh;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field autoBind:Z

.field final indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

.field instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

.field isInstanced:Z

.field final isVertexArray:Z

.field private final tmpV:Lcom/badlogic/gdx/math/Vector3;

.field final vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 75
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/Mesh;->meshes:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;ZIILcom/badlogic/gdx/graphics/VertexAttributes;)V
    .locals 3

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 79
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->autoBind:Z

    const/4 v1, 0x0

    .line 83
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    .line 754
    new-instance v2, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v2, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    .line 169
    sget-object v2, Lcom/badlogic/gdx/graphics/Mesh$1;->$SwitchMap$com$badlogic$gdx$graphics$Mesh$VertexDataType:[I

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;->ordinal()I

    move-result p1

    aget p1, v2, p1

    if-eq p1, v0, :cond_2

    const/4 v2, 0x2

    if-eq p1, v2, :cond_1

    const/4 v2, 0x3

    if-eq p1, v2, :cond_0

    .line 187
    new-instance p1, Lcom/badlogic/gdx/graphics/glutils/VertexArray;

    invoke-direct {p1, p3, p5}, Lcom/badlogic/gdx/graphics/glutils/VertexArray;-><init>(ILcom/badlogic/gdx/graphics/VertexAttributes;)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    .line 188
    new-instance p1, Lcom/badlogic/gdx/graphics/glutils/IndexArray;

    invoke-direct {p1, p4}, Lcom/badlogic/gdx/graphics/glutils/IndexArray;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    .line 189
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isVertexArray:Z

    goto :goto_0

    .line 181
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;

    invoke-direct {p1, p2, p3, p5}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;-><init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    .line 182
    new-instance p1, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;

    invoke-direct {p1, p2, p4}, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;-><init>(ZI)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    .line 183
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->isVertexArray:Z

    goto :goto_0

    .line 176
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectSubData;

    invoke-direct {p1, p2, p3, p5}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectSubData;-><init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    .line 177
    new-instance p1, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;

    invoke-direct {p1, p2, p4}, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObjectSubData;-><init>(ZI)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    .line 178
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->isVertexArray:Z

    goto :goto_0

    .line 171
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;

    invoke-direct {p1, p2, p3, p5}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;-><init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    .line 172
    new-instance p1, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;

    invoke-direct {p1, p2, p4}, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;-><init>(ZI)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    .line 173
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->isVertexArray:Z

    .line 193
    :goto_0
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-static {p1, p0}, Lcom/badlogic/gdx/graphics/Mesh;->addManagedMesh(Lcom/badlogic/gdx/Application;Lcom/badlogic/gdx/graphics/Mesh;)V

    return-void
.end method

.method public varargs constructor <init>(Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V
    .locals 6

    .line 158
    new-instance v5, Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-direct {v5, p5}, Lcom/badlogic/gdx/graphics/VertexAttributes;-><init>([Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;ZIILcom/badlogic/gdx/graphics/VertexAttributes;)V

    return-void
.end method

.method protected constructor <init>(Lcom/badlogic/gdx/graphics/glutils/VertexData;Lcom/badlogic/gdx/graphics/glutils/IndexData;Z)V
    .locals 1

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 79
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->autoBind:Z

    const/4 v0, 0x0

    .line 83
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    .line 754
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    .line 86
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    .line 87
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    .line 88
    iput-boolean p3, p0, Lcom/badlogic/gdx/graphics/Mesh;->isVertexArray:Z

    .line 90
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-static {p1, p0}, Lcom/badlogic/gdx/graphics/Mesh;->addManagedMesh(Lcom/badlogic/gdx/Application;Lcom/badlogic/gdx/graphics/Mesh;)V

    return-void
.end method

.method public constructor <init>(ZIILcom/badlogic/gdx/graphics/VertexAttributes;)V
    .locals 2

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 79
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->autoBind:Z

    const/4 v0, 0x0

    .line 83
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    .line 754
    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    .line 116
    invoke-direct {p0, p1, p2, p4}, Lcom/badlogic/gdx/graphics/Mesh;->makeVertexBuffer(ZILcom/badlogic/gdx/graphics/VertexAttributes;)Lcom/badlogic/gdx/graphics/glutils/VertexData;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    .line 117
    new-instance p2, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;

    invoke-direct {p2, p1, p3}, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;-><init>(ZI)V

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    .line 118
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isVertexArray:Z

    .line 120
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-static {p1, p0}, Lcom/badlogic/gdx/graphics/Mesh;->addManagedMesh(Lcom/badlogic/gdx/Application;Lcom/badlogic/gdx/graphics/Mesh;)V

    return-void
.end method

.method public varargs constructor <init>(ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V
    .locals 2

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 79
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->autoBind:Z

    const/4 v0, 0x0

    .line 83
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    .line 754
    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    .line 101
    new-instance v1, Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-direct {v1, p4}, Lcom/badlogic/gdx/graphics/VertexAttributes;-><init>([Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    invoke-direct {p0, p1, p2, v1}, Lcom/badlogic/gdx/graphics/Mesh;->makeVertexBuffer(ZILcom/badlogic/gdx/graphics/VertexAttributes;)Lcom/badlogic/gdx/graphics/glutils/VertexData;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    .line 102
    new-instance p2, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;

    invoke-direct {p2, p1, p3}, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;-><init>(ZI)V

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    .line 103
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isVertexArray:Z

    .line 105
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-static {p1, p0}, Lcom/badlogic/gdx/graphics/Mesh;->addManagedMesh(Lcom/badlogic/gdx/Application;Lcom/badlogic/gdx/graphics/Mesh;)V

    return-void
.end method

.method public constructor <init>(ZZIILcom/badlogic/gdx/graphics/VertexAttributes;)V
    .locals 2

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 79
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->autoBind:Z

    const/4 v0, 0x0

    .line 83
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    .line 754
    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    .line 134
    invoke-direct {p0, p1, p3, p5}, Lcom/badlogic/gdx/graphics/Mesh;->makeVertexBuffer(ZILcom/badlogic/gdx/graphics/VertexAttributes;)Lcom/badlogic/gdx/graphics/glutils/VertexData;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    .line 135
    new-instance p1, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;

    invoke-direct {p1, p2, p4}, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;-><init>(ZI)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    .line 136
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isVertexArray:Z

    .line 138
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-static {p1, p0}, Lcom/badlogic/gdx/graphics/Mesh;->addManagedMesh(Lcom/badlogic/gdx/Application;Lcom/badlogic/gdx/graphics/Mesh;)V

    return-void
.end method

.method private static addManagedMesh(Lcom/badlogic/gdx/Application;Lcom/badlogic/gdx/graphics/Mesh;)V
    .locals 1

    .line 947
    sget-object v0, Lcom/badlogic/gdx/graphics/Mesh;->meshes:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/Array;

    if-nez v0, :cond_0

    .line 948
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 949
    :cond_0
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 950
    sget-object p1, Lcom/badlogic/gdx/graphics/Mesh;->meshes:Ljava/util/Map;

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static clearAllMeshes(Lcom/badlogic/gdx/Application;)V
    .locals 1

    .line 966
    sget-object v0, Lcom/badlogic/gdx/graphics/Mesh;->meshes:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static getManagedStatus()Ljava/lang/String;
    .locals 4

    .line 970
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Managed meshes/app: { "

    .line 972
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 973
    sget-object v1, Lcom/badlogic/gdx/graphics/Mesh;->meshes:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/Application;

    .line 974
    sget-object v3, Lcom/badlogic/gdx/graphics/Mesh;->meshes:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    .line 975
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const-string v1, "}"

    .line 977
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 978
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static invalidateAllMeshes(Lcom/badlogic/gdx/Application;)V
    .locals 2

    .line 956
    sget-object v0, Lcom/badlogic/gdx/graphics/Mesh;->meshes:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/utils/Array;

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 958
    :goto_0
    iget v1, p0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, v1, :cond_1

    .line 959
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->invalidate()V

    .line 960
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->invalidate()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private makeVertexBuffer(ZILcom/badlogic/gdx/graphics/VertexAttributes;)Lcom/badlogic/gdx/graphics/glutils/VertexData;
    .locals 1

    .line 142
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    if-eqz v0, :cond_0

    .line 143
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;

    invoke-direct {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;-><init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V

    return-object v0

    .line 145
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;

    invoke-direct {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObject;-><init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V

    return-object v0
.end method

.method public static transform(Lcom/badlogic/gdx/math/Matrix4;[FIIIII)V
    .locals 5

    if-ltz p3, :cond_5

    const/4 v0, 0x1

    if-lt p4, v0, :cond_5

    add-int v1, p3, p4

    if-gt v1, p2, :cond_5

    if-ltz p5, :cond_4

    if-lt p6, v0, :cond_4

    add-int v1, p5, p6

    mul-int v1, v1, p2

    .line 1061
    array-length v2, p1

    if-gt v1, v2, :cond_4

    .line 1065
    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    mul-int p5, p5, p2

    add-int/2addr p3, p5

    const/4 p5, 0x0

    const/4 v2, 0x0

    if-eq p4, v0, :cond_2

    const/4 v0, 0x2

    if-eq p4, v0, :cond_1

    const/4 p5, 0x3

    if-eq p4, p5, :cond_0

    goto :goto_3

    :cond_0
    :goto_0
    if-ge v2, p6, :cond_3

    .line 1086
    aget p4, p1, p3

    add-int/lit8 p5, p3, 0x1

    aget v0, p1, p5

    add-int/lit8 v3, p3, 0x2

    aget v4, p1, v3

    invoke-virtual {v1, p4, v0, v4}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p4

    invoke-virtual {p4, p0}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 1087
    iget p4, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    aput p4, p1, p3

    .line 1088
    iget p4, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    aput p4, p1, p5

    .line 1089
    iget p4, v1, Lcom/badlogic/gdx/math/Vector3;->z:F

    aput p4, p1, v3

    add-int/2addr p3, p2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-ge v2, p6, :cond_3

    .line 1078
    aget p4, p1, p3

    add-int/lit8 v0, p3, 0x1

    aget v3, p1, v0

    invoke-virtual {v1, p4, v3, p5}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p4

    invoke-virtual {p4, p0}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 1079
    iget p4, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    aput p4, p1, p3

    .line 1080
    iget p4, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    aput p4, p1, v0

    add-int/2addr p3, p2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    if-ge v2, p6, :cond_3

    .line 1071
    aget p4, p1, p3

    invoke-virtual {v1, p4, p5, p5}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p4

    invoke-virtual {p4, p0}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 1072
    iget p4, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    aput p4, p1, p3

    add-int/2addr p3, p2

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_3
    :goto_3
    return-void

    .line 1062
    :cond_4
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "start = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, ", count = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, ", vertexSize = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", length = "

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p1, p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1060
    :cond_5
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    goto :goto_5

    :goto_4
    throw p0

    :goto_5
    goto :goto_4
.end method

.method public static transformUV(Lcom/badlogic/gdx/math/Matrix3;[FIIII)V
    .locals 4

    if-ltz p4, :cond_1

    const/4 v0, 0x1

    if-lt p5, v0, :cond_1

    add-int v0, p4, p5

    mul-int v0, v0, p2

    .line 1127
    array-length v1, p1

    if-gt v0, v1, :cond_1

    .line 1131
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    mul-int p4, p4, p2

    add-int/2addr p3, p4

    const/4 p4, 0x0

    :goto_0
    if-ge p4, p5, :cond_0

    .line 1135
    aget v1, p1, p3

    add-int/lit8 v2, p3, 0x1

    aget v3, p1, v2

    invoke-virtual {v0, v1, v3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/badlogic/gdx/math/Vector2;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector2;

    .line 1136
    iget v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v1, p1, p3

    .line 1137
    iget v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v1, p1, v2

    add-int/2addr p3, p2

    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_0
    return-void

    .line 1128
    :cond_1
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "start = "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, ", count = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, ", vertexSize = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", length = "

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p1, p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p0

    :goto_2
    goto :goto_1
.end method


# virtual methods
.method public bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    const/4 v0, 0x0

    .line 497
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/Mesh;->bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    return-void
.end method

.method public bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
    .locals 1

    .line 506
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    .line 507
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->getNumInstances()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    invoke-interface {v0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    .line 508
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getNumIndices()I

    move-result p1

    if-lez p1, :cond_1

    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->bind()V

    :cond_1
    return-void
.end method

.method public calculateBoundingBox()Lcom/badlogic/gdx/math/collision/BoundingBox;
    .locals 1

    .line 685
    new-instance v0, Lcom/badlogic/gdx/math/collision/BoundingBox;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/collision/BoundingBox;-><init>()V

    .line 686
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/Mesh;->calculateBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;)V

    return-object v0
.end method

.method public calculateBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;II)Lcom/badlogic/gdx/math/collision/BoundingBox;
    .locals 0

    .line 733
    invoke-virtual {p1}, Lcom/badlogic/gdx/math/collision/BoundingBox;->inf()Lcom/badlogic/gdx/math/collision/BoundingBox;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/Mesh;->extendBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;II)Lcom/badlogic/gdx/math/collision/BoundingBox;

    move-result-object p1

    return-object p1
.end method

.method public calculateBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;IILcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/collision/BoundingBox;
    .locals 0

    .line 742
    invoke-virtual {p1}, Lcom/badlogic/gdx/math/collision/BoundingBox;->inf()Lcom/badlogic/gdx/math/collision/BoundingBox;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Mesh;->extendBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;IILcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    move-result-object p1

    return-object p1
.end method

.method public calculateBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;)V
    .locals 8

    .line 695
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    move-result v0

    if-eqz v0, :cond_4

    .line 698
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    .line 699
    invoke-virtual {p1}, Lcom/badlogic/gdx/math/collision/BoundingBox;->inf()Lcom/badlogic/gdx/math/collision/BoundingBox;

    const/4 v2, 0x1

    .line 700
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v3

    .line 701
    iget v4, v3, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/lit8 v4, v4, 0x4

    .line 702
    iget-object v5, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v5}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v5

    iget v5, v5, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/lit8 v5, v5, 0x4

    .line 705
    iget v3, v3, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    const/4 v6, 0x0

    const/4 v7, 0x0

    if-eq v3, v2, :cond_2

    const/4 v2, 0x2

    if-eq v3, v2, :cond_1

    const/4 v2, 0x3

    if-eq v3, v2, :cond_0

    goto :goto_3

    :cond_0
    :goto_0
    if-ge v7, v0, :cond_3

    .line 720
    invoke-virtual {v1, v4}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v2

    add-int/lit8 v3, v4, 0x1

    invoke-virtual {v1, v3}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v3

    add-int/lit8 v6, v4, 0x2

    invoke-virtual {v1, v6}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v6

    invoke-virtual {p1, v2, v3, v6}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(FFF)Lcom/badlogic/gdx/math/collision/BoundingBox;

    add-int/2addr v4, v5

    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-ge v7, v0, :cond_3

    .line 714
    invoke-virtual {v1, v4}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v2

    add-int/lit8 v3, v4, 0x1

    invoke-virtual {v1, v3}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v3

    invoke-virtual {p1, v2, v3, v6}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(FFF)Lcom/badlogic/gdx/math/collision/BoundingBox;

    add-int/2addr v4, v5

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    if-ge v7, v0, :cond_3

    .line 708
    invoke-virtual {v1, v4}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v2

    invoke-virtual {p1, v2, v6, v6}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(FFF)Lcom/badlogic/gdx/math/collision/BoundingBox;

    add-int/2addr v4, v5

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_3
    :goto_3
    return-void

    .line 696
    :cond_4
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "No vertices defined"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw p1

    :goto_5
    goto :goto_4
.end method

.method public calculateRadius(FFF)F
    .locals 7

    .line 931
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v5

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/Mesh;->calculateRadius(FFFIILcom/badlogic/gdx/math/Matrix4;)F

    move-result p1

    return p1
.end method

.method public calculateRadius(FFFII)F
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    .line 913
    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/Mesh;->calculateRadius(FFFIILcom/badlogic/gdx/math/Matrix4;)F

    move-result p1

    return p1
.end method

.method public calculateRadius(FFFIILcom/badlogic/gdx/math/Matrix4;)F
    .locals 0

    .line 893
    invoke-virtual/range {p0 .. p6}, Lcom/badlogic/gdx/graphics/Mesh;->calculateRadiusSquared(FFFIILcom/badlogic/gdx/math/Matrix4;)F

    move-result p1

    float-to-double p1, p1

    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    double-to-float p1, p1

    return p1
.end method

.method public calculateRadius(Lcom/badlogic/gdx/math/Vector3;)F
    .locals 7

    .line 938
    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v5

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/Mesh;->calculateRadius(FFFIILcom/badlogic/gdx/math/Matrix4;)F

    move-result p1

    return p1
.end method

.method public calculateRadius(Lcom/badlogic/gdx/math/Vector3;II)F
    .locals 7

    .line 922
    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/4 v6, 0x0

    move-object v0, p0

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/Mesh;->calculateRadius(FFFIILcom/badlogic/gdx/math/Matrix4;)F

    move-result p1

    return p1
.end method

.method public calculateRadius(Lcom/badlogic/gdx/math/Vector3;IILcom/badlogic/gdx/math/Matrix4;)F
    .locals 7

    .line 902
    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    move-object v0, p0

    move v4, p2

    move v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/Mesh;->calculateRadius(FFFIILcom/badlogic/gdx/math/Matrix4;)F

    move-result p1

    return p1
.end method

.method public calculateRadiusSquared(FFFIILcom/badlogic/gdx/math/Matrix4;)F
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p5

    move-object/from16 v5, p6

    .line 840
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v6

    if-ltz p4, :cond_c

    const/4 v7, 0x1

    if-lt v4, v7, :cond_c

    add-int v4, p4, v4

    if-gt v4, v6, :cond_c

    .line 843
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v6}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getBuffer()Ljava/nio/FloatBuffer;

    move-result-object v6

    .line 844
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v8}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getBuffer()Ljava/nio/ShortBuffer;

    move-result-object v8

    .line 845
    invoke-virtual {v0, v7}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v9

    .line 846
    iget v10, v9, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/lit8 v10, v10, 0x4

    .line 847
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v11}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v11

    iget v11, v11, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/lit8 v11, v11, 0x4

    .line 852
    iget v9, v9, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    const/4 v12, 0x0

    if-eq v9, v7, :cond_7

    const/4 v13, 0x2

    if-eq v9, v13, :cond_3

    const/4 v7, 0x3

    if-eq v9, v7, :cond_0

    goto/16 :goto_3

    :cond_0
    move/from16 v7, p4

    :goto_0
    if-ge v7, v4, :cond_b

    .line 873
    invoke-virtual {v8, v7}, Ljava/nio/ShortBuffer;->get(I)S

    move-result v9

    mul-int v9, v9, v11

    add-int/2addr v9, v10

    .line 874
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v6, v9}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v15

    move/from16 p5, v10

    add-int/lit8 v10, v9, 0x1

    invoke-virtual {v6, v10}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v10

    add-int/2addr v9, v13

    invoke-virtual {v6, v9}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v9

    invoke-virtual {v14, v15, v10, v9}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    if-eqz v5, :cond_1

    .line 875
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v9, v5}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 876
    :cond_1
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v9, v1, v2, v3}, Lcom/badlogic/gdx/math/Vector3;->sub(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v9

    invoke-virtual {v9}, Lcom/badlogic/gdx/math/Vector3;->len2()F

    move-result v9

    cmpl-float v10, v9, v12

    if-lez v10, :cond_2

    move v12, v9

    :cond_2
    add-int/lit8 v7, v7, 0x1

    move/from16 v10, p5

    goto :goto_0

    :cond_3
    move/from16 p5, v10

    move/from16 v9, p4

    const/4 v10, 0x0

    :goto_1
    if-ge v9, v4, :cond_6

    .line 864
    invoke-virtual {v8, v9}, Ljava/nio/ShortBuffer;->get(I)S

    move-result v13

    mul-int v13, v13, v11

    add-int v13, v13, p5

    .line 865
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v6, v13}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v15

    add-int/2addr v13, v7

    invoke-virtual {v6, v13}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v13

    invoke-virtual {v14, v15, v13, v12}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    if-eqz v5, :cond_4

    .line 866
    iget-object v13, v0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v13, v5}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 867
    :cond_4
    iget-object v13, v0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v13, v1, v2, v3}, Lcom/badlogic/gdx/math/Vector3;->sub(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v13

    invoke-virtual {v13}, Lcom/badlogic/gdx/math/Vector3;->len2()F

    move-result v13

    cmpl-float v14, v13, v10

    if-lez v14, :cond_5

    move v10, v13

    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_6
    move v12, v10

    goto :goto_3

    :cond_7
    move/from16 p5, v10

    move/from16 v7, p4

    const/4 v9, 0x0

    :goto_2
    if-ge v7, v4, :cond_a

    .line 855
    invoke-virtual {v8, v7}, Ljava/nio/ShortBuffer;->get(I)S

    move-result v10

    mul-int v10, v10, v11

    add-int v10, v10, p5

    .line 856
    iget-object v13, v0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v6, v10}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v10

    invoke-virtual {v13, v10, v12, v12}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    if-eqz v5, :cond_8

    .line 857
    iget-object v10, v0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v10, v5}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 858
    :cond_8
    iget-object v10, v0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v10, v1, v2, v3}, Lcom/badlogic/gdx/math/Vector3;->sub(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v10

    invoke-virtual {v10}, Lcom/badlogic/gdx/math/Vector3;->len2()F

    move-result v10

    cmpl-float v13, v10, v9

    if-lez v13, :cond_9

    move v9, v10

    :cond_9
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_a
    move v12, v9

    :cond_b
    :goto_3
    return v12

    .line 841
    :cond_c
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v2, "Not enough indices"

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :goto_4
    throw v1

    :goto_5
    goto :goto_4
.end method

.method public copy(Z)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1238
    invoke-virtual {p0, p1, v0, v1}, Lcom/badlogic/gdx/graphics/Mesh;->copy(ZZ[I)Lcom/badlogic/gdx/graphics/Mesh;

    move-result-object p1

    return-object p1
.end method

.method public copy(ZZ[I)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p3

    .line 1151
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexSize()I

    move-result v3

    div-int/lit8 v3, v3, 0x4

    .line 1152
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    move-result v4

    mul-int v5, v4, v3

    .line 1153
    new-array v5, v5, [F

    .line 1154
    array-length v6, v5

    const/4 v7, 0x0

    invoke-virtual {v0, v7, v6, v5}, Lcom/badlogic/gdx/graphics/Mesh;->getVertices(II[F)[F

    const/4 v8, 0x0

    if-eqz v2, :cond_4

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    .line 1161
    :goto_0
    array-length v12, v2

    if-ge v9, v12, :cond_1

    .line 1162
    aget v12, v2, v9

    invoke-virtual {v0, v12}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v12

    if-eqz v12, :cond_0

    .line 1163
    aget v12, v2, v9

    invoke-virtual {v0, v12}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v12

    iget v12, v12, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    add-int/2addr v10, v12

    add-int/lit8 v11, v11, 0x1

    :cond_0
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_1
    if-lez v10, :cond_4

    .line 1167
    new-array v9, v11, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    .line 1168
    new-array v10, v10, [S

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, -0x1

    const/4 v14, -0x1

    .line 1171
    :goto_1
    array-length v15, v2

    if-ge v11, v15, :cond_5

    .line 1172
    aget v15, v2, v11

    invoke-virtual {v0, v15}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v15

    if-nez v15, :cond_2

    goto :goto_3

    :cond_2
    move/from16 v16, v13

    const/4 v13, 0x0

    .line 1174
    :goto_2
    iget v6, v15, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    if-ge v13, v6, :cond_3

    add-int/lit8 v16, v16, 0x1

    .line 1175
    iget v6, v15, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    add-int/2addr v6, v13

    int-to-short v6, v6

    aput-short v6, v10, v16

    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    :cond_3
    add-int/lit8 v14, v14, 0x1

    .line 1176
    invoke-virtual {v15}, Lcom/badlogic/gdx/graphics/VertexAttribute;->copy()Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v6

    aput-object v6, v9, v14

    .line 1177
    iget v6, v15, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    add-int/2addr v12, v6

    move/from16 v13, v16

    :goto_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    :cond_4
    move-object v9, v8

    move-object v10, v9

    const/4 v12, 0x0

    :cond_5
    if-nez v10, :cond_7

    .line 1182
    new-array v10, v3, [S

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v3, :cond_6

    .line 1184
    aput-short v2, v10, v2

    add-int/lit8 v2, v2, 0x1

    int-to-short v2, v2

    goto :goto_4

    :cond_6
    move v12, v3

    .line 1188
    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v2

    if-lez v2, :cond_11

    .line 1191
    new-array v8, v2, [S

    .line 1192
    invoke-virtual {v0, v8}, Lcom/badlogic/gdx/graphics/Mesh;->getIndices([S)V

    if-nez p2, :cond_8

    if-eq v12, v3, :cond_11

    .line 1194
    :cond_8
    array-length v4, v5

    new-array v4, v4, [F

    const/4 v6, 0x0

    const/4 v11, 0x0

    :goto_5
    if-ge v6, v2, :cond_10

    .line 1197
    aget-short v13, v8, v6

    mul-int v13, v13, v3

    if-eqz p2, :cond_c

    const/4 v14, 0x0

    const/4 v15, -0x1

    :goto_6
    if-ge v14, v11, :cond_d

    if-gez v15, :cond_d

    mul-int v16, v14, v12

    const/16 v17, 0x1

    .line 1203
    :goto_7
    array-length v0, v10

    if-ge v7, v0, :cond_a

    if-eqz v17, :cond_a

    add-int v0, v16, v7

    .line 1204
    aget v0, v4, v0

    aget-short v18, v10, v7

    add-int v18, v13, v18

    aget v18, v5, v18

    cmpl-float v0, v0, v18

    if-eqz v0, :cond_9

    const/16 v17, 0x0

    :cond_9
    add-int/lit8 v7, v7, 0x1

    goto :goto_7

    :cond_a
    if-eqz v17, :cond_b

    move v15, v14

    :cond_b
    add-int/lit8 v14, v14, 0x1

    int-to-short v14, v14

    const/4 v7, 0x0

    move-object/from16 v0, p0

    goto :goto_6

    :cond_c
    const/4 v15, -0x1

    :cond_d
    if-lez v15, :cond_e

    .line 1210
    aput-short v15, v8, v6

    goto :goto_9

    :cond_e
    mul-int v0, v11, v12

    const/4 v7, 0x0

    .line 1213
    :goto_8
    array-length v14, v10

    if-ge v7, v14, :cond_f

    add-int v14, v0, v7

    .line 1214
    aget-short v15, v10, v7

    add-int/2addr v15, v13

    aget v15, v5, v15

    aput v15, v4, v14

    add-int/lit8 v7, v7, 0x1

    goto :goto_8

    :cond_f
    int-to-short v0, v11

    .line 1215
    aput-short v0, v8, v6

    add-int/lit8 v11, v11, 0x1

    :goto_9
    add-int/lit8 v6, v6, 0x1

    const/4 v7, 0x0

    move-object/from16 v0, p0

    goto :goto_5

    :cond_10
    move-object v5, v4

    move v4, v11

    :cond_11
    if-nez v9, :cond_13

    .line 1226
    new-instance v0, Lcom/badlogic/gdx/graphics/Mesh;

    if-nez v8, :cond_12

    const/4 v7, 0x0

    goto :goto_a

    :cond_12
    array-length v7, v8

    :goto_a
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v2

    invoke-direct {v0, v1, v4, v7, v2}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(ZIILcom/badlogic/gdx/graphics/VertexAttributes;)V

    goto :goto_c

    .line 1228
    :cond_13
    new-instance v0, Lcom/badlogic/gdx/graphics/Mesh;

    if-nez v8, :cond_14

    const/4 v7, 0x0

    goto :goto_b

    :cond_14
    array-length v7, v8

    :goto_b
    invoke-direct {v0, v1, v4, v7, v9}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    :goto_c
    mul-int v4, v4, v12

    const/4 v1, 0x0

    .line 1229
    invoke-virtual {v0, v5, v1, v4}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;

    if-eqz v8, :cond_15

    .line 1230
    invoke-virtual {v0, v8}, Lcom/badlogic/gdx/graphics/Mesh;->setIndices([S)Lcom/badlogic/gdx/graphics/Mesh;

    :cond_15
    return-object v0
.end method

.method public disableInstancedRendering()Lcom/badlogic/gdx/graphics/Mesh;
    .locals 1

    .line 208
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 209
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    .line 210
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->dispose()V

    const/4 v0, 0x0

    .line 211
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    :cond_0
    return-object p0
.end method

.method public dispose()V
    .locals 2

    .line 651
    sget-object v0, Lcom/badlogic/gdx/graphics/Mesh;->meshes:Ljava/util/Map;

    sget-object v1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/badlogic/gdx/graphics/Mesh;->meshes:Ljava/util/Map;

    sget-object v1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 652
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->dispose()V

    .line 653
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->dispose()V

    .line 654
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->dispose()V

    return-void
.end method

.method public varargs enableInstancedRendering(ZI[Lcom/badlogic/gdx/graphics/VertexAttribute;)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 1

    .line 197
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 198
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    .line 199
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;

    invoke-direct {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObject;-><init>(ZI[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    return-object p0

    .line 201
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Trying to enable InstancedRendering on same Mesh instance twice. Use disableInstancedRendering to clean up old InstanceData first"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public extendBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;II)Lcom/badlogic/gdx/math/collision/BoundingBox;
    .locals 1

    const/4 v0, 0x0

    .line 751
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/graphics/Mesh;->extendBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;IILcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    move-result-object p1

    return-object p1
.end method

.method public extendBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;IILcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/collision/BoundingBox;
    .locals 9

    .line 762
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v0

    .line 763
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    move-result v1

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    if-ltz p2, :cond_e

    const/4 v2, 0x1

    if-lt p3, v2, :cond_e

    add-int v3, p2, p3

    if-gt v3, v1, :cond_e

    .line 768
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {p3}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getBuffer()Ljava/nio/FloatBuffer;

    move-result-object p3

    .line 769
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getBuffer()Ljava/nio/ShortBuffer;

    move-result-object v1

    .line 770
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v4

    .line 771
    iget v5, v4, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/lit8 v5, v5, 0x4

    .line 772
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v6}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v6

    iget v6, v6, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/lit8 v6, v6, 0x4

    .line 775
    iget v4, v4, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    const/4 v7, 0x0

    if-eq v4, v2, :cond_9

    const/4 v8, 0x2

    if-eq v4, v8, :cond_5

    const/4 v2, 0x3

    if-eq v4, v2, :cond_1

    goto/16 :goto_7

    :cond_1
    if-lez v0, :cond_3

    :goto_1
    if-ge p2, v3, :cond_d

    .line 813
    invoke-virtual {v1, p2}, Ljava/nio/ShortBuffer;->get(I)S

    move-result v0

    mul-int v0, v0, v6

    add-int/2addr v0, v5

    .line 814
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v4

    add-int/lit8 v7, v0, 0x1

    invoke-virtual {p3, v7}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v7

    add-int/2addr v0, v8

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v0

    invoke-virtual {v2, v4, v7, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    if-eqz p4, :cond_2

    .line 815
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 816
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    if-ge p2, v3, :cond_d

    mul-int v0, p2, v6

    add-int/2addr v0, v5

    .line 821
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v2

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {p3, v4}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v4

    add-int/2addr v0, v8

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v0

    invoke-virtual {v1, v2, v4, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    if-eqz p4, :cond_4

    .line 822
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 823
    :cond_4
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_5
    if-lez v0, :cond_7

    :goto_3
    if-ge p2, v3, :cond_d

    .line 796
    invoke-virtual {v1, p2}, Ljava/nio/ShortBuffer;->get(I)S

    move-result v0

    mul-int v0, v0, v6

    add-int/2addr v0, v5

    .line 797
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v8

    add-int/2addr v0, v2

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v0

    invoke-virtual {v4, v8, v0, v7}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    if-eqz p4, :cond_6

    .line 798
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 799
    :cond_6
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    add-int/lit8 p2, p2, 0x1

    goto :goto_3

    :cond_7
    :goto_4
    if-ge p2, v3, :cond_d

    mul-int v0, p2, v6

    add-int/2addr v0, v5

    .line 804
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v4

    add-int/2addr v0, v2

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v0

    invoke-virtual {v1, v4, v0, v7}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    if-eqz p4, :cond_8

    .line 805
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 806
    :cond_8
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    add-int/lit8 p2, p2, 0x1

    goto :goto_4

    :cond_9
    if-lez v0, :cond_b

    :goto_5
    if-ge p2, v3, :cond_d

    .line 779
    invoke-virtual {v1, p2}, Ljava/nio/ShortBuffer;->get(I)S

    move-result v0

    mul-int v0, v0, v6

    add-int/2addr v0, v5

    .line 780
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v0

    invoke-virtual {v2, v0, v7, v7}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    if-eqz p4, :cond_a

    .line 781
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 782
    :cond_a
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    add-int/lit8 p2, p2, 0x1

    goto :goto_5

    :cond_b
    :goto_6
    if-ge p2, v3, :cond_d

    mul-int v0, p2, v6

    add-int/2addr v0, v5

    .line 787
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v0

    invoke-virtual {v1, v0, v7, v7}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    if-eqz p4, :cond_c

    .line 788
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 789
    :cond_c
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    add-int/lit8 p2, p2, 0x1

    goto :goto_6

    :cond_d
    :goto_7
    return-object p1

    .line 766
    :cond_e
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Invalid part specified ( offset="

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", count="

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", max="

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " )"

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_9

    :goto_8
    throw p1

    :goto_9
    goto :goto_8
.end method

.method public getIndices(II[SI)V
    .locals 2

    .line 444
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v0

    if-gez p2, :cond_0

    sub-int p2, v0, p1

    :cond_0
    if-ltz p1, :cond_2

    if-ge p1, v0, :cond_2

    add-int v1, p1, p2

    if-gt v1, v0, :cond_2

    .line 449
    array-length v0, p3

    sub-int/2addr v0, p4

    if-lt v0, p2, :cond_1

    .line 451
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getIndicesBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->position()I

    move-result v0

    .line 452
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getIndicesBuffer()Ljava/nio/ShortBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 453
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getIndicesBuffer()Ljava/nio/ShortBuffer;

    move-result-object p1

    invoke-virtual {p1, p3, p4, p2}, Ljava/nio/ShortBuffer;->get([SII)Ljava/nio/ShortBuffer;

    .line 454
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getIndicesBuffer()Ljava/nio/ShortBuffer;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    return-void

    .line 450
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "not enough room in indices array, has "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p3, p3

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " shorts, needs "

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 447
    :cond_2
    new-instance p3, Ljava/lang/IllegalArgumentException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid range specified, offset: "

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", count: "

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", max: "

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p3
.end method

.method public getIndices(I[SI)V
    .locals 1

    const/4 v0, -0x1

    .line 434
    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/badlogic/gdx/graphics/Mesh;->getIndices(II[SI)V

    return-void
.end method

.method public getIndices([S)V
    .locals 1

    const/4 v0, 0x0

    .line 417
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/Mesh;->getIndices([SI)V

    return-void
.end method

.method public getIndices([SI)V
    .locals 1

    const/4 v0, 0x0

    .line 425
    invoke-virtual {p0, v0, p1, p2}, Lcom/badlogic/gdx/graphics/Mesh;->getIndices(I[SI)V

    return-void
.end method

.method public getIndicesBuffer()Ljava/nio/ShortBuffer;
    .locals 1

    .line 943
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getMaxIndices()I
    .locals 1

    .line 474
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getNumMaxIndices()I

    move-result v0

    return v0
.end method

.method public getMaxVertices()I
    .locals 1

    .line 469
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getNumMaxVertices()I

    move-result v0

    return v0
.end method

.method public getNumIndices()I
    .locals 1

    .line 459
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getNumIndices()I

    move-result v0

    return v0
.end method

.method public getNumVertices()I
    .locals 1

    .line 464
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getNumVertices()I

    move-result v0

    return v0
.end method

.method public getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;
    .locals 4

    .line 662
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v0

    .line 663
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 665
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v3

    iget v3, v3, Lcom/badlogic/gdx/graphics/VertexAttribute;->usage:I

    if-ne v3, p1, :cond_0

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object p1

    return-object p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;
    .locals 1

    .line 672
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v0

    return-object v0
.end method

.method public getVertexSize()I
    .locals 1

    .line 479
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    return v0
.end method

.method public getVertices(II[F)[F
    .locals 1

    const/4 v0, 0x0

    .line 364
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertices(II[FI)[F

    move-result-object p1

    return-object p1
.end method

.method public getVertices(II[FI)[F
    .locals 2

    .line 375
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    move-result v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexSize()I

    move-result v1

    mul-int v0, v0, v1

    div-int/lit8 v0, v0, 0x4

    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    sub-int p2, v0, p1

    .line 378
    array-length v1, p3

    sub-int/2addr v1, p4

    if-le p2, v1, :cond_0

    array-length p2, p3

    sub-int/2addr p2, p4

    :cond_0
    if-ltz p1, :cond_2

    if-lez p2, :cond_2

    add-int v1, p1, p2

    if-gt v1, v0, :cond_2

    if-ltz p4, :cond_2

    .line 380
    array-length v0, p3

    if-ge p4, v0, :cond_2

    .line 382
    array-length v0, p3

    sub-int/2addr v0, p4

    if-lt v0, p2, :cond_1

    .line 385
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->position()I

    move-result v0

    .line 386
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 387
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    invoke-virtual {p1, p3, p4, p2}, Ljava/nio/FloatBuffer;->get([FII)Ljava/nio/FloatBuffer;

    .line 388
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    return-object p3

    .line 383
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "not enough room in vertices array, has "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p3, p3

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " floats, needs "

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 381
    :cond_2
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public getVertices(I[F)[F
    .locals 1

    const/4 v0, -0x1

    .line 356
    invoke-virtual {p0, p1, v0, p2}, Lcom/badlogic/gdx/graphics/Mesh;->getVertices(II[F)[F

    move-result-object p1

    return-object p1
.end method

.method public getVertices([F)[F
    .locals 2

    const/4 v0, 0x0

    const/4 v1, -0x1

    .line 348
    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/graphics/Mesh;->getVertices(II[F)[F

    move-result-object p1

    return-object p1
.end method

.method public getVerticesBuffer()Ljava/nio/FloatBuffer;
    .locals 1

    .line 677
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->getBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    return-object v0
.end method

.method public render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;I)V
    .locals 7

    .line 550
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getNumMaxIndices()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    move-result v0

    :goto_0
    move v5, v0

    iget-boolean v6, p0, Lcom/badlogic/gdx/graphics/Mesh;->autoBind:Z

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    invoke-virtual/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;IIIZ)V

    return-void
.end method

.method public render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V
    .locals 6

    .line 577
    iget-boolean v5, p0, Lcom/badlogic/gdx/graphics/Mesh;->autoBind:Z

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;IIIZ)V

    return-void
.end method

.method public render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;IIIZ)V
    .locals 8

    if-nez p4, :cond_0

    return-void

    :cond_0
    if-eqz p5, :cond_1

    .line 607
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/Mesh;->bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    .line 609
    :cond_1
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isVertexArray:Z

    const/16 v1, 0x1403

    if-eqz v0, :cond_3

    .line 610
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getNumIndices()I

    move-result v0

    if-lez v0, :cond_2

    .line 611
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    .line 612
    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->position()I

    move-result v2

    .line 613
    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->limit()I

    move-result v3

    .line 614
    invoke-virtual {v0, p3}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    add-int/2addr p3, p4

    .line 615
    invoke-virtual {v0, p3}, Ljava/nio/ShortBuffer;->limit(I)Ljava/nio/Buffer;

    .line 616
    sget-object p3, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {p3, p2, p4, v1, v0}, Lcom/badlogic/gdx/graphics/GL20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 617
    invoke-virtual {v0, v2}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 618
    invoke-virtual {v0, v3}, Ljava/nio/ShortBuffer;->limit(I)Ljava/nio/Buffer;

    goto/16 :goto_1

    .line 620
    :cond_2
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0, p2, p3, p4}, Lcom/badlogic/gdx/graphics/GL20;->glDrawArrays(III)V

    goto/16 :goto_1

    :cond_3
    const/4 v0, 0x0

    .line 624
    iget-boolean v2, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    if-eqz v2, :cond_4

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->getNumInstances()I

    move-result v0

    move v7, v0

    goto :goto_0

    :cond_4
    const/4 v7, 0x0

    .line 626
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getNumIndices()I

    move-result v0

    if-lez v0, :cond_7

    add-int v0, p4, p3

    .line 627
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v2}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getNumMaxIndices()I

    move-result v2

    if-gt v0, v2, :cond_6

    .line 632
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    if-eqz v0, :cond_5

    if-lez v7, :cond_5

    .line 633
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    const/16 v5, 0x1403

    mul-int/lit8 v6, p3, 0x2

    move v3, p2

    move v4, p4

    invoke-interface/range {v2 .. v7}, Lcom/badlogic/gdx/graphics/GL30;->glDrawElementsInstanced(IIIII)V

    goto :goto_1

    .line 635
    :cond_5
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    mul-int/lit8 p3, p3, 0x2

    invoke-interface {v0, p2, p4, v1, p3}, Lcom/badlogic/gdx/graphics/GL20;->glDrawElements(IIII)V

    goto :goto_1

    .line 628
    :cond_6
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "Mesh attempting to access memory outside of the index buffer (count: "

    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, ", offset: "

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ", max: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    .line 629
    invoke-interface {p3}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getNumMaxIndices()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 638
    :cond_7
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->isInstanced:Z

    if-eqz v0, :cond_8

    if-lez v7, :cond_8

    .line 639
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    invoke-interface {v0, p2, p3, p4, v7}, Lcom/badlogic/gdx/graphics/GL30;->glDrawArraysInstanced(IIII)V

    goto :goto_1

    .line 641
    :cond_8
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0, p2, p3, p4}, Lcom/badlogic/gdx/graphics/GL20;->glDrawArrays(III)V

    :goto_1
    if-eqz p5, :cond_9

    .line 646
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/Mesh;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    :cond_9
    return-void
.end method

.method public scale(FFF)V
    .locals 7

    const/4 v0, 0x1

    .line 988
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v1

    .line 989
    iget v2, v1, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/lit8 v2, v2, 0x4

    .line 990
    iget v1, v1, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    .line 991
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    move-result v3

    .line 992
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexSize()I

    move-result v4

    div-int/lit8 v4, v4, 0x4

    mul-int v5, v3, v4

    .line 994
    new-array v5, v5, [F

    .line 995
    invoke-virtual {p0, v5}, Lcom/badlogic/gdx/graphics/Mesh;->getVertices([F)[F

    const/4 v6, 0x0

    if-eq v1, v0, :cond_2

    const/4 v0, 0x2

    if-eq v1, v0, :cond_1

    const/4 v0, 0x3

    if-eq v1, v0, :cond_0

    goto :goto_3

    :cond_0
    :goto_0
    if-ge v6, v3, :cond_3

    .line 1014
    aget v0, v5, v2

    mul-float v0, v0, p1

    aput v0, v5, v2

    add-int/lit8 v0, v2, 0x1

    .line 1015
    aget v1, v5, v0

    mul-float v1, v1, p2

    aput v1, v5, v0

    add-int/lit8 v0, v2, 0x2

    .line 1016
    aget v1, v5, v0

    mul-float v1, v1, p3

    aput v1, v5, v0

    add-int/2addr v2, v4

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-ge v6, v3, :cond_3

    .line 1007
    aget p3, v5, v2

    mul-float p3, p3, p1

    aput p3, v5, v2

    add-int/lit8 p3, v2, 0x1

    .line 1008
    aget v0, v5, p3

    mul-float v0, v0, p2

    aput v0, v5, p3

    add-int/2addr v2, v4

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    if-ge v6, v3, :cond_3

    .line 1001
    aget p2, v5, v2

    mul-float p2, p2, p1

    aput p2, v5, v2

    add-int/2addr v2, v4

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 1022
    :cond_3
    :goto_3
    invoke-virtual {p0, v5}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([F)Lcom/badlogic/gdx/graphics/Mesh;

    return-void
.end method

.method public setAutoBind(Z)V
    .locals 0

    .line 489
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->autoBind:Z

    return-void
.end method

.method public setIndices([S)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 3

    .line 397
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    array-length v1, p1

    const/4 v2, 0x0

    invoke-interface {v0, p1, v2, v1}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->setIndices([SII)V

    return-object p0
.end method

.method public setIndices([SII)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 1

    .line 409
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->setIndices([SII)V

    return-object p0
.end method

.method public setInstanceData(Ljava/nio/FloatBuffer;)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 2

    .line 263
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    if-eqz v0, :cond_0

    .line 264
    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->limit()I

    move-result v1

    invoke-interface {v0, p1, v1}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->setInstanceData(Ljava/nio/FloatBuffer;I)V

    return-object p0

    .line 266
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "An InstanceBufferObject must be set before setting instance data!"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setInstanceData(Ljava/nio/FloatBuffer;I)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 1

    .line 250
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    if-eqz v0, :cond_0

    .line 251
    invoke-interface {v0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->setInstanceData(Ljava/nio/FloatBuffer;I)V

    return-object p0

    .line 253
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "An InstanceBufferObject must be set before setting instance data!"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setInstanceData([F)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 3

    .line 236
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 237
    array-length v2, p1

    invoke-interface {v0, p1, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->setInstanceData([FII)V

    return-object p0

    .line 239
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "An InstanceBufferObject must be set before setting instance data!"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setInstanceData([FII)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    if-eqz v0, :cond_0

    .line 224
    invoke-interface {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->setInstanceData([FII)V

    return-object p0

    .line 226
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "An InstanceBufferObject must be set before setting instance data!"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setVertices([F)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 3

    .line 311
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    array-length v1, p1

    const/4 v2, 0x0

    invoke-interface {v0, p1, v2, v1}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->setVertices([FII)V

    return-object p0
.end method

.method public setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 1

    .line 323
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->setVertices([FII)V

    return-object p0
.end method

.method public transform(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 2

    .line 1030
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/badlogic/gdx/graphics/Mesh;->transform(Lcom/badlogic/gdx/math/Matrix4;II)V

    return-void
.end method

.method public transform(Lcom/badlogic/gdx/math/Matrix4;II)V
    .locals 9

    const/4 v0, 0x1

    .line 1035
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    .line 1036
    iget v1, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/lit8 v5, v1, 0x4

    .line 1037
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexSize()I

    move-result v1

    div-int/lit8 v4, v1, 0x4

    .line 1038
    iget v6, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    .line 1039
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    mul-int v0, p3, v4

    .line 1041
    new-array v1, v0, [F

    mul-int p2, p2, v4

    .line 1042
    invoke-virtual {p0, p2, v0, v1}, Lcom/badlogic/gdx/graphics/Mesh;->getVertices(II[F)[F

    const/4 v7, 0x0

    move-object v2, p1

    move-object v3, v1

    move v8, p3

    .line 1044
    invoke-static/range {v2 .. v8}, Lcom/badlogic/gdx/graphics/Mesh;->transform(Lcom/badlogic/gdx/math/Matrix4;[FIIIII)V

    .line 1046
    invoke-virtual {p0, p2, v1}, Lcom/badlogic/gdx/graphics/Mesh;->updateVertices(I[F)Lcom/badlogic/gdx/graphics/Mesh;

    return-void
.end method

.method public transformUV(Lcom/badlogic/gdx/math/Matrix3;)V
    .locals 2

    .line 1101
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/badlogic/gdx/graphics/Mesh;->transformUV(Lcom/badlogic/gdx/math/Matrix3;II)V

    return-void
.end method

.method protected transformUV(Lcom/badlogic/gdx/math/Matrix3;II)V
    .locals 8

    const/16 v0, 0x10

    .line 1106
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttribute(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    .line 1107
    iget v0, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    div-int/lit8 v4, v0, 0x4

    .line 1108
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexSize()I

    move-result v0

    div-int/lit8 v3, v0, 0x4

    .line 1109
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Mesh;->getNumVertices()I

    move-result v0

    mul-int v0, v0, v3

    .line 1111
    new-array v0, v0, [F

    .line 1113
    array-length v1, v0

    const/4 v7, 0x0

    invoke-virtual {p0, v7, v1, v0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertices(II[F)[F

    move-object v1, p1

    move-object v2, v0

    move v5, p2

    move v6, p3

    .line 1114
    invoke-static/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/Mesh;->transformUV(Lcom/badlogic/gdx/math/Matrix3;[FIIII)V

    .line 1115
    array-length p1, v0

    invoke-virtual {p0, v0, v7, p1}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;

    return-void
.end method

.method public unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    const/4 v0, 0x0

    .line 516
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/Mesh;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    return-void
.end method

.method public unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
    .locals 1

    .line 525
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    .line 526
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->getNumInstances()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    invoke-interface {v0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    .line 527
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->getNumIndices()I

    move-result p1

    if-lez p1, :cond_1

    iget-object p1, p0, Lcom/badlogic/gdx/graphics/Mesh;->indices:Lcom/badlogic/gdx/graphics/glutils/IndexData;

    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/glutils/IndexData;->unbind()V

    :cond_1
    return-void
.end method

.method public updateInstanceData(ILjava/nio/FloatBuffer;)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 2

    .line 293
    invoke-virtual {p2}, Ljava/nio/FloatBuffer;->limit()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/badlogic/gdx/graphics/Mesh;->updateInstanceData(ILjava/nio/FloatBuffer;II)Lcom/badlogic/gdx/graphics/Mesh;

    move-result-object p1

    return-object p1
.end method

.method public updateInstanceData(ILjava/nio/FloatBuffer;II)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 1

    .line 302
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->updateInstanceData(ILjava/nio/FloatBuffer;II)V

    return-object p0
.end method

.method public updateInstanceData(I[F)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 2

    .line 276
    array-length v0, p2

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/badlogic/gdx/graphics/Mesh;->updateInstanceData(I[FII)Lcom/badlogic/gdx/graphics/Mesh;

    move-result-object p1

    return-object p1
.end method

.method public updateInstanceData(I[FII)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 1

    .line 285
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->instances:Lcom/badlogic/gdx/graphics/glutils/InstanceData;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/glutils/InstanceData;->updateInstanceData(I[FII)V

    return-object p0
.end method

.method public updateVertices(I[F)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 2

    .line 332
    array-length v0, p2

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/badlogic/gdx/graphics/Mesh;->updateVertices(I[FII)Lcom/badlogic/gdx/graphics/Mesh;

    move-result-object p1

    return-object p1
.end method

.method public updateVertices(I[FII)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 1

    .line 341
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Mesh;->vertices:Lcom/badlogic/gdx/graphics/glutils/VertexData;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/glutils/VertexData;->updateVertices(I[FII)V

    return-object p0
.end method
