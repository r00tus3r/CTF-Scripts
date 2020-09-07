.class public Lcom/brashmonkey/spriter/Mainline$Key;
.super Ljava/lang/Object;
.source "Mainline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/brashmonkey/spriter/Mainline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Key"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;,
        Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;
    }
.end annotation


# instance fields
.field private bonePointer:I

.field final boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

.field public final curve:Lcom/brashmonkey/spriter/Curve;

.field public final id:I

.field private objectPointer:I

.field final objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

.field public final time:I


# direct methods
.method public constructor <init>(IILcom/brashmonkey/spriter/Curve;II)V
    .locals 1

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 69
    iput v0, p0, Lcom/brashmonkey/spriter/Mainline$Key;->bonePointer:I

    iput v0, p0, Lcom/brashmonkey/spriter/Mainline$Key;->objectPointer:I

    .line 73
    iput p1, p0, Lcom/brashmonkey/spriter/Mainline$Key;->id:I

    .line 74
    iput p2, p0, Lcom/brashmonkey/spriter/Mainline$Key;->time:I

    .line 75
    iput-object p3, p0, Lcom/brashmonkey/spriter/Mainline$Key;->curve:Lcom/brashmonkey/spriter/Curve;

    .line 76
    new-array p1, p4, [Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    .line 77
    new-array p1, p5, [Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    return-void
.end method


# virtual methods
.method public addBoneRef(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V
    .locals 3

    .line 85
    iget-object v0, p0, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    iget v1, p0, Lcom/brashmonkey/spriter/Mainline$Key;->bonePointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/brashmonkey/spriter/Mainline$Key;->bonePointer:I

    aput-object p1, v0, v1

    return-void
.end method

.method public addObjectRef(Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;)V
    .locals 3

    .line 93
    iget-object v0, p0, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    iget v1, p0, Lcom/brashmonkey/spriter/Mainline$Key;->objectPointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/brashmonkey/spriter/Mainline$Key;->objectPointer:I

    aput-object p1, v0, v1

    return-void
.end method

.method public getBoneRef(I)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;
    .locals 2

    if-ltz p1, :cond_1

    .line 102
    iget-object v0, p0, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    array-length v1, v0

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 103
    :cond_0
    aget-object p1, v0, p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getBoneRef(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;
    .locals 0

    .line 122
    iget p1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Mainline$Key;->getBoneRefTimeline(I)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    move-result-object p1

    return-object p1
.end method

.method public getBoneRefTimeline(I)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;
    .locals 5

    .line 131
    iget-object v0, p0, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 132
    iget v4, v3, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    if-ne v4, p1, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getObjectRef(I)Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;
    .locals 2

    if-ltz p1, :cond_1

    .line 112
    iget-object v0, p0, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    array-length v1, v0

    if-lt p1, v1, :cond_0

    goto :goto_0

    .line 113
    :cond_0
    aget-object p1, v0, p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getObjectRef(Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;)Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;
    .locals 0

    .line 142
    iget p1, p1, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->timeline:I

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Mainline$Key;->getObjectRefTimeline(I)Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    move-result-object p1

    return-object p1
.end method

.method public getObjectRefTimeline(I)Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;
    .locals 5

    .line 151
    iget-object v0, p0, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 152
    iget v4, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->timeline:I

    if-ne v4, p1, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|[id:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Mainline$Key;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", time: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Mainline$Key;->time:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", curve: ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Mainline$Key;->curve:Lcom/brashmonkey/spriter/Curve;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 158
    iget-object v2, p0, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    array-length v3, v2

    const/4 v4, 0x0

    move-object v5, v0

    const/4 v0, 0x0

    :goto_0
    const-string v6, "\n"

    if-ge v0, v3, :cond_0

    aget-object v7, v2, v0

    .line 159
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    array-length v2, v0

    :goto_1
    if-ge v4, v2, :cond_1

    aget-object v3, v0, v4

    .line 161
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 162
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
