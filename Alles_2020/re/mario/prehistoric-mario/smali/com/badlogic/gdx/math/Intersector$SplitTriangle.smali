.class public Lcom/badlogic/gdx/math/Intersector$SplitTriangle;
.super Ljava/lang/Object;
.source "Intersector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/math/Intersector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SplitTriangle"
.end annotation


# instance fields
.field public back:[F

.field backOffset:I

.field edgeSplit:[F

.field public front:[F

.field frontCurrent:Z

.field frontOffset:I

.field public numBack:I

.field public numFront:I

.field public total:I


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1301
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 1295
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->frontCurrent:Z

    .line 1296
    iput v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->frontOffset:I

    .line 1297
    iput v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->backOffset:I

    mul-int/lit8 v0, p1, 0x3

    mul-int/lit8 v0, v0, 0x2

    .line 1302
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->front:[F

    .line 1303
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->back:[F

    .line 1304
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->edgeSplit:[F

    return-void
.end method


# virtual methods
.method add([FII)V
    .locals 2

    .line 1322
    iget-boolean v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->frontCurrent:Z

    if-eqz v0, :cond_0

    .line 1323
    iget-object v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->front:[F

    iget v1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->frontOffset:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1324
    iget p1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->frontOffset:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->frontOffset:I

    goto :goto_0

    .line 1326
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->back:[F

    iget v1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->backOffset:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1327
    iget p1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->backOffset:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->backOffset:I

    :goto_0
    return-void
.end method

.method getSide()Z
    .locals 1

    .line 1318
    iget-boolean v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->frontCurrent:Z

    return v0
.end method

.method reset()V
    .locals 1

    const/4 v0, 0x0

    .line 1332
    iput-boolean v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->frontCurrent:Z

    .line 1333
    iput v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->frontOffset:I

    .line 1334
    iput v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->backOffset:I

    .line 1335
    iput v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->numFront:I

    .line 1336
    iput v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->numBack:I

    .line 1337
    iput v0, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->total:I

    return-void
.end method

.method setSide(Z)V
    .locals 0

    .line 1314
    iput-boolean p1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->frontCurrent:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1309
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SplitTriangle [front="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->front:[F

    invoke-static {v1}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", back="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->back:[F

    invoke-static {v1}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", numFront="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->numFront:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", numBack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->numBack:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", total="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/Intersector$SplitTriangle;->total:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
