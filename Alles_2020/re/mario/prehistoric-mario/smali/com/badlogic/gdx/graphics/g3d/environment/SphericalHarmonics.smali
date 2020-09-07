.class public Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;
.super Ljava/lang/Object;
.source "SphericalHarmonics.java"


# static fields
.field private static final coeff:[F


# instance fields
.field public final data:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x9

    .line 24
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;->coeff:[F

    return-void

    :array_0
    .array-data 4
        0x3e906ec1
        0x3efa2a2c
        0x3efa2a2c
        0x3efa2a2c
        0x3f8bd89d
        0x3f8bd89d
        0x3f8bd89d
        0x3ea17b0f
        0x3f0bd89d
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x1b

    .line 34
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;->data:[F

    return-void
.end method

.method public constructor <init>([F)V
    .locals 2

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    array-length v0, p1

    const/16 v1, 0x1b

    if-ne v0, v1, :cond_0

    .line 39
    invoke-virtual {p1}, [F->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;->data:[F

    return-void

    .line 38
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Incorrect array size"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static final clamp(F)F
    .locals 3

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    cmpg-float v2, p0, v1

    if-gez v2, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    cmpl-float v1, p0, v0

    if-lez v1, :cond_1

    const/high16 p0, 0x3f800000    # 1.0f

    :cond_1
    :goto_0
    return p0
.end method


# virtual methods
.method public set(FFF)Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;
    .locals 3

    const/4 v0, 0x0

    .line 57
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;->data:[F

    array-length v2, v1

    if-ge v0, v2, :cond_0

    add-int/lit8 v2, v0, 0x1

    .line 58
    aput p1, v1, v0

    add-int/lit8 v0, v2, 0x1

    .line 59
    aput p2, v1, v2

    add-int/lit8 v2, v0, 0x1

    .line 60
    aput p3, v1, v0

    move v0, v2

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;
    .locals 2

    .line 53
    iget v0, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;->set(FFF)Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;

    move-result-object p1

    return-object p1
.end method

.method public set(Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;)Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;
    .locals 0

    .line 49
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;->set([F)Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;

    move-result-object p1

    return-object p1
.end method

.method public set([F)Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;
    .locals 3

    const/4 v0, 0x0

    .line 43
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SphericalHarmonics;->data:[F

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 44
    aget v2, p1, v0

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method
