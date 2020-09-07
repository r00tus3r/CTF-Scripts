.class public Lcom/badlogic/gdx/graphics/glutils/GLVersion;
.super Ljava/lang/Object;
.source "GLVersion.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private majorVersion:I

.field private minorVersion:I

.field private releaseVersion:I

.field private final rendererString:Ljava/lang/String;

.field private final type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

.field private final vendorString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/Application$ApplicationType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "GLVersion"

    .line 38
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->TAG:Ljava/lang/String;

    .line 41
    sget-object v0, Lcom/badlogic/gdx/Application$ApplicationType;->Android:Lcom/badlogic/gdx/Application$ApplicationType;

    if-ne p1, v0, :cond_0

    sget-object p1, Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;->GLES:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    goto :goto_0

    .line 42
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/Application$ApplicationType;->iOS:Lcom/badlogic/gdx/Application$ApplicationType;

    if-ne p1, v0, :cond_1

    sget-object p1, Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;->GLES:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Lcom/badlogic/gdx/Application$ApplicationType;->Desktop:Lcom/badlogic/gdx/Application$ApplicationType;

    if-ne p1, v0, :cond_2

    sget-object p1, Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;->OpenGL:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    goto :goto_0

    .line 44
    :cond_2
    sget-object v0, Lcom/badlogic/gdx/Application$ApplicationType;->Applet:Lcom/badlogic/gdx/Application$ApplicationType;

    if-ne p1, v0, :cond_3

    sget-object p1, Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;->OpenGL:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    goto :goto_0

    .line 45
    :cond_3
    sget-object v0, Lcom/badlogic/gdx/Application$ApplicationType;->WebGL:Lcom/badlogic/gdx/Application$ApplicationType;

    if-ne p1, v0, :cond_4

    sget-object p1, Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;->WebGL:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    goto :goto_0

    .line 46
    :cond_4
    sget-object p1, Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;->NONE:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    .line 48
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;->GLES:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    const-string v1, ""

    if-ne p1, v0, :cond_5

    const-string p1, "OpenGL ES (\\d(\\.\\d){0,2})"

    .line 50
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->extractVersion(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 51
    :cond_5
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;->WebGL:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    if-ne p1, v0, :cond_6

    const-string p1, "WebGL (\\d(\\.\\d){0,2})"

    .line 53
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->extractVersion(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 54
    :cond_6
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;->OpenGL:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    if-ne p1, v0, :cond_7

    const-string p1, "(\\d(\\.\\d){0,2})"

    .line 56
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->extractVersion(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_7
    const/4 p1, -0x1

    .line 58
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->majorVersion:I

    .line 59
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->minorVersion:I

    .line 60
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->releaseVersion:I

    move-object p3, v1

    move-object p4, p3

    .line 65
    :goto_1
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->vendorString:Ljava/lang/String;

    .line 66
    iput-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->rendererString:Ljava/lang/String;

    return-void
.end method

.method private extractVersion(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 70
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    .line 71
    invoke-virtual {p1, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    const/4 p2, 0x1

    .line 74
    invoke-virtual {p1, p2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\\."

    .line 75
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 76
    aget-object v0, p1, v2

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->parseInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->majorVersion:I

    .line 77
    array-length v0, p1

    if-ge v0, v1, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    aget-object p2, p1, p2

    invoke-direct {p0, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->parseInt(Ljava/lang/String;I)I

    move-result p2

    :goto_0
    iput p2, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->minorVersion:I

    .line 78
    array-length p2, p1

    const/4 v0, 0x3

    if-ge p2, v0, :cond_1

    goto :goto_1

    :cond_1
    aget-object p1, p1, v1

    invoke-direct {p0, p1, v2}, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->parseInt(Ljava/lang/String;I)I

    move-result v2

    :goto_1
    iput v2, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->releaseVersion:I

    goto :goto_2

    .line 80
    :cond_2
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid version string: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "GLVersion"

    invoke-interface {p1, v0, p2}, Lcom/badlogic/gdx/Application;->log(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->majorVersion:I

    .line 82
    iput v2, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->minorVersion:I

    .line 83
    iput v2, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->releaseVersion:I

    :goto_2
    return-void
.end method

.method private parseInt(Ljava/lang/String;I)I
    .locals 3

    .line 90
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    .line 92
    :catch_0
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error parsing number: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", assuming: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "LibGDX GL"

    invoke-interface {v0, v1, p1}, Lcom/badlogic/gdx/Application;->error(Ljava/lang/String;Ljava/lang/String;)V

    return p2
.end method


# virtual methods
.method public getDebugVersionString()Ljava/lang/String;
    .locals 3

    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "\nVersion: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->majorVersion:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->minorVersion:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->releaseVersion:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\nVendor: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->vendorString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\nRenderer: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->rendererString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMajorVersion()I
    .locals 1

    .line 104
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->majorVersion:I

    return v0
.end method

.method public getMinorVersion()I
    .locals 1

    .line 109
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->minorVersion:I

    return v0
.end method

.method public getReleaseVersion()I
    .locals 1

    .line 114
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->releaseVersion:I

    return v0
.end method

.method public getRendererString()Ljava/lang/String;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->rendererString:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->type:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    return-object v0
.end method

.method public getVendorString()Ljava/lang/String;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->vendorString:Ljava/lang/String;

    return-object v0
.end method

.method public isVersionEqualToOrHigher(II)Z
    .locals 1

    .line 136
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->majorVersion:I

    if-gt v0, p1, :cond_1

    if-ne v0, p1, :cond_0

    iget p1, p0, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->minorVersion:I

    if-lt p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method
