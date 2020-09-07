.class Lcom/badlogic/gdx/math/MathUtils$Sin;
.super Ljava/lang/Object;
.source "MathUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/MathUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Sin"
.end annotation


# static fields
.field static final table:[F


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/16 v0, 0x4000

    .line 52
    new-array v1, v0, [F

    sput-object v1, Lcom/badlogic/gdx/math/MathUtils$Sin;->table:[F

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 56
    sget-object v3, Lcom/badlogic/gdx/math/MathUtils$Sin;->table:[F

    int-to-float v4, v2

    const/high16 v5, 0x3f000000    # 0.5f

    add-float/2addr v4, v5

    const/high16 v5, 0x46800000    # 16384.0f

    div-float/2addr v4, v5

    const v5, 0x40c90fdb

    mul-float v4, v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    aput v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    :goto_1
    const/16 v0, 0x168

    if-ge v1, v0, :cond_1

    .line 58
    sget-object v0, Lcom/badlogic/gdx/math/MathUtils$Sin;->table:[F

    int-to-float v2, v1

    const v3, 0x42360b61

    mul-float v3, v3, v2

    float-to-int v3, v3

    and-int/lit16 v3, v3, 0x3fff

    const v4, 0x3c8efa35

    mul-float v2, v2, v4

    float-to-double v4, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v2, v4

    aput v2, v0, v3

    add-int/lit8 v1, v1, 0x5a

    goto :goto_1

    :cond_1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
