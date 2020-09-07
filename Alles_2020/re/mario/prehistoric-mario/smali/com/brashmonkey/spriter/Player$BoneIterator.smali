.class Lcom/brashmonkey/spriter/Player$BoneIterator;
.super Ljava/lang/Object;
.source "Player.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Player;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BoneIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/brashmonkey/spriter/Timeline$Key$Bone;",
        ">;"
    }
.end annotation


# instance fields
.field index:I

.field final synthetic this$0:Lcom/brashmonkey/spriter/Player;


# direct methods
.method constructor <init>(Lcom/brashmonkey/spriter/Player;)V
    .locals 0

    .line 997
    iput-object p1, p0, Lcom/brashmonkey/spriter/Player$BoneIterator;->this$0:Lcom/brashmonkey/spriter/Player;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 998
    iput p1, p0, Lcom/brashmonkey/spriter/Player$BoneIterator;->index:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 1001
    iget v0, p0, Lcom/brashmonkey/spriter/Player$BoneIterator;->index:I

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player$BoneIterator;->this$0:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v1

    iget-object v1, v1, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Lcom/brashmonkey/spriter/Timeline$Key$Bone;
    .locals 4

    .line 1006
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player$BoneIterator;->this$0:Lcom/brashmonkey/spriter/Player;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player$BoneIterator;->this$0:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v1

    iget-object v1, v1, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    iget v2, p0, Lcom/brashmonkey/spriter/Player$BoneIterator;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/brashmonkey/spriter/Player$BoneIterator;->index:I

    aget-object v1, v1, v2

    iget v1, v1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 997
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player$BoneIterator;->next()Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 1011
    new-instance v0, Lcom/brashmonkey/spriter/SpriterException;

    const-string v1, "remove() is not supported by this iterator!"

    invoke-direct {v0, v1}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
