.class public Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;
.super Lcom/badlogic/gdx/graphics/g3d/Attribute;
.source "DepthTestAttribute.java"


# static fields
.field public static final Alias:Ljava/lang/String; = "depthStencil"

.field protected static Mask:J

.field public static final Type:J


# instance fields
.field public depthFunc:I

.field public depthMask:Z

.field public depthRangeFar:F

.field public depthRangeNear:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "depthStencil"

    .line 27
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->Type:J

    .line 29
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->Type:J

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->Mask:J

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x203

    .line 45
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x1

    .line 53
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;-><init>(IZ)V

    return-void
.end method

.method public constructor <init>(IFF)V
    .locals 1

    const/4 v0, 0x1

    .line 61
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;-><init>(IFFZ)V

    return-void
.end method

.method public constructor <init>(IFFZ)V
    .locals 7

    .line 65
    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->Type:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;-><init>(JIFFZ)V

    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 57
    invoke-direct {p0, p1, v0, v1, p2}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;-><init>(IFFZ)V

    return-void
.end method

.method public constructor <init>(JIFFZ)V
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/Attribute;-><init>(J)V

    .line 70
    invoke-static {p1, p2}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->is(J)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 71
    iput p3, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthFunc:I

    .line 72
    iput p4, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeNear:F

    .line 73
    iput p5, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeFar:F

    .line 74
    iput-boolean p6, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthMask:Z

    return-void

    .line 70
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Invalid type specified"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;)V
    .locals 7

    .line 78
    iget-wide v1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->type:J

    iget v3, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthFunc:I

    iget v4, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeNear:F

    iget v5, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeFar:F

    iget-boolean v6, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthMask:Z

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;-><init>(JIFFZ)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    const/16 v0, 0x203

    .line 49
    invoke-direct {p0, v0, p1}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;-><init>(IZ)V

    return-void
.end method

.method public static final is(J)Z
    .locals 3

    .line 32
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->Mask:J

    and-long/2addr p0, v0

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-eqz v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public compareTo(Lcom/badlogic/gdx/graphics/g3d/Attribute;)I
    .locals 5

    .line 98
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->type:J

    iget-wide v2, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->type:J

    iget-wide v2, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    sub-long/2addr v0, v2

    long-to-int p1, v0

    return p1

    .line 99
    :cond_0
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;

    .line 100
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthFunc:I

    iget v1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthFunc:I

    if-eq v0, v1, :cond_1

    sub-int/2addr v0, v1

    return v0

    .line 101
    :cond_1
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthMask:Z

    iget-boolean v1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthMask:Z

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-eq v0, v1, :cond_3

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 102
    :cond_3
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeNear:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeNear:F

    invoke-static {v0, v1}, Lcom/badlogic/gdx/math/MathUtils;->isEqual(FF)Z

    move-result v0

    if-nez v0, :cond_5

    .line 103
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeNear:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeNear:F

    cmpg-float p1, v0, p1

    if-gez p1, :cond_4

    goto :goto_1

    :cond_4
    const/4 v2, 0x1

    :goto_1
    return v2

    .line 104
    :cond_5
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeFar:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeFar:F

    invoke-static {v0, v1}, Lcom/badlogic/gdx/math/MathUtils;->isEqual(FF)Z

    move-result v0

    if-nez v0, :cond_7

    .line 105
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeFar:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeFar:F

    cmpg-float p1, v0, p1

    if-gez p1, :cond_6

    goto :goto_2

    :cond_6
    const/4 v2, 0x1

    :goto_2
    return v2

    :cond_7
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 25
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->compareTo(Lcom/badlogic/gdx/graphics/g3d/Attribute;)I

    move-result p1

    return p1
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/Attribute;
    .locals 1

    .line 83
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;-><init>(Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;)V

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 88
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/g3d/Attribute;->hashCode()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3cb

    .line 89
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthFunc:I

    add-int/2addr v0, v1

    mul-int/lit16 v0, v0, 0x3cb

    .line 90
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeNear:F

    invoke-static {v1}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit16 v0, v0, 0x3cb

    .line 91
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeFar:F

    invoke-static {v1}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit16 v0, v0, 0x3cb

    .line 92
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthMask:Z

    add-int/2addr v0, v1

    return v0
.end method
