.class public Lcom/brashmonkey/spriter/Timeline$Key$Object;
.super Lcom/brashmonkey/spriter/Timeline$Key$Bone;
.source "Timeline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Timeline$Key;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Object"
.end annotation


# instance fields
.field public alpha:F

.field public final ref:Lcom/brashmonkey/spriter/FileReference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 226
    new-instance v0, Lcom/brashmonkey/spriter/Point;

    invoke-direct {v0}, Lcom/brashmonkey/spriter/Point;-><init>()V

    invoke-direct {p0, v0}, Lcom/brashmonkey/spriter/Timeline$Key$Object;-><init>(Lcom/brashmonkey/spriter/Point;)V

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Point;)V
    .locals 7

    .line 218
    new-instance v2, Lcom/brashmonkey/spriter/Point;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {v2, v0, v0}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    new-instance v3, Lcom/brashmonkey/spriter/Point;

    const/4 v1, 0x0

    invoke-direct {v3, v1, v0}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    new-instance v6, Lcom/brashmonkey/spriter/FileReference;

    const/4 v0, -0x1

    invoke-direct {v6, v0, v0}, Lcom/brashmonkey/spriter/FileReference;-><init>(II)V

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/brashmonkey/spriter/Timeline$Key$Object;-><init>(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FFLcom/brashmonkey/spriter/FileReference;)V

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FFLcom/brashmonkey/spriter/FileReference;)V
    .locals 0

    .line 212
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;-><init>(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;F)V

    .line 213
    iput p5, p0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    .line 214
    iput-object p6, p0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V
    .locals 8

    .line 222
    iget-object v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Point;->copy()Lcom/brashmonkey/spriter/Point;

    move-result-object v2

    iget-object v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->scale:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Point;->copy()Lcom/brashmonkey/spriter/Point;

    move-result-object v3

    iget-object v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->pivot:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Point;->copy()Lcom/brashmonkey/spriter/Point;

    move-result-object v4

    iget v5, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->angle:F

    iget v6, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    iget-object v7, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/brashmonkey/spriter/Timeline$Key$Object;-><init>(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FFLcom/brashmonkey/spriter/FileReference;)V

    return-void
.end method


# virtual methods
.method public set(FFFFFFFFII)V
    .locals 0

    .line 251
    invoke-super/range {p0 .. p7}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->set(FFFFFFF)V

    .line 252
    iput p8, p0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    .line 253
    iget-object p1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    iput p9, p1, Lcom/brashmonkey/spriter/FileReference;->folder:I

    .line 254
    iput p10, p1, Lcom/brashmonkey/spriter/FileReference;->file:I

    return-void
.end method

.method public set(Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/FileReference;)V
    .locals 12

    move-object v0, p1

    move-object v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p6

    .line 267
    iget v4, v0, Lcom/brashmonkey/spriter/Point;->x:F

    iget v5, v0, Lcom/brashmonkey/spriter/Point;->y:F

    iget v6, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget v7, v1, Lcom/brashmonkey/spriter/Point;->y:F

    iget v8, v2, Lcom/brashmonkey/spriter/Point;->x:F

    iget v9, v2, Lcom/brashmonkey/spriter/Point;->y:F

    iget v10, v3, Lcom/brashmonkey/spriter/FileReference;->folder:I

    iget v11, v3, Lcom/brashmonkey/spriter/FileReference;->file:I

    move-object v0, p0

    move v1, v4

    move v2, v5

    move v3, p2

    move v4, v6

    move v5, v7

    move v6, v8

    move v7, v9

    move/from16 v8, p5

    move v9, v10

    move v10, v11

    invoke-virtual/range {v0 .. v10}, Lcom/brashmonkey/spriter/Timeline$Key$Object;->set(FFFFFFFFII)V

    return-void
.end method

.method public set(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V
    .locals 7

    .line 234
    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v2, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->angle:F

    iget-object v3, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->scale:Lcom/brashmonkey/spriter/Point;

    iget-object v4, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v5, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    iget-object v6, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/brashmonkey/spriter/Timeline$Key$Object;->set(Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/FileReference;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 271
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", pivot: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->pivot:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", alpha: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", reference: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
