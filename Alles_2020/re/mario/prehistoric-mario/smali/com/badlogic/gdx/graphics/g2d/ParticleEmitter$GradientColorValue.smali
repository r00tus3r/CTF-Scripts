.class public Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;
.super Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;
.source "ParticleEmitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GradientColorValue"
.end annotation


# static fields
.field private static temp:[F


# instance fields
.field private colors:[F

.field timeline:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x4

    .line 1570
    new-array v0, v0, [F

    sput-object v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->temp:[F

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1575
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;-><init>()V

    const/4 v0, 0x3

    .line 1572
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    const/4 v0, 0x1

    .line 1573
    new-array v1, v0, [F

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput v3, v1, v2

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    .line 1576
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->alwaysActive:Z

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public getColor(F)[F
    .locals 12

    .line 1599
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    .line 1600
    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    :goto_0
    const/4 v6, -0x1

    if-ge v4, v1, :cond_1

    .line 1602
    aget v7, v0, v4

    cmpl-float v7, v7, p1

    if-lez v7, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v5, v4, 0x1

    move v11, v5

    move v5, v4

    move v4, v11

    goto :goto_0

    :cond_1
    const/4 v4, -0x1

    .line 1609
    :goto_1
    aget v1, v0, v5

    mul-int/lit8 v5, v5, 0x3

    .line 1611
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    aget v8, v7, v5

    add-int/lit8 v9, v5, 0x1

    .line 1612
    aget v9, v7, v9

    const/4 v10, 0x2

    add-int/2addr v5, v10

    .line 1613
    aget v5, v7, v5

    if-ne v4, v6, :cond_2

    .line 1615
    sget-object p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->temp:[F

    aput v8, p1, v2

    .line 1616
    aput v9, p1, v3

    .line 1617
    aput v5, p1, v10

    return-object p1

    :cond_2
    sub-float/2addr p1, v1

    .line 1620
    aget v0, v0, v4

    sub-float/2addr v0, v1

    div-float/2addr p1, v0

    mul-int/lit8 v4, v4, 0x3

    .line 1622
    sget-object v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->temp:[F

    aget v1, v7, v4

    sub-float/2addr v1, v8

    mul-float v1, v1, p1

    add-float/2addr v8, v1

    aput v8, v0, v2

    add-int/lit8 v1, v4, 0x1

    .line 1623
    aget v1, v7, v1

    sub-float/2addr v1, v9

    mul-float v1, v1, p1

    add-float/2addr v9, v1

    aput v9, v0, v3

    add-int/2addr v4, v10

    .line 1624
    aget v1, v7, v4

    sub-float/2addr v1, v5

    mul-float v1, v1, p1

    add-float/2addr v5, v1

    aput v5, v0, v10

    return-object v0
.end method

.method public getColors()[F
    .locals 1

    .line 1589
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    return-object v0
.end method

.method public getTimeline()[F
    .locals 1

    .line 1580
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    return-object v0
.end method

.method public load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;)V
    .locals 4

    .line 1651
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;)V

    .line 1652
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    array-length v0, v0

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    .line 1653
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    array-length v2, v1

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1654
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    array-length v0, v0

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    .line 1655
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    array-length v1, v0

    invoke-static {p1, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public load(Ljava/io/BufferedReader;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1640
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;->load(Ljava/io/BufferedReader;)V

    .line 1641
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->active:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "colorsCount"

    .line 1642
    invoke-static {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readInt(Ljava/io/BufferedReader;Ljava/lang/String;)I

    move-result v0

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1643
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 1644
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "colors"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readFloat(Ljava/io/BufferedReader;Ljava/lang/String;)F

    move-result v3

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const-string v1, "timelineCount"

    .line 1645
    invoke-static {p1, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readInt(Ljava/io/BufferedReader;Ljava/lang/String;)I

    move-result v1

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    .line 1646
    :goto_1
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 1647
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "timeline"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readFloat(Ljava/io/BufferedReader;Ljava/lang/String;)F

    move-result v2

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method public save(Ljava/io/Writer;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1629
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;->save(Ljava/io/Writer;)V

    .line 1630
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->active:Z

    if-nez v0, :cond_0

    return-void

    .line 1631
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "colorsCount: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 1632
    :goto_0
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    array-length v3, v3

    const-string v4, ": "

    if-ge v2, v3, :cond_1

    .line 1633
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "colors"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    aget v4, v4, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1634
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "timelineCount: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    array-length v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1635
    :goto_1
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    array-length v2, v2

    if-ge v0, v2, :cond_2

    .line 1636
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "timeline"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    aget v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method public setColors([F)V
    .locals 0

    .line 1594
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->colors:[F

    return-void
.end method

.method public setTimeline([F)V
    .locals 0

    .line 1584
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    return-void
.end method
