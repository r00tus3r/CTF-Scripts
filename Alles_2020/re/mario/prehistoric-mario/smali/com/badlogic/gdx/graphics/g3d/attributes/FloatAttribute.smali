.class public Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;
.super Lcom/badlogic/gdx/graphics/g3d/Attribute;
.source "FloatAttribute.java"


# static fields
.field public static final AlphaTest:J

.field public static final AlphaTestAlias:Ljava/lang/String; = "alphaTest"

.field public static final Shininess:J

.field public static final ShininessAlias:Ljava/lang/String; = "shininess"


# instance fields
.field public value:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "shininess"

    .line 25
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->Shininess:J

    const-string v0, "alphaTest"

    .line 32
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->AlphaTest:J

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/Attribute;-><init>(J)V

    return-void
.end method

.method public constructor <init>(JF)V
    .locals 0

    .line 45
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/Attribute;-><init>(J)V

    .line 46
    iput p3, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->value:F

    return-void
.end method

.method public static createAlphaTest(F)Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;
    .locals 3

    .line 35
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->AlphaTest:J

    invoke-direct {v0, v1, v2, p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;-><init>(JF)V

    return-object v0
.end method

.method public static createShininess(F)Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;
    .locals 3

    .line 28
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->Shininess:J

    invoke-direct {v0, v1, v2, p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;-><init>(JF)V

    return-object v0
.end method


# virtual methods
.method public compareTo(Lcom/badlogic/gdx/graphics/g3d/Attribute;)I
    .locals 5

    .line 63
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->type:J

    iget-wide v2, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->type:J

    iget-wide v2, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    sub-long/2addr v0, v2

    long-to-int p1, v0

    return p1

    .line 64
    :cond_0
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;

    iget p1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->value:F

    .line 65
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->value:F

    invoke-static {v0, p1}, Lcom/badlogic/gdx/math/MathUtils;->isEqual(FF)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->value:F

    cmpg-float p1, v0, p1

    if-gez p1, :cond_2

    const/4 p1, -0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    :goto_0
    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 23
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->compareTo(Lcom/badlogic/gdx/graphics/g3d/Attribute;)I

    move-result p1

    return p1
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/Attribute;
    .locals 4

    .line 51
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;

    iget-wide v1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->type:J

    iget v3, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->value:F

    invoke-direct {v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;-><init>(JF)V

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 56
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/g3d/Attribute;->hashCode()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3d1

    .line 57
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->value:F

    invoke-static {v1}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
