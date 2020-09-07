.class public Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;
.super Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;
.source "ParticleEmitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RangedNumericValue"
.end annotation


# instance fields
.field private lowMax:F

.field private lowMin:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1294
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;-><init>()V

    return-void
.end method


# virtual methods
.method public getLowMax()F
    .locals 1

    .line 1320
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    return v0
.end method

.method public getLowMin()F
    .locals 1

    .line 1312
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    return v0
.end method

.method public load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;)V
    .locals 1

    .line 1353
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;)V

    .line 1354
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    .line 1355
    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    return-void
.end method

.method public load(Ljava/io/BufferedReader;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1346
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;->load(Ljava/io/BufferedReader;)V

    .line 1347
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->active:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "lowMin"

    .line 1348
    invoke-static {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readFloat(Ljava/io/BufferedReader;Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    const-string v0, "lowMax"

    .line 1349
    invoke-static {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readFloat(Ljava/io/BufferedReader;Ljava/lang/String;)F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    return-void
.end method

.method public newLowValue()F
    .locals 3

    .line 1298
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    sub-float/2addr v1, v0

    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v2

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public save(Ljava/io/Writer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1339
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;->save(Ljava/io/Writer;)V

    .line 1340
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->active:Z

    if-nez v0, :cond_0

    return-void

    .line 1341
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "lowMin: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1342
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "lowMax: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    return-void
.end method

.method public scale(F)V
    .locals 1

    .line 1329
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    .line 1330
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    return-void
.end method

.method public set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;)V
    .locals 1

    .line 1334
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    .line 1335
    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    return-void
.end method

.method public setLow(F)V
    .locals 0

    .line 1302
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    .line 1303
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    return-void
.end method

.method public setLow(FF)V
    .locals 0

    .line 1307
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    .line 1308
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    return-void
.end method

.method public setLowMax(F)V
    .locals 0

    .line 1324
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMax:F

    return-void
.end method

.method public setLowMin(F)V
    .locals 0

    .line 1316
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->lowMin:F

    return-void
.end method
