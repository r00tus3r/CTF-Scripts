.class public Lcom/brashmonkey/spriter/Animation;
.super Ljava/lang/Object;
.source "Animation.java"


# instance fields
.field currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

.field public final id:I

.field public final length:I

.field public final looping:Z

.field public final mainline:Lcom/brashmonkey/spriter/Mainline;

.field public final name:Ljava/lang/String;

.field private final nameToTimeline:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/brashmonkey/spriter/Timeline;",
            ">;"
        }
    .end annotation
.end field

.field private prepared:Z

.field private timelinePointer:I

.field private final timelines:[Lcom/brashmonkey/spriter/Timeline;

.field tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

.field unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;


# direct methods
.method public constructor <init>(Lcom/brashmonkey/spriter/Mainline;ILjava/lang/String;IZI)V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 21
    iput v0, p0, Lcom/brashmonkey/spriter/Animation;->timelinePointer:I

    .line 31
    iput-object p1, p0, Lcom/brashmonkey/spriter/Animation;->mainline:Lcom/brashmonkey/spriter/Mainline;

    .line 32
    iput p2, p0, Lcom/brashmonkey/spriter/Animation;->id:I

    .line 33
    iput-object p3, p0, Lcom/brashmonkey/spriter/Animation;->name:Ljava/lang/String;

    .line 34
    iput p4, p0, Lcom/brashmonkey/spriter/Animation;->length:I

    .line 35
    iput-boolean p5, p0, Lcom/brashmonkey/spriter/Animation;->looping:Z

    .line 36
    new-array p1, p6, [Lcom/brashmonkey/spriter/Timeline;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Animation;->timelines:[Lcom/brashmonkey/spriter/Timeline;

    .line 37
    iput-boolean v0, p0, Lcom/brashmonkey/spriter/Animation;->prepared:Z

    .line 38
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/brashmonkey/spriter/Animation;->nameToTimeline:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method addTimeline(Lcom/brashmonkey/spriter/Timeline;)V
    .locals 3

    .line 62
    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->timelines:[Lcom/brashmonkey/spriter/Timeline;

    iget v1, p0, Lcom/brashmonkey/spriter/Animation;->timelinePointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/brashmonkey/spriter/Animation;->timelinePointer:I

    aput-object p1, v0, v1

    .line 63
    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->nameToTimeline:Ljava/util/HashMap;

    iget-object v1, p1, Lcom/brashmonkey/spriter/Timeline;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method getSimilarTimeline(Lcom/brashmonkey/spriter/Timeline;)Lcom/brashmonkey/spriter/Timeline;
    .locals 3

    .line 160
    iget-object v0, p1, Lcom/brashmonkey/spriter/Timeline;->name:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/Animation;->getTimeline(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v0

    if-nez v0, :cond_0

    .line 161
    iget v1, p1, Lcom/brashmonkey/spriter/Timeline;->id:I

    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Animation;->timelines()I

    move-result v2

    if-ge v1, v2, :cond_0

    iget p1, p1, Lcom/brashmonkey/spriter/Timeline;->id:I

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getTimeline(I)Lcom/brashmonkey/spriter/Timeline;
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->timelines:[Lcom/brashmonkey/spriter/Timeline;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getTimeline(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->nameToTimeline:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/brashmonkey/spriter/Timeline;

    return-object p1
.end method

.method public prepare()V
    .locals 6

    .line 190
    iget-boolean v0, p0, Lcom/brashmonkey/spriter/Animation;->prepared:Z

    if-eqz v0, :cond_0

    return-void

    .line 191
    :cond_0
    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->timelines:[Lcom/brashmonkey/spriter/Timeline;

    array-length v1, v0

    new-array v1, v1, [Lcom/brashmonkey/spriter/Timeline$Key;

    iput-object v1, p0, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    .line 192
    array-length v0, v0

    new-array v0, v0, [Lcom/brashmonkey/spriter/Timeline$Key;

    iput-object v0, p0, Lcom/brashmonkey/spriter/Animation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 194
    :goto_0
    iget-object v2, p0, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 195
    new-instance v3, Lcom/brashmonkey/spriter/Timeline$Key;

    invoke-direct {v3, v1}, Lcom/brashmonkey/spriter/Timeline$Key;-><init>(I)V

    aput-object v3, v2, v1

    .line 196
    iget-object v2, p0, Lcom/brashmonkey/spriter/Animation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    new-instance v3, Lcom/brashmonkey/spriter/Timeline$Key;

    invoke-direct {v3, v1}, Lcom/brashmonkey/spriter/Timeline$Key;-><init>(I)V

    aput-object v3, v2, v1

    .line 197
    iget-object v2, p0, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object v2, v2, v1

    new-instance v3, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    new-instance v4, Lcom/brashmonkey/spriter/Point;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v5}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    invoke-direct {v3, v4}, Lcom/brashmonkey/spriter/Timeline$Key$Object;-><init>(Lcom/brashmonkey/spriter/Point;)V

    invoke-virtual {v2, v3}, Lcom/brashmonkey/spriter/Timeline$Key;->setObject(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    .line 198
    iget-object v2, p0, Lcom/brashmonkey/spriter/Animation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object v2, v2, v1

    new-instance v3, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    new-instance v4, Lcom/brashmonkey/spriter/Point;

    invoke-direct {v4, v5, v5}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    invoke-direct {v3, v4}, Lcom/brashmonkey/spriter/Timeline$Key$Object;-><init>(Lcom/brashmonkey/spriter/Point;)V

    invoke-virtual {v2, v3}, Lcom/brashmonkey/spriter/Timeline$Key;->setObject(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 200
    :cond_1
    iget-object v1, p0, Lcom/brashmonkey/spriter/Animation;->mainline:Lcom/brashmonkey/spriter/Mainline;

    iget-object v1, v1, Lcom/brashmonkey/spriter/Mainline;->keys:[Lcom/brashmonkey/spriter/Mainline$Key;

    array-length v1, v1

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/brashmonkey/spriter/Animation;->mainline:Lcom/brashmonkey/spriter/Mainline;

    invoke-virtual {v1, v0}, Lcom/brashmonkey/spriter/Mainline;->getKey(I)Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v0

    iput-object v0, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    :cond_2
    const/4 v0, 0x1

    .line 201
    iput-boolean v0, p0, Lcom/brashmonkey/spriter/Animation;->prepared:Z

    return-void
.end method

.method public timelines()I
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->timelines:[Lcom/brashmonkey/spriter/Timeline;

    array-length v0, v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|[id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Animation;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Animation;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", duration: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Animation;->length:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", is looping: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/brashmonkey/spriter/Animation;->looping:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "Mainline:\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 77
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->mainline:Lcom/brashmonkey/spriter/Mainline;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 78
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "Timelines\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 79
    iget-object v1, p0, Lcom/brashmonkey/spriter/Animation;->timelines:[Lcom/brashmonkey/spriter/Timeline;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 80
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 81
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

.method protected tweenBone(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;FLcom/brashmonkey/spriter/Curve;I)V
    .locals 2

    .line 147
    iget v0, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iget v1, p2, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    invoke-virtual {p5, v0, v1, p4, p6}, Lcom/brashmonkey/spriter/Curve;->tweenAngle(FFFI)F

    move-result p6

    iput p6, p3, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    .line 148
    iget-object p6, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object v0, p2, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p3, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p5, p6, v0, p4, v1}, Lcom/brashmonkey/spriter/Curve;->tweenPoint(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;)V

    .line 149
    iget-object p6, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget-object v0, p2, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p3, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p5, p6, v0, p4, v1}, Lcom/brashmonkey/spriter/Curve;->tweenPoint(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;)V

    .line 150
    iget-object p1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    iget-object p2, p2, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    iget-object p3, p3, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->pivot:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p5, p1, p2, p4, p3}, Lcom/brashmonkey/spriter/Curve;->tweenPoint(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;)V

    return-void
.end method

.method protected tweenObject(Lcom/brashmonkey/spriter/Timeline$Key$Object;Lcom/brashmonkey/spriter/Timeline$Key$Object;Lcom/brashmonkey/spriter/Timeline$Key$Object;FLcom/brashmonkey/spriter/Curve;I)V
    .locals 0

    .line 154
    invoke-virtual/range {p0 .. p6}, Lcom/brashmonkey/spriter/Animation;->tweenBone(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;FLcom/brashmonkey/spriter/Curve;I)V

    .line 155
    iget p6, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    iget p2, p2, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    invoke-virtual {p5, p6, p2, p4}, Lcom/brashmonkey/spriter/Curve;->tweenAngle(FFF)F

    move-result p2

    iput p2, p3, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    .line 156
    iget-object p2, p3, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    iget-object p1, p1, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    invoke-virtual {p2, p1}, Lcom/brashmonkey/spriter/FileReference;->set(Lcom/brashmonkey/spriter/FileReference;)V

    return-void
.end method

.method unmapTimelineObject(IZLcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 2

    .line 139
    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v0

    .line 140
    iget-object v1, p0, Lcom/brashmonkey/spriter/Animation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object p1, v1, p1

    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object p1

    if-eqz p2, :cond_0

    .line 141
    move-object p2, p1

    check-cast p2, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    check-cast v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    invoke-virtual {p2, v0}, Lcom/brashmonkey/spriter/Timeline$Key$Object;->set(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    goto :goto_0

    .line 142
    :cond_0
    invoke-virtual {p1, v0}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->set(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    .line 143
    :goto_0
    invoke-virtual {p1, p3}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->unmap(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    return-void
.end method

.method public update(ILcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 5

    .line 91
    iget-boolean v0, p0, Lcom/brashmonkey/spriter/Animation;->prepared:Z

    if-eqz v0, :cond_4

    if-eqz p2, :cond_3

    .line 93
    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->mainline:Lcom/brashmonkey/spriter/Mainline;

    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/Mainline;->getKeyBeforeTime(I)Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v0

    iput-object v0, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    .line 95
    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, v0, v3

    .line 96
    iput-boolean v2, v4, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    array-length v1, v0

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 98
    invoke-virtual {p0, v4, p2, p1}, Lcom/brashmonkey/spriter/Animation;->update(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;Lcom/brashmonkey/spriter/Timeline$Key$Bone;I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 99
    :cond_1
    iget-object v0, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    array-length v1, v0

    :goto_2
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    .line 100
    invoke-virtual {p0, v3, p2, p1}, Lcom/brashmonkey/spriter/Animation;->update(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;Lcom/brashmonkey/spriter/Timeline$Key$Bone;I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_2
    return-void

    .line 92
    :cond_3
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string p2, "The root can not be null! Set a root bone to apply this animation relative to the root bone."

    invoke-direct {p1, p2}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 91
    :cond_4
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string p2, "This animation is not ready yet to animate itself. Please call prepare()!"

    invoke-direct {p1, p2}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method protected update(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;Lcom/brashmonkey/spriter/Timeline$Key$Bone;I)V
    .locals 12

    .line 104
    instance-of v0, p1, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    .line 106
    iget v1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    invoke-virtual {p0, v1}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v1

    .line 107
    iget v2, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->key:I

    invoke-virtual {v1, v2}, Lcom/brashmonkey/spriter/Timeline;->getKey(I)Lcom/brashmonkey/spriter/Timeline$Key;

    move-result-object v2

    .line 108
    iget v3, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->key:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iget-object v5, v1, Lcom/brashmonkey/spriter/Timeline;->keys:[Lcom/brashmonkey/spriter/Timeline$Key;

    array-length v5, v5

    rem-int/2addr v3, v5

    invoke-virtual {v1, v3}, Lcom/brashmonkey/spriter/Timeline;->getKey(I)Lcom/brashmonkey/spriter/Timeline$Key;

    move-result-object v1

    .line 109
    iget v3, v2, Lcom/brashmonkey/spriter/Timeline$Key;->time:I

    .line 110
    iget v5, v1, Lcom/brashmonkey/spriter/Timeline$Key;->time:I

    if-ge v5, v3, :cond_1

    .line 112
    iget-boolean v6, p0, Lcom/brashmonkey/spriter/Animation;->looping:Z

    if-nez v6, :cond_0

    move-object v1, v2

    goto :goto_0

    .line 113
    :cond_0
    iget v5, p0, Lcom/brashmonkey/spriter/Animation;->length:I

    :cond_1
    :goto_0
    sub-int v6, p3, v3

    int-to-float v6, v6

    sub-int v7, v5, v3

    int-to-float v7, v7

    div-float/2addr v6, v7

    .line 117
    invoke-static {v6}, Ljava/lang/Float;->isNaN(F)Z

    move-result v8

    const/high16 v9, 0x3f800000    # 1.0f

    if-nez v8, :cond_2

    invoke-static {v6}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v8

    if-eqz v8, :cond_3

    :cond_2
    const/high16 v6, 0x3f800000    # 1.0f

    .line 118
    :cond_3
    iget-object v8, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget v8, v8, Lcom/brashmonkey/spriter/Mainline$Key;->time:I

    const/4 v10, 0x0

    if-le v8, v3, :cond_8

    .line 119
    iget-object v6, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget v6, v6, Lcom/brashmonkey/spriter/Mainline$Key;->time:I

    sub-int/2addr v6, v3

    int-to-float v3, v6

    div-float/2addr v3, v7

    .line 120
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v6

    if-nez v6, :cond_4

    invoke-static {v3}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v6

    if-eqz v6, :cond_5

    :cond_4
    const/4 v3, 0x0

    .line 121
    :cond_5
    iget-object v6, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget v6, v6, Lcom/brashmonkey/spriter/Mainline$Key;->time:I

    sub-int/2addr p3, v6

    int-to-float p3, p3

    iget-object v6, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget v6, v6, Lcom/brashmonkey/spriter/Mainline$Key;->time:I

    sub-int/2addr v5, v6

    int-to-float v5, v5

    div-float/2addr p3, v5

    .line 122
    invoke-static {p3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v5

    if-nez v5, :cond_6

    invoke-static {p3}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v5

    if-eqz v5, :cond_7

    :cond_6
    const/high16 p3, 0x3f800000    # 1.0f

    .line 123
    :cond_7
    iget-object v5, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget-object v5, v5, Lcom/brashmonkey/spriter/Mainline$Key;->curve:Lcom/brashmonkey/spriter/Curve;

    invoke-virtual {v5, v3, v9, p3}, Lcom/brashmonkey/spriter/Curve;->tween(FFF)F

    move-result p3

    goto :goto_1

    .line 126
    :cond_8
    iget-object p3, p0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget-object p3, p3, Lcom/brashmonkey/spriter/Mainline$Key;->curve:Lcom/brashmonkey/spriter/Curve;

    invoke-virtual {p3, v10, v9, v6}, Lcom/brashmonkey/spriter/Curve;->tween(FFF)F

    move-result p3

    :goto_1
    move v9, p3

    .line 128
    invoke-virtual {v2}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v6

    .line 129
    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v7

    .line 130
    iget-object p3, p0, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object p3, p3, v1

    invoke-virtual {p3}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v8

    if-eqz v0, :cond_9

    .line 131
    check-cast v6, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    check-cast v7, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    check-cast v8, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    iget-object v10, v2, Lcom/brashmonkey/spriter/Timeline$Key;->curve:Lcom/brashmonkey/spriter/Curve;

    iget v11, v2, Lcom/brashmonkey/spriter/Timeline$Key;->spin:I

    move-object v5, p0

    invoke-virtual/range {v5 .. v11}, Lcom/brashmonkey/spriter/Animation;->tweenObject(Lcom/brashmonkey/spriter/Timeline$Key$Object;Lcom/brashmonkey/spriter/Timeline$Key$Object;Lcom/brashmonkey/spriter/Timeline$Key$Object;FLcom/brashmonkey/spriter/Curve;I)V

    goto :goto_2

    .line 132
    :cond_9
    iget-object v10, v2, Lcom/brashmonkey/spriter/Timeline$Key;->curve:Lcom/brashmonkey/spriter/Curve;

    iget v11, v2, Lcom/brashmonkey/spriter/Timeline$Key;->spin:I

    move-object v5, p0

    invoke-virtual/range {v5 .. v11}, Lcom/brashmonkey/spriter/Animation;->tweenBone(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Timeline$Key$Bone;FLcom/brashmonkey/spriter/Curve;I)V

    .line 133
    :goto_2
    iget-object p3, p0, Lcom/brashmonkey/spriter/Animation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object p3, p3, v1

    iput-boolean v4, p3, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    .line 134
    iget p3, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    iget-object v1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-eqz v1, :cond_a

    iget-object p2, p0, Lcom/brashmonkey/spriter/Animation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget-object p1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    iget p1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object p1, p2, p1

    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object p2

    :cond_a
    invoke-virtual {p0, p3, v0, p2}, Lcom/brashmonkey/spriter/Animation;->unmapTimelineObject(IZLcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    return-void
.end method
