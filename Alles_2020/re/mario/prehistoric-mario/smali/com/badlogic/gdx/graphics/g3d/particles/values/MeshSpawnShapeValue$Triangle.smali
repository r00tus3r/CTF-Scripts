.class public Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;
.super Ljava/lang/Object;
.source "MeshSpawnShapeValue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Triangle"
.end annotation


# instance fields
.field x1:F

.field x2:F

.field x3:F

.field y1:F

.field y2:F

.field y3:F

.field z1:F

.field z2:F

.field z3:F


# direct methods
.method public constructor <init>(FFFFFFFFF)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->x1:F

    .line 38
    iput p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->y1:F

    .line 39
    iput p3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->z1:F

    .line 40
    iput p4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->x2:F

    .line 41
    iput p5, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->y2:F

    .line 42
    iput p6, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->z2:F

    .line 43
    iput p7, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->x3:F

    .line 44
    iput p8, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->y3:F

    .line 45
    iput p9, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->z3:F

    return-void
.end method

.method public static pick(FFFFFFFFFLcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 50
    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v0

    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v1

    sub-float/2addr p3, p0

    mul-float p3, p3, v0

    add-float/2addr p3, p0

    sub-float/2addr p6, p0

    mul-float p6, p6, v1

    add-float/2addr p3, p6

    sub-float/2addr p4, p1

    mul-float p4, p4, v0

    add-float/2addr p4, p1

    sub-float/2addr p7, p1

    mul-float p7, p7, v1

    add-float/2addr p4, p7

    sub-float/2addr p5, p2

    mul-float v0, v0, p5

    add-float/2addr v0, p2

    sub-float/2addr p8, p2

    mul-float v1, v1, p8

    add-float/2addr v0, v1

    .line 51
    invoke-virtual {p9, p3, p4, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public pick(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 6

    .line 56
    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v0

    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v1

    .line 57
    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->x1:F

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->x2:F

    sub-float/2addr v3, v2

    mul-float v3, v3, v0

    add-float/2addr v3, v2

    iget v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->x3:F

    sub-float/2addr v4, v2

    mul-float v4, v4, v1

    add-float/2addr v3, v4

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->y1:F

    iget v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->y2:F

    sub-float/2addr v4, v2

    mul-float v4, v4, v0

    add-float/2addr v4, v2

    iget v5, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->y3:F

    sub-float/2addr v5, v2

    mul-float v5, v5, v1

    add-float/2addr v4, v5

    iget v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->z1:F

    iget v5, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->z2:F

    sub-float/2addr v5, v2

    mul-float v0, v0, v5

    add-float/2addr v0, v2

    iget v5, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/MeshSpawnShapeValue$Triangle;->z3:F

    sub-float/2addr v5, v2

    mul-float v1, v1, v5

    add-float/2addr v0, v1

    invoke-virtual {p1, v3, v4, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method
