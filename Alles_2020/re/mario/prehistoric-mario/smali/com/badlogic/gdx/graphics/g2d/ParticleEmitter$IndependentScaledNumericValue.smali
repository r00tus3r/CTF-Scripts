.class public Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;
.super Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
.source "ParticleEmitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IndependentScaledNumericValue"
.end annotation


# instance fields
.field independent:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1506
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    return-void
.end method


# virtual methods
.method public isIndependent()Z
    .locals 1

    .line 1510
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    return v0
.end method

.method public load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;)V
    .locals 0

    .line 1564
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 1565
    iget-boolean p1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    return-void
.end method

.method public load(Ljava/io/BufferedReader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1542
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1544
    invoke-virtual {p1}, Ljava/io/BufferedReader;->markSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x64

    .line 1545
    invoke-virtual {p1, v0}, Ljava/io/BufferedReader;->mark(I)V

    .line 1546
    :cond_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    const-string v1, "independent"

    .line 1548
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1549
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    goto :goto_0

    .line 1550
    :cond_1
    invoke-virtual {p1}, Ljava/io/BufferedReader;->markSupported()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1551
    invoke-virtual {p1}, Ljava/io/BufferedReader;->reset()V

    :goto_0
    return-void

    :cond_2
    const-string p1, "The loaded particle effect descriptor file uses an old invalid format. Please download the latest version of the Particle Editor tool and recreate the file by loading and saving it again."

    .line 1558
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    const-string v1, "ParticleEmitter"

    invoke-interface {v0, v1, p1}, Lcom/badlogic/gdx/Application;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 1559
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1547
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Missing value: independent"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public save(Ljava/io/Writer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1537
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    .line 1538
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "independent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    return-void
.end method

.method public set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;)V
    .locals 0

    .line 1532
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 1533
    iget-boolean p1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    return-void
.end method

.method public set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;)V
    .locals 1

    .line 1518
    instance-of v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    if-eqz v0, :cond_0

    .line 1519
    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;)V

    goto :goto_0

    .line 1521
    :cond_0
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;)V

    :goto_0
    return-void
.end method

.method public set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V
    .locals 1

    .line 1525
    instance-of v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    if-eqz v0, :cond_0

    .line 1526
    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;)V

    goto :goto_0

    .line 1528
    :cond_0
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    :goto_0
    return-void
.end method

.method public setIndependent(Z)V
    .locals 0

    .line 1514
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    return-void
.end method
