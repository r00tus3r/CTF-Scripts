.class public Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;
.super Ljava/lang/Object;
.source "MeshPart.java"


# static fields
.field private static final bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;


# instance fields
.field public final center:Lcom/badlogic/gdx/math/Vector3;

.field public final halfExtents:Lcom/badlogic/gdx/math/Vector3;

.field public id:Ljava/lang/String;

.field public mesh:Lcom/badlogic/gdx/graphics/Mesh;

.field public offset:I

.field public primitiveType:I

.field public radius:F

.field public size:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 68
    new-instance v0, Lcom/badlogic/gdx/math/collision/BoundingBox;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/collision/BoundingBox;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->center:Lcom/badlogic/gdx/math/Vector3;

    .line 63
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->halfExtents:Lcom/badlogic/gdx/math/Vector3;

    const/high16 v0, -0x40800000    # -1.0f

    .line 66
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->radius:F

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;)V
    .locals 1

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->center:Lcom/badlogic/gdx/math/Vector3;

    .line 63
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->halfExtents:Lcom/badlogic/gdx/math/Vector3;

    const/high16 v0, -0x40800000    # -1.0f

    .line 66
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->radius:F

    .line 87
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->set(Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/graphics/Mesh;III)V
    .locals 1

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->center:Lcom/badlogic/gdx/math/Vector3;

    .line 63
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->halfExtents:Lcom/badlogic/gdx/math/Vector3;

    const/high16 v0, -0x40800000    # -1.0f

    .line 66
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->radius:F

    .line 81
    invoke-virtual/range {p0 .. p5}, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->set(Ljava/lang/String;Lcom/badlogic/gdx/graphics/Mesh;III)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    return-void
.end method


# virtual methods
.method public equals(Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;)Z
    .locals 2

    if-eq p1, p0, :cond_1

    if-eqz p1, :cond_0

    .line 135
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    if-ne v0, v1, :cond_0

    iget p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    if-ne p1, p0, :cond_1

    const/4 p1, 0x1

    return p1

    .line 143
    :cond_1
    instance-of v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    if-nez v1, :cond_2

    return v0

    .line 144
    :cond_2
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->equals(Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;)Z

    move-result p1

    return p1
.end method

.method public render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 4

    .line 159
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    return-void
.end method

.method public render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;Z)V
    .locals 6

    .line 152
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    iget v4, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    move-object v1, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;IIIZ)V

    return-void
.end method

.method public set(Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;
    .locals 2

    .line 94
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->id:Ljava/lang/String;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->id:Ljava/lang/String;

    .line 95
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 96
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    .line 97
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    .line 98
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->center:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->center:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 100
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->halfExtents:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->halfExtents:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 101
    iget p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->radius:F

    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->radius:F

    return-object p0
.end method

.method public set(Ljava/lang/String;Lcom/badlogic/gdx/graphics/Mesh;III)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;
    .locals 0

    .line 108
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->id:Ljava/lang/String;

    .line 109
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 110
    iput p3, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    .line 111
    iput p4, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    .line 112
    iput p5, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    .line 113
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->center:Lcom/badlogic/gdx/math/Vector3;

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2, p2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 114
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->halfExtents:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2, p2, p2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    const/high16 p1, -0x40800000    # -1.0f

    .line 115
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->radius:F

    return-object p0
.end method

.method public update()V
    .locals 4

    .line 124
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/Mesh;->calculateBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;II)Lcom/badlogic/gdx/math/collision/BoundingBox;

    .line 125
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->center:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/collision/BoundingBox;->getCenter(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 126
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->halfExtents:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/collision/BoundingBox;->getDimensions(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    .line 127
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->halfExtents:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Vector3;->len()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->radius:F

    return-void
.end method
