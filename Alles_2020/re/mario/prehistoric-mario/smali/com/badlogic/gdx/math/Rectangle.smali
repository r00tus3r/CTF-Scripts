.class public Lcom/badlogic/gdx/math/Rectangle;
.super Ljava/lang/Object;
.source "Rectangle.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lcom/badlogic/gdx/math/Shape2D;


# static fields
.field private static final serialVersionUID:J = 0x4f909a54ea199076L

.field public static final tmp:Lcom/badlogic/gdx/math/Rectangle;

.field public static final tmp2:Lcom/badlogic/gdx/math/Rectangle;


# instance fields
.field public height:F

.field public width:F

.field public x:F

.field public y:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Rectangle;->tmp:Lcom/badlogic/gdx/math/Rectangle;

    .line 29
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Rectangle;->tmp2:Lcom/badlogic/gdx/math/Rectangle;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 47
    iput p2, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 48
    iput p3, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 49
    iput p4, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Rectangle;)V
    .locals 1

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iget v0, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iput v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 56
    iget v0, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iput v0, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 57
    iget v0, p1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    iput v0, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 58
    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-void
.end method


# virtual methods
.method public area()F
    .locals 2

    .line 401
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    mul-float v0, v0, v1

    return v0
.end method

.method public contains(FF)Z
    .locals 2

    .line 189
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    cmpg-float v1, v0, p1

    if-gtz v1, :cond_0

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v0, v1

    cmpl-float p1, v0, p1

    if-ltz p1, :cond_0

    iget p1, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    cmpg-float v0, p1, p2

    if-gtz v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr p1, v0

    cmpl-float p1, p1, p2

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public contains(Lcom/badlogic/gdx/math/Circle;)Z
    .locals 3

    .line 201
    iget v0, p1, Lcom/badlogic/gdx/math/Circle;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Circle;->radius:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/badlogic/gdx/math/Circle;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Circle;->radius:F

    add-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v1, v2

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    iget v0, p1, Lcom/badlogic/gdx/math/Circle;->y:F

    iget v1, p1, Lcom/badlogic/gdx/math/Circle;->radius:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/badlogic/gdx/math/Circle;->y:F

    iget p1, p1, Lcom/badlogic/gdx/math/Circle;->radius:F

    add-float/2addr v0, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr p1, v1

    cmpg-float p1, v0, p1

    if-gtz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public contains(Lcom/badlogic/gdx/math/Rectangle;)Z
    .locals 6

    .line 208
    iget v0, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 209
    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v1, v0

    .line 211
    iget v2, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 212
    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr p1, v2

    .line 214
    iget v3, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    cmpl-float v4, v0, v3

    if-lez v4, :cond_0

    iget v4, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float v5, v3, v4

    cmpg-float v0, v0, v5

    if-gez v0, :cond_0

    cmpl-float v0, v1, v3

    if-lez v0, :cond_0

    add-float/2addr v3, v4

    cmpg-float v0, v1, v3

    if-gez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    cmpl-float v1, v2, v0

    if-lez v1, :cond_0

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float v3, v0, v1

    cmpg-float v2, v2, v3

    if-gez v2, :cond_0

    cmpl-float v2, p1, v0

    if-lez v2, :cond_0

    add-float/2addr v0, v1

    cmpg-float p1, p1, v0

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public contains(Lcom/badlogic/gdx/math/Vector2;)Z
    .locals 1

    .line 195
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Rectangle;->contains(FF)Z

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 421
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    return v1

    .line 422
    :cond_2
    check-cast p1, Lcom/badlogic/gdx/math/Rectangle;

    .line 423
    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v2

    iget v3, p1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    invoke-static {v3}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v3

    if-eq v2, v3, :cond_3

    return v1

    .line 424
    :cond_3
    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v2

    iget v3, p1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    invoke-static {v3}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v3

    if-eq v2, v3, :cond_4

    return v1

    .line 425
    :cond_4
    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v2

    iget v3, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    invoke-static {v3}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v3

    if-eq v2, v3, :cond_5

    return v1

    .line 426
    :cond_5
    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v2

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    invoke-static {p1}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result p1

    if-eq v2, p1, :cond_6

    return v1

    :cond_6
    return v0
.end method

.method public fitInside(Lcom/badlogic/gdx/math/Rectangle;)Lcom/badlogic/gdx/math/Rectangle;
    .locals 3

    .line 358
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Rectangle;->getAspectRatio()F

    move-result v0

    .line 360
    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Rectangle;->getAspectRatio()F

    move-result v1

    cmpg-float v1, v0, v1

    if-gez v1, :cond_0

    .line 362
    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/math/Rectangle;->setSize(FF)Lcom/badlogic/gdx/math/Rectangle;

    goto :goto_0

    .line 365
    :cond_0
    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    div-float v0, v1, v0

    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/math/Rectangle;->setSize(FF)Lcom/badlogic/gdx/math/Rectangle;

    .line 368
    :goto_0
    iget v0, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    div-float/2addr p1, v2

    add-float/2addr v1, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    div-float/2addr p1, v2

    sub-float/2addr v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/math/Rectangle;->setPosition(FF)Lcom/badlogic/gdx/math/Rectangle;

    return-object p0
.end method

.method public fitOutside(Lcom/badlogic/gdx/math/Rectangle;)Lcom/badlogic/gdx/math/Rectangle;
    .locals 3

    .line 338
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Rectangle;->getAspectRatio()F

    move-result v0

    .line 340
    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Rectangle;->getAspectRatio()F

    move-result v1

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    .line 342
    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/math/Rectangle;->setSize(FF)Lcom/badlogic/gdx/math/Rectangle;

    goto :goto_0

    .line 345
    :cond_0
    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    div-float v0, v1, v0

    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/math/Rectangle;->setSize(FF)Lcom/badlogic/gdx/math/Rectangle;

    .line 348
    :goto_0
    iget v0, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    div-float/2addr p1, v2

    add-float/2addr v1, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    div-float/2addr p1, v2

    sub-float/2addr v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/math/Rectangle;->setPosition(FF)Lcom/badlogic/gdx/math/Rectangle;

    return-object p0
.end method

.method public fromString(Ljava/lang/String;)Lcom/badlogic/gdx/math/Rectangle;
    .locals 8

    const/16 v0, 0x2c

    const/4 v1, 0x1

    .line 383
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    add-int/lit8 v3, v2, 0x1

    .line 384
    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    add-int/lit8 v5, v4, 0x1

    .line 385
    invoke-virtual {p1, v0, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    const/4 v6, -0x1

    if-eq v2, v6, :cond_0

    if-eq v4, v6, :cond_0

    if-eq v0, v6, :cond_0

    const/4 v6, 0x0

    .line 386
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x5b

    if-ne v6, v7, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v1

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x5d

    if-ne v6, v7, :cond_0

    .line 388
    :try_start_0
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    .line 389
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    .line 390
    invoke-virtual {p1, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    add-int/2addr v0, v1

    .line 391
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v1

    invoke-virtual {p1, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .line 392
    invoke-virtual {p0, v2, v3, v4, v0}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 397
    :catch_0
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Malformed Rectangle: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAspectRatio()F
    .locals 2

    .line 303
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-nez v1, :cond_0

    const/high16 v0, 0x7fc00000    # Float.NaN

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    div-float v0, v1, v0

    :goto_0
    return v0
.end method

.method public getCenter(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 3

    .line 310
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 311
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-object p1
.end method

.method public getHeight()F
    .locals 1

    .line 119
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return v0
.end method

.method public getPosition(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 2

    .line 134
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    return-object p1
.end method

.method public getSize(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 2

    .line 182
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    return-object p1
.end method

.method public getWidth()F
    .locals 1

    .line 105
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    return v0
.end method

.method public getX()F
    .locals 1

    .line 77
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 91
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 411
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    invoke-static {v0}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v0

    const/16 v1, 0x1f

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 412
    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 413
    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 414
    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    invoke-static {v1}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public merge(FF)Lcom/badlogic/gdx/math/Rectangle;
    .locals 3

    .line 258
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 259
    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v1, v2

    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 260
    iput v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr p1, v0

    .line 261
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 263
    iget p1, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 264
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v0, v1

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    .line 265
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr p2, p1

    .line 266
    iput p2, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-object p0
.end method

.method public merge(Lcom/badlogic/gdx/math/Rectangle;)Lcom/badlogic/gdx/math/Rectangle;
    .locals 4

    .line 240
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 241
    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v1, v2

    iget v2, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v3, p1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 242
    iput v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr v1, v0

    .line 243
    iput v1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 245
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 246
    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v1, v2

    iget v2, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v2, p1

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 247
    iput v0, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr p1, v0

    .line 248
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-object p0
.end method

.method public merge(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Rectangle;
    .locals 1

    .line 275
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Rectangle;->merge(FF)Lcom/badlogic/gdx/math/Rectangle;

    move-result-object p1

    return-object p1
.end method

.method public merge([Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Rectangle;
    .locals 7

    .line 282
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 283
    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v1, v0

    .line 284
    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 285
    iget v3, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v3, v2

    const/4 v4, 0x0

    .line 286
    :goto_0
    array-length v5, p1

    if-ge v4, v5, :cond_0

    .line 287
    aget-object v5, p1, v4

    .line 288
    iget v6, v5, Lcom/badlogic/gdx/math/Vector2;->x:F

    invoke-static {v0, v6}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 289
    iget v6, v5, Lcom/badlogic/gdx/math/Vector2;->x:F

    invoke-static {v1, v6}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 290
    iget v6, v5, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-static {v2, v6}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 291
    iget v5, v5, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-static {v3, v5}, Ljava/lang/Math;->max(FF)F

    move-result v3

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 293
    :cond_0
    iput v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr v1, v0

    .line 294
    iput v1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 295
    iput v2, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v3, v2

    .line 296
    iput v3, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-object p0
.end method

.method public overlaps(Lcom/badlogic/gdx/math/Rectangle;)Z
    .locals 3

    .line 221
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v2, v1

    cmpg-float v2, v0, v2

    if-gez v2, :cond_0

    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v0, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget v1, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr p1, v1

    cmpg-float p1, v0, p1

    if-gez p1, :cond_0

    iget p1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v0, p1

    cmpl-float p1, v0, v1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public perimeter()F
    .locals 2

    .line 405
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v0, v0, v1

    return v0
.end method

.method public set(FFFF)Lcom/badlogic/gdx/math/Rectangle;
    .locals 0

    .line 67
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 68
    iput p2, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 69
    iput p3, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 70
    iput p4, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/math/Rectangle;)Lcom/badlogic/gdx/math/Rectangle;
    .locals 1

    .line 228
    iget v0, p1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iput v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 229
    iget v0, p1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iput v0, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 230
    iget v0, p1, Lcom/badlogic/gdx/math/Rectangle;->width:F

    iput v0, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 231
    iget p1, p1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-object p0
.end method

.method public setCenter(FF)Lcom/badlogic/gdx/math/Rectangle;
    .locals 2

    .line 320
    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    div-float/2addr v0, v1

    sub-float/2addr p2, v0

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Rectangle;->setPosition(FF)Lcom/badlogic/gdx/math/Rectangle;

    return-object p0
.end method

.method public setCenter(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Rectangle;
    .locals 3

    .line 328
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    div-float/2addr v1, v2

    sub-float/2addr p1, v1

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Rectangle;->setPosition(FF)Lcom/badlogic/gdx/math/Rectangle;

    return-object p0
.end method

.method public setHeight(F)Lcom/badlogic/gdx/math/Rectangle;
    .locals 0

    .line 126
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-object p0
.end method

.method public setPosition(FF)Lcom/badlogic/gdx/math/Rectangle;
    .locals 0

    .line 152
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 153
    iput p2, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    return-object p0
.end method

.method public setPosition(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Rectangle;
    .locals 1

    .line 141
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput v0, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 142
    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    return-object p0
.end method

.method public setSize(F)Lcom/badlogic/gdx/math/Rectangle;
    .locals 0

    .line 173
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 174
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-object p0
.end method

.method public setSize(FF)Lcom/badlogic/gdx/math/Rectangle;
    .locals 0

    .line 163
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    .line 164
    iput p2, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    return-object p0
.end method

.method public setWidth(F)Lcom/badlogic/gdx/math/Rectangle;
    .locals 0

    .line 112
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    return-object p0
.end method

.method public setX(F)Lcom/badlogic/gdx/math/Rectangle;
    .locals 0

    .line 84
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    return-object p0
.end method

.method public setY(F)Lcom/badlogic/gdx/math/Rectangle;
    .locals 0

    .line 98
    iput p1, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 375
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/math/Rectangle;->width:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/Rectangle;->height:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
