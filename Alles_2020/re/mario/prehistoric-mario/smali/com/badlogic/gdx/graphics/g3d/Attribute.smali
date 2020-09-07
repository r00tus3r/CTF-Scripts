.class public abstract Lcom/badlogic/gdx/graphics/g3d/Attribute;
.super Ljava/lang/Object;
.source "Attribute.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/badlogic/gdx/graphics/g3d/Attribute;",
        ">;"
    }
.end annotation


# static fields
.field private static final types:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final type:J

.field private final typeBit:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/Attribute;->types:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method protected constructor <init>(J)V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-wide p1, p0, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    .line 62
    invoke-static {p1, p2}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/Attribute;->typeBit:I

    return-void
.end method

.method public static final getAttributeAlias(J)Ljava/lang/String;
    .locals 7

    const/4 v0, -0x1

    :goto_0
    const-wide/16 v1, 0x0

    cmp-long v3, p0, v1

    if-eqz v3, :cond_0

    add-int/lit8 v0, v0, 0x1

    const/16 v3, 0x3f

    if-ge v0, v3, :cond_0

    shr-long v3, p0, v0

    const-wide/16 v5, 0x1

    and-long/2addr v3, v5

    cmp-long v5, v3, v1

    if-nez v5, :cond_0

    goto :goto_0

    :cond_0
    if-ltz v0, :cond_1

    .line 41
    sget-object p0, Lcom/badlogic/gdx/graphics/g3d/Attribute;->types:Lcom/badlogic/gdx/utils/Array;

    iget p0, p0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, p0, :cond_1

    sget-object p0, Lcom/badlogic/gdx/graphics/g3d/Attribute;->types:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :goto_1
    return-object p0
.end method

.method public static final getAttributeType(Ljava/lang/String;)J
    .locals 3

    const/4 v0, 0x0

    .line 31
    :goto_0
    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->types:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, v1, :cond_1

    .line 32
    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->types:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    const-wide/16 v1, 0x1

    shl-long v0, v1, v0

    return-wide v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method protected static final register(Ljava/lang/String;)J
    .locals 5

    .line 49
    invoke-static {p0}, Lcom/badlogic/gdx/graphics/g3d/Attribute;->getAttributeType(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    return-wide v0

    .line 51
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/Attribute;->types:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    const-wide/16 v0, 0x1

    .line 52
    sget-object p0, Lcom/badlogic/gdx/graphics/g3d/Attribute;->types:Lcom/badlogic/gdx/utils/Array;

    iget p0, p0, Lcom/badlogic/gdx/utils/Array;->size:I

    add-int/lit8 p0, p0, -0x1

    shl-long/2addr v0, p0

    return-wide v0
.end method


# virtual methods
.method public abstract copy()Lcom/badlogic/gdx/graphics/g3d/Attribute;
.end method

.method protected equals(Lcom/badlogic/gdx/graphics/g3d/Attribute;)Z
    .locals 1

    .line 69
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g3d/Attribute;->hashCode()I

    move-result p1

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/Attribute;->hashCode()I

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    if-ne p1, p0, :cond_1

    const/4 p1, 0x1

    return p1

    .line 76
    :cond_1
    instance-of v1, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;

    if-nez v1, :cond_2

    return v0

    .line 77
    :cond_2
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;

    .line 78
    iget-wide v1, p0, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    iget-wide v3, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    cmp-long v5, v1, v3

    if-eqz v5, :cond_3

    return v0

    .line 79
    :cond_3
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/Attribute;->equals(Lcom/badlogic/gdx/graphics/g3d/Attribute;)Z

    move-result p1

    return p1
.end method

.method public hashCode()I
    .locals 1

    .line 89
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/Attribute;->typeBit:I

    mul-int/lit16 v0, v0, 0x1d41

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 84
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Attribute;->getAttributeAlias(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
