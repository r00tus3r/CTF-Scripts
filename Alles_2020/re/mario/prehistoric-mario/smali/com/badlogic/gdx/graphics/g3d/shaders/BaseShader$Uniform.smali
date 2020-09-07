.class public Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;
.super Ljava/lang/Object;
.source "BaseShader.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Validator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Uniform"
.end annotation


# instance fields
.field public final alias:Ljava/lang/String;

.field public final environmentMask:J

.field public final materialMask:J

.field public final overallMask:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 6

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 91
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;-><init>(Ljava/lang/String;JJ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;J)V
    .locals 8

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v6, p2

    .line 87
    invoke-direct/range {v0 .. v7}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;-><init>(Ljava/lang/String;JJJ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJ)V
    .locals 8

    const-wide/16 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    .line 83
    invoke-direct/range {v0 .. v7}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;-><init>(Ljava/lang/String;JJJ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJJ)V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;->alias:Ljava/lang/String;

    .line 77
    iput-wide p2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;->materialMask:J

    .line 78
    iput-wide p4, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;->environmentMask:J

    .line 79
    iput-wide p6, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;->overallMask:J

    return-void
.end method


# virtual methods
.method public validate(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;ILcom/badlogic/gdx/graphics/g3d/Renderable;)Z
    .locals 6

    const-wide/16 p1, 0x0

    if-eqz p3, :cond_0

    .line 95
    iget-object v0, p3, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    if-eqz v0, :cond_0

    iget-object v0, p3, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/Material;->getMask()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    move-wide v0, p1

    :goto_0
    if-eqz p3, :cond_1

    .line 96
    iget-object v2, p3, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    if-eqz v2, :cond_1

    iget-object p1, p3, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->getMask()J

    move-result-wide p1

    .line 97
    :cond_1
    iget-wide v2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;->materialMask:J

    and-long v4, v0, v2

    cmp-long p3, v4, v2

    if-nez p3, :cond_2

    iget-wide v2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;->environmentMask:J

    and-long v4, p1, v2

    cmp-long p3, v4, v2

    if-nez p3, :cond_2

    or-long/2addr p1, v0

    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;->overallMask:J

    and-long/2addr p1, v0

    cmp-long p3, p1, v0

    if-nez p3, :cond_2

    const/4 p1, 0x1

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    return p1
.end method
