.class public Lcom/brashmonkey/spriter/Timeline;
.super Ljava/lang/Object;
.source "Timeline.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/brashmonkey/spriter/Timeline$Key;
    }
.end annotation


# instance fields
.field public final id:I

.field private keyPointer:I

.field public final keys:[Lcom/brashmonkey/spriter/Timeline$Key;

.field public final name:Ljava/lang/String;

.field public final objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;


# direct methods
.method constructor <init>(ILjava/lang/String;Lcom/brashmonkey/spriter/Entity$ObjectInfo;I)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/brashmonkey/spriter/Timeline;->keyPointer:I

    .line 20
    iput p1, p0, Lcom/brashmonkey/spriter/Timeline;->id:I

    .line 21
    iput-object p2, p0, Lcom/brashmonkey/spriter/Timeline;->name:Ljava/lang/String;

    .line 22
    iput-object p3, p0, Lcom/brashmonkey/spriter/Timeline;->objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    .line 23
    new-array p1, p4, [Lcom/brashmonkey/spriter/Timeline$Key;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Timeline;->keys:[Lcom/brashmonkey/spriter/Timeline$Key;

    return-void
.end method


# virtual methods
.method addKey(Lcom/brashmonkey/spriter/Timeline$Key;)V
    .locals 3

    .line 27
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline;->keys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v1, p0, Lcom/brashmonkey/spriter/Timeline;->keyPointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/brashmonkey/spriter/Timeline;->keyPointer:I

    aput-object p1, v0, v1

    return-void
.end method

.method public getKey(I)Lcom/brashmonkey/spriter/Timeline$Key;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/brashmonkey/spriter/Timeline;->keys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|[id:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Timeline;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", name: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", object_info: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline;->objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 42
    iget-object v1, p0, Lcom/brashmonkey/spriter/Timeline;->keys:[Lcom/brashmonkey/spriter/Timeline$Key;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 43
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 44
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "]"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
