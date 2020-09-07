.class public Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;
.super Ljava/lang/Object;
.source "Mainline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Mainline$Key;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BoneRef"
.end annotation


# instance fields
.field public final id:I

.field public final key:I

.field public final parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

.field public final timeline:I


# direct methods
.method public constructor <init>(IIILcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V
    .locals 0

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 178
    iput p1, p0, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->id:I

    .line 179
    iput p2, p0, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    .line 180
    iput p3, p0, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->key:I

    .line 181
    iput-object p4, p0, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 185
    iget-object v0, p0, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-eqz v0, :cond_0

    iget v0, v0, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->id:I

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    .line 186
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "|id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", parent:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", timeline: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", key: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->key:I

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
