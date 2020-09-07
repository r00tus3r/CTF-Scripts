.class public Lcom/badlogic/gdx/math/Frustum;
.super Ljava/lang/Object;
.source "Frustum.java"


# static fields
.field protected static final clipSpacePlanePoints:[Lcom/badlogic/gdx/math/Vector3;

.field protected static final clipSpacePlanePointsArray:[F

.field private static final tmpV:Lcom/badlogic/gdx/math/Vector3;


# instance fields
.field public final planePoints:[Lcom/badlogic/gdx/math/Vector3;

.field protected final planePointsArray:[F

.field public final planes:[Lcom/badlogic/gdx/math/Plane;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/16 v0, 0x8

    .line 28
    new-array v0, v0, [Lcom/badlogic/gdx/math/Vector3;

    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    const/high16 v2, -0x40800000    # -1.0f

    invoke-direct {v1, v2, v2, v2}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    const/4 v3, 0x0

    aput-object v1, v0, v3

    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v4, v2, v2}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    const/4 v5, 0x1

    aput-object v1, v0, v5

    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v1, v4, v4, v2}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    const/4 v5, 0x2

    aput-object v1, v0, v5

    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v1, v2, v4, v2}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    const/4 v5, 0x3

    aput-object v1, v0, v5

    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v1, v2, v2, v4}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    const/4 v5, 0x4

    aput-object v1, v0, v5

    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v1, v4, v2, v4}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    const/4 v5, 0x5

    aput-object v1, v0, v5

    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v1, v4, v4, v4}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    const/4 v5, 0x6

    aput-object v1, v0, v5

    new-instance v1, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v1, v2, v4, v4}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sput-object v0, Lcom/badlogic/gdx/math/Frustum;->clipSpacePlanePoints:[Lcom/badlogic/gdx/math/Vector3;

    const/16 v0, 0x18

    .line 31
    new-array v0, v0, [F

    sput-object v0, Lcom/badlogic/gdx/math/Frustum;->clipSpacePlanePointsArray:[F

    .line 35
    sget-object v0, Lcom/badlogic/gdx/math/Frustum;->clipSpacePlanePoints:[Lcom/badlogic/gdx/math/Vector3;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, v0, v3

    .line 36
    sget-object v5, Lcom/badlogic/gdx/math/Frustum;->clipSpacePlanePointsArray:[F

    add-int/lit8 v6, v2, 0x1

    iget v7, v4, Lcom/badlogic/gdx/math/Vector3;->x:F

    aput v7, v5, v2

    .line 37
    sget-object v2, Lcom/badlogic/gdx/math/Frustum;->clipSpacePlanePointsArray:[F

    add-int/lit8 v5, v6, 0x1

    iget v7, v4, Lcom/badlogic/gdx/math/Vector3;->y:F

    aput v7, v2, v6

    .line 38
    sget-object v2, Lcom/badlogic/gdx/math/Frustum;->clipSpacePlanePointsArray:[F

    add-int/lit8 v6, v5, 0x1

    iget v4, v4, Lcom/badlogic/gdx/math/Vector3;->z:F

    aput v4, v2, v5

    add-int/lit8 v3, v3, 0x1

    move v2, v6

    goto :goto_0

    .line 42
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Frustum;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x6

    .line 45
    new-array v1, v0, [Lcom/badlogic/gdx/math/Plane;

    iput-object v1, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    const/16 v1, 0x8

    .line 48
    new-array v1, v1, [Lcom/badlogic/gdx/math/Vector3;

    new-instance v2, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    const/4 v4, 0x1

    aput-object v2, v1, v4

    new-instance v2, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    const/4 v4, 0x2

    aput-object v2, v1, v4

    new-instance v2, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    const/4 v4, 0x3

    aput-object v2, v1, v4

    new-instance v2, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    const/4 v4, 0x4

    aput-object v2, v1, v4

    new-instance v2, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    const/4 v4, 0x5

    aput-object v2, v1, v4

    new-instance v2, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    aput-object v2, v1, v0

    new-instance v2, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    const/4 v4, 0x7

    aput-object v2, v1, v4

    iput-object v1, p0, Lcom/badlogic/gdx/math/Frustum;->planePoints:[Lcom/badlogic/gdx/math/Vector3;

    const/16 v1, 0x18

    .line 50
    new-array v1, v1, [F

    iput-object v1, p0, Lcom/badlogic/gdx/math/Frustum;->planePointsArray:[F

    :goto_0
    if-ge v3, v0, :cond_0

    .line 54
    iget-object v1, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    new-instance v2, Lcom/badlogic/gdx/math/Plane;

    new-instance v4, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v4}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    const/4 v5, 0x0

    invoke-direct {v2, v4, v5}, Lcom/badlogic/gdx/math/Plane;-><init>(Lcom/badlogic/gdx/math/Vector3;F)V

    aput-object v2, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public boundsInFrustum(FFFFFF)Z
    .locals 11

    move-object v0, p0

    .line 184
    iget-object v1, v0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    array-length v1, v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_8

    .line 185
    iget-object v4, v0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v4, v4, v3

    add-float v5, p1, p4

    add-float v6, p2, p5

    add-float v7, p3, p6

    invoke-virtual {v4, v5, v6, v7}, Lcom/badlogic/gdx/math/Plane;->testPoint(FFF)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v4

    sget-object v8, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v4, v8, :cond_0

    goto :goto_1

    .line 186
    :cond_0
    iget-object v4, v0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v4, v4, v3

    sub-float v8, p3, p6

    invoke-virtual {v4, v5, v6, v8}, Lcom/badlogic/gdx/math/Plane;->testPoint(FFF)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v4

    sget-object v9, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v4, v9, :cond_1

    goto :goto_1

    .line 187
    :cond_1
    iget-object v4, v0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v4, v4, v3

    sub-float v9, p2, p5

    invoke-virtual {v4, v5, v9, v7}, Lcom/badlogic/gdx/math/Plane;->testPoint(FFF)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v4

    sget-object v10, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v4, v10, :cond_2

    goto :goto_1

    .line 188
    :cond_2
    iget-object v4, v0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v4, v4, v3

    invoke-virtual {v4, v5, v9, v8}, Lcom/badlogic/gdx/math/Plane;->testPoint(FFF)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v4

    sget-object v5, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v4, v5, :cond_3

    goto :goto_1

    .line 189
    :cond_3
    iget-object v4, v0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v4, v4, v3

    sub-float v5, p1, p4

    invoke-virtual {v4, v5, v6, v7}, Lcom/badlogic/gdx/math/Plane;->testPoint(FFF)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v4

    sget-object v10, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v4, v10, :cond_4

    goto :goto_1

    .line 190
    :cond_4
    iget-object v4, v0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v4, v4, v3

    invoke-virtual {v4, v5, v6, v8}, Lcom/badlogic/gdx/math/Plane;->testPoint(FFF)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v4

    sget-object v6, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v4, v6, :cond_5

    goto :goto_1

    .line 191
    :cond_5
    iget-object v4, v0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v4, v4, v3

    invoke-virtual {v4, v5, v9, v7}, Lcom/badlogic/gdx/math/Plane;->testPoint(FFF)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v4

    sget-object v6, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v4, v6, :cond_6

    goto :goto_1

    .line 192
    :cond_6
    iget-object v4, v0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v4, v4, v3

    invoke-virtual {v4, v5, v9, v8}, Lcom/badlogic/gdx/math/Plane;->testPoint(FFF)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v4

    sget-object v5, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v4, v5, :cond_7

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_7
    return v2

    :cond_8
    const/4 v1, 0x1

    return v1
.end method

.method public boundsInFrustum(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Z
    .locals 7

    .line 178
    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget p1, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/high16 v0, 0x40000000    # 2.0f

    div-float v4, p1, v0

    iget p1, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    div-float v5, p1, v0

    iget p1, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    div-float v6, p1, v0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/math/Frustum;->boundsInFrustum(FFFFFF)Z

    move-result p1

    return p1
.end method

.method public boundsInFrustum(Lcom/badlogic/gdx/math/collision/BoundingBox;)Z
    .locals 5

    .line 160
    iget-object v0, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    array-length v0, v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_8

    .line 161
    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v2

    sget-object v4, Lcom/badlogic/gdx/math/Frustum;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/math/collision/BoundingBox;->getCorner000(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Plane;->testPoint(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v3

    sget-object v4, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v3, v4, :cond_0

    goto/16 :goto_1

    .line 162
    :cond_0
    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v2

    sget-object v4, Lcom/badlogic/gdx/math/Frustum;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/math/collision/BoundingBox;->getCorner001(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Plane;->testPoint(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v3

    sget-object v4, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v3, v4, :cond_1

    goto/16 :goto_1

    .line 163
    :cond_1
    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v2

    sget-object v4, Lcom/badlogic/gdx/math/Frustum;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/math/collision/BoundingBox;->getCorner010(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Plane;->testPoint(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v3

    sget-object v4, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v3, v4, :cond_2

    goto :goto_1

    .line 164
    :cond_2
    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v2

    sget-object v4, Lcom/badlogic/gdx/math/Frustum;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/math/collision/BoundingBox;->getCorner011(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Plane;->testPoint(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v3

    sget-object v4, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v3, v4, :cond_3

    goto :goto_1

    .line 165
    :cond_3
    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v2

    sget-object v4, Lcom/badlogic/gdx/math/Frustum;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/math/collision/BoundingBox;->getCorner100(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Plane;->testPoint(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v3

    sget-object v4, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v3, v4, :cond_4

    goto :goto_1

    .line 166
    :cond_4
    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v2

    sget-object v4, Lcom/badlogic/gdx/math/Frustum;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/math/collision/BoundingBox;->getCorner101(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Plane;->testPoint(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v3

    sget-object v4, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v3, v4, :cond_5

    goto :goto_1

    .line 167
    :cond_5
    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v2

    sget-object v4, Lcom/badlogic/gdx/math/Frustum;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/math/collision/BoundingBox;->getCorner110(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Plane;->testPoint(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v3

    sget-object v4, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v3, v4, :cond_6

    goto :goto_1

    .line 168
    :cond_6
    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v2

    sget-object v4, Lcom/badlogic/gdx/math/Frustum;->tmpV:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/math/collision/BoundingBox;->getCorner111(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Plane;->testPoint(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v3

    sget-object v4, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-eq v3, v4, :cond_7

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_7
    return v1

    :cond_8
    const/4 p1, 0x1

    return p1
.end method

.method public pointInFrustum(FFF)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 98
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 99
    aget-object v2, v2, v1

    invoke-virtual {v2, p1, p2, p3}, Lcom/badlogic/gdx/math/Plane;->testPoint(FFF)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v2

    .line 100
    sget-object v3, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-ne v2, v3, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public pointInFrustum(Lcom/badlogic/gdx/math/Vector3;)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 84
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 85
    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/math/Plane;->testPoint(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Plane$PlaneSide;

    move-result-object v2

    .line 86
    sget-object v3, Lcom/badlogic/gdx/math/Plane$PlaneSide;->Back:Lcom/badlogic/gdx/math/Plane$PlaneSide;

    if-ne v2, v3, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public sphereInFrustum(FFFF)Z
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x6

    if-ge v1, v2, :cond_1

    .line 126
    iget-object v2, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v2, v2, v1

    iget-object v2, v2, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v2, v2, p1

    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v3, v3, p2

    add-float/2addr v2, v3

    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v3, v3, p3

    add-float/2addr v2, v3

    neg-float v3, p4

    iget-object v4, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v4, v4, v1

    iget v4, v4, Lcom/badlogic/gdx/math/Plane;->d:F

    sub-float/2addr v3, v4

    cmpg-float v2, v2, v3

    if-gez v2, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public sphereInFrustum(Lcom/badlogic/gdx/math/Vector3;F)Z
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x6

    if-ge v1, v2, :cond_1

    .line 112
    iget-object v2, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v2, v2, v1

    iget-object v2, v2, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v2, v2, v3

    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v3, v3, v4

    add-float/2addr v2, v3

    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v3, v3, v4

    add-float/2addr v2, v3

    neg-float v3, p2

    iget-object v4, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v4, v4, v1

    iget v4, v4, Lcom/badlogic/gdx/math/Plane;->d:F

    sub-float/2addr v3, v4

    cmpg-float v2, v2, v3

    if-gez v2, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public sphereInFrustumWithoutNearFar(FFFF)Z
    .locals 4

    const/4 v0, 0x2

    :goto_0
    const/4 v1, 0x6

    if-ge v0, v1, :cond_1

    .line 151
    iget-object v1, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v1, v1, p1

    iget-object v2, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v2, v2, v0

    iget-object v2, v2, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v2, v2, p2

    add-float/2addr v1, v2

    iget-object v2, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v2, v2, v0

    iget-object v2, v2, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v2, p3

    add-float/2addr v1, v2

    neg-float v2, p4

    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v0

    iget v3, v3, Lcom/badlogic/gdx/math/Plane;->d:F

    sub-float/2addr v2, v3

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public sphereInFrustumWithoutNearFar(Lcom/badlogic/gdx/math/Vector3;F)Z
    .locals 4

    const/4 v0, 0x2

    :goto_0
    const/4 v1, 0x6

    if-ge v0, v1, :cond_1

    .line 137
    iget-object v1, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v1, v1, v2

    iget-object v2, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v2, v2, v0

    iget-object v2, v2, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    iget-object v2, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v2, v2, v0

    iget-object v2, v2, Lcom/badlogic/gdx/math/Plane;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    neg-float v2, p2

    iget-object v3, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object v3, v3, v0

    iget v3, v3, Lcom/badlogic/gdx/math/Plane;->d:F

    sub-float/2addr v2, v3

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public update(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 10

    .line 62
    sget-object v0, Lcom/badlogic/gdx/math/Frustum;->clipSpacePlanePointsArray:[F

    iget-object v1, p0, Lcom/badlogic/gdx/math/Frustum;->planePointsArray:[F

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v0, p0, Lcom/badlogic/gdx/math/Frustum;->planePointsArray:[F

    const/16 v1, 0x8

    const/4 v2, 0x3

    invoke-static {p1, v0, v3, v1, v2}, Lcom/badlogic/gdx/math/Matrix4;->prj([F[FIII)V

    const/4 p1, 0x0

    const/4 v0, 0x0

    :goto_0
    if-ge p1, v1, :cond_0

    .line 65
    iget-object v4, p0, Lcom/badlogic/gdx/math/Frustum;->planePoints:[Lcom/badlogic/gdx/math/Vector3;

    aget-object v4, v4, p1

    .line 66
    iget-object v5, p0, Lcom/badlogic/gdx/math/Frustum;->planePointsArray:[F

    add-int/lit8 v6, v0, 0x1

    aget v0, v5, v0

    iput v0, v4, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-int/lit8 v0, v6, 0x1

    .line 67
    aget v6, v5, v6

    iput v6, v4, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-int/lit8 v6, v0, 0x1

    .line 68
    aget v0, v5, v0

    iput v0, v4, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-int/lit8 p1, p1, 0x1

    move v0, v6

    goto :goto_0

    .line 71
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object p1, p1, v3

    iget-object v0, p0, Lcom/badlogic/gdx/math/Frustum;->planePoints:[Lcom/badlogic/gdx/math/Vector3;

    const/4 v1, 0x1

    aget-object v4, v0, v1

    aget-object v5, v0, v3

    const/4 v6, 0x2

    aget-object v0, v0, v6

    invoke-virtual {p1, v4, v5, v0}, Lcom/badlogic/gdx/math/Plane;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V

    .line 72
    iget-object p1, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object p1, p1, v1

    iget-object v0, p0, Lcom/badlogic/gdx/math/Frustum;->planePoints:[Lcom/badlogic/gdx/math/Vector3;

    const/4 v4, 0x4

    aget-object v5, v0, v4

    const/4 v7, 0x5

    aget-object v8, v0, v7

    const/4 v9, 0x7

    aget-object v0, v0, v9

    invoke-virtual {p1, v5, v8, v0}, Lcom/badlogic/gdx/math/Plane;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V

    .line 73
    iget-object p1, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object p1, p1, v6

    iget-object v0, p0, Lcom/badlogic/gdx/math/Frustum;->planePoints:[Lcom/badlogic/gdx/math/Vector3;

    aget-object v5, v0, v3

    aget-object v8, v0, v4

    aget-object v0, v0, v2

    invoke-virtual {p1, v5, v8, v0}, Lcom/badlogic/gdx/math/Plane;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V

    .line 74
    iget-object p1, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object p1, p1, v2

    iget-object v0, p0, Lcom/badlogic/gdx/math/Frustum;->planePoints:[Lcom/badlogic/gdx/math/Vector3;

    aget-object v5, v0, v7

    aget-object v8, v0, v1

    const/4 v9, 0x6

    aget-object v0, v0, v9

    invoke-virtual {p1, v5, v8, v0}, Lcom/badlogic/gdx/math/Plane;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V

    .line 75
    iget-object p1, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object p1, p1, v4

    iget-object v0, p0, Lcom/badlogic/gdx/math/Frustum;->planePoints:[Lcom/badlogic/gdx/math/Vector3;

    aget-object v5, v0, v6

    aget-object v2, v0, v2

    aget-object v0, v0, v9

    invoke-virtual {p1, v5, v2, v0}, Lcom/badlogic/gdx/math/Plane;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V

    .line 76
    iget-object p1, p0, Lcom/badlogic/gdx/math/Frustum;->planes:[Lcom/badlogic/gdx/math/Plane;

    aget-object p1, p1, v7

    iget-object v0, p0, Lcom/badlogic/gdx/math/Frustum;->planePoints:[Lcom/badlogic/gdx/math/Vector3;

    aget-object v2, v0, v4

    aget-object v3, v0, v3

    aget-object v0, v0, v1

    invoke-virtual {p1, v2, v3, v0}, Lcom/badlogic/gdx/math/Plane;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V

    return-void
.end method
