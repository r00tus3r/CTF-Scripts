.class public Lcom/badlogic/gdx/backends/android/AndroidFileHandle;
.super Lcom/badlogic/gdx/files/FileHandle;
.source "AndroidFileHandle.java"


# instance fields
.field private final assets:Landroid/content/res/AssetManager;


# direct methods
.method constructor <init>(Landroid/content/res/AssetManager;Ljava/io/File;Lcom/badlogic/gdx/Files$FileType;)V
    .locals 0

    .line 50
    invoke-direct {p0, p2, p3}, Lcom/badlogic/gdx/files/FileHandle;-><init>(Ljava/io/File;Lcom/badlogic/gdx/Files$FileType;)V

    .line 51
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    return-void
.end method

.method constructor <init>(Landroid/content/res/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/Files$FileType;)V
    .locals 2

    const/16 v0, 0x5c

    const/16 v1, 0x2f

    .line 45
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2, p3}, Lcom/badlogic/gdx/files/FileHandle;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/Files$FileType;)V

    .line 46
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    return-void
.end method


# virtual methods
.method public child(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;
    .locals 4

    const/16 v0, 0x5c

    const/16 v1, 0x2f

    .line 55
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    .line 56
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-direct {v0, v1, v2, p1}, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;-><init>(Landroid/content/res/AssetManager;Ljava/io/File;Lcom/badlogic/gdx/Files$FileType;)V

    return-object v0

    .line 57
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-direct {v2, v3, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-direct {v0, v1, v2, p1}, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;-><init>(Landroid/content/res/AssetManager;Ljava/io/File;Lcom/badlogic/gdx/Files$FileType;)V

    return-object v0
.end method

.method public exists()Z
    .locals 4

    .line 211
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    sget-object v1, Lcom/badlogic/gdx/Files$FileType;->Internal:Lcom/badlogic/gdx/Files$FileType;

    if-ne v0, v1, :cond_1

    .line 212
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    .line 214
    :try_start_0
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    invoke-virtual {v2, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    const/4 v2, 0x0

    .line 219
    :try_start_1
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    invoke-virtual {v3, v0}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    :catch_1
    return v2

    .line 225
    :cond_1
    invoke-super {p0}, Lcom/badlogic/gdx/files/FileHandle;->exists()Z

    move-result v0

    return v0
.end method

.method public file()Ljava/io/File;
    .locals 3

    .line 253
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    sget-object v1, Lcom/badlogic/gdx/Files$FileType;->Local:Lcom/badlogic/gdx/Files$FileType;

    if-ne v0, v1, :cond_0

    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    invoke-interface {v1}, Lcom/badlogic/gdx/Files;->getLocalStoragePath()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 254
    :cond_0
    invoke-super {p0}, Lcom/badlogic/gdx/files/FileHandle;->file()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getAssetFileDescriptor()Landroid/content/res/AssetFileDescriptor;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 262
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->path()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public isDirectory()Z
    .locals 3

    .line 200
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    sget-object v1, Lcom/badlogic/gdx/Files$FileType;->Internal:Lcom/badlogic/gdx/Files$FileType;

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    .line 202
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :catch_0
    :cond_0
    return v0

    .line 207
    :cond_1
    invoke-super {p0}, Lcom/badlogic/gdx/files/FileHandle;->isDirectory()Z

    move-result v0

    return v0
.end method

.method public lastModified()J
    .locals 2

    .line 249
    invoke-super {p0}, Lcom/badlogic/gdx/files/FileHandle;->lastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method public length()J
    .locals 3

    .line 229
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    sget-object v1, Lcom/badlogic/gdx/Files$FileType;->Internal:Lcom/badlogic/gdx/Files$FileType;

    if-ne v0, v1, :cond_2

    const/4 v0, 0x0

    .line 232
    :try_start_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    .line 233
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 238
    :try_start_1
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_0
    return-wide v1

    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_2
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 240
    :catch_1
    :cond_1
    throw v1

    :catch_2
    nop

    if-eqz v0, :cond_2

    .line 238
    :try_start_3
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 245
    :catch_3
    :cond_2
    invoke-super {p0}, Lcom/badlogic/gdx/files/FileHandle;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public list()[Lcom/badlogic/gdx/files/FileHandle;
    .locals 9

    .line 109
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    sget-object v1, Lcom/badlogic/gdx/Files$FileType;->Internal:Lcom/badlogic/gdx/Files$FileType;

    if-ne v0, v1, :cond_1

    .line 111
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 112
    array-length v1, v0

    new-array v1, v1, [Lcom/badlogic/gdx/files/FileHandle;

    const/4 v2, 0x0

    .line 113
    array-length v3, v1

    :goto_0
    if-ge v2, v3, :cond_0

    .line 114
    new-instance v4, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;

    iget-object v5, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    aget-object v8, v0, v2

    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-object v7, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-direct {v4, v5, v6, v7}, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;-><init>(Landroid/content/res/AssetManager;Ljava/io/File;Lcom/badlogic/gdx/Files$FileType;)V

    aput-object v4, v1, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1

    :catch_0
    move-exception v0

    .line 117
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error listing children: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 120
    :cond_1
    invoke-super {p0}, Lcom/badlogic/gdx/files/FileHandle;->list()[Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    return-object v0
.end method

.method public list(Ljava/io/FileFilter;)[Lcom/badlogic/gdx/files/FileHandle;
    .locals 11

    .line 124
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    sget-object v1, Lcom/badlogic/gdx/Files$FileType;->Internal:Lcom/badlogic/gdx/Files$FileType;

    if-ne v0, v1, :cond_3

    .line 126
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 127
    array-length v1, v0

    new-array v1, v1, [Lcom/badlogic/gdx/files/FileHandle;

    .line 129
    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    .line 130
    aget-object v6, v0, v4

    .line 131
    new-instance v7, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;

    iget-object v8, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    new-instance v9, Ljava/io/File;

    iget-object v10, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-direct {v9, v10, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-object v6, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-direct {v7, v8, v9, v6}, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;-><init>(Landroid/content/res/AssetManager;Ljava/io/File;Lcom/badlogic/gdx/Files$FileType;)V

    .line 132
    invoke-virtual {v7}, Lcom/badlogic/gdx/files/FileHandle;->file()Ljava/io/File;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/io/FileFilter;->accept(Ljava/io/File;)Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_1

    .line 133
    :cond_0
    aput-object v7, v1, v5

    add-int/lit8 v5, v5, 0x1

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 136
    :cond_1
    array-length p1, v0

    if-ge v5, p1, :cond_2

    .line 137
    new-array p1, v5, [Lcom/badlogic/gdx/files/FileHandle;

    .line 138
    invoke-static {v1, v3, p1, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :cond_2
    move-object p1, v1

    :goto_2
    return-object p1

    :catch_0
    move-exception p1

    .line 143
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error listing children: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 146
    :cond_3
    invoke-super {p0, p1}, Lcom/badlogic/gdx/files/FileHandle;->list(Ljava/io/FileFilter;)[Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p1

    return-object p1
.end method

.method public list(Ljava/io/FilenameFilter;)[Lcom/badlogic/gdx/files/FileHandle;
    .locals 11

    .line 150
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    sget-object v1, Lcom/badlogic/gdx/Files$FileType;->Internal:Lcom/badlogic/gdx/Files$FileType;

    if-ne v0, v1, :cond_3

    .line 152
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 153
    array-length v1, v0

    new-array v1, v1, [Lcom/badlogic/gdx/files/FileHandle;

    .line 155
    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    .line 156
    aget-object v6, v0, v4

    .line 157
    iget-object v7, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-interface {p1, v7, v6}, Ljava/io/FilenameFilter;->accept(Ljava/io/File;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    goto :goto_1

    .line 158
    :cond_0
    new-instance v7, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;

    iget-object v8, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    new-instance v9, Ljava/io/File;

    iget-object v10, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-direct {v9, v10, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-object v6, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-direct {v7, v8, v9, v6}, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;-><init>(Landroid/content/res/AssetManager;Ljava/io/File;Lcom/badlogic/gdx/Files$FileType;)V

    aput-object v7, v1, v5

    add-int/lit8 v5, v5, 0x1

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 161
    :cond_1
    array-length p1, v0

    if-ge v5, p1, :cond_2

    .line 162
    new-array p1, v5, [Lcom/badlogic/gdx/files/FileHandle;

    .line 163
    invoke-static {v1, v3, p1, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :cond_2
    move-object p1, v1

    :goto_2
    return-object p1

    :catch_0
    move-exception p1

    .line 168
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error listing children: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 171
    :cond_3
    invoke-super {p0, p1}, Lcom/badlogic/gdx/files/FileHandle;->list(Ljava/io/FilenameFilter;)[Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p1

    return-object p1
.end method

.method public list(Ljava/lang/String;)[Lcom/badlogic/gdx/files/FileHandle;
    .locals 11

    .line 175
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    sget-object v1, Lcom/badlogic/gdx/Files$FileType;->Internal:Lcom/badlogic/gdx/Files$FileType;

    if-ne v0, v1, :cond_3

    .line 177
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 178
    array-length v1, v0

    new-array v1, v1, [Lcom/badlogic/gdx/files/FileHandle;

    .line 180
    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    .line 181
    aget-object v6, v0, v4

    .line 182
    invoke-virtual {v6, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    goto :goto_1

    .line 183
    :cond_0
    new-instance v7, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;

    iget-object v8, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    new-instance v9, Ljava/io/File;

    iget-object v10, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-direct {v9, v10, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-object v6, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-direct {v7, v8, v9, v6}, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;-><init>(Landroid/content/res/AssetManager;Ljava/io/File;Lcom/badlogic/gdx/Files$FileType;)V

    aput-object v7, v1, v5

    add-int/lit8 v5, v5, 0x1

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 186
    :cond_1
    array-length p1, v0

    if-ge v5, p1, :cond_2

    .line 187
    new-array p1, v5, [Lcom/badlogic/gdx/files/FileHandle;

    .line 188
    invoke-static {v1, v3, p1, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :cond_2
    move-object p1, v1

    :goto_2
    return-object p1

    :catch_0
    move-exception p1

    .line 193
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error listing children: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 196
    :cond_3
    invoke-super {p0, p1}, Lcom/badlogic/gdx/files/FileHandle;->list(Ljava/lang/String;)[Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p1

    return-object p1
.end method

.method public map(Ljava/nio/channels/FileChannel$MapMode;)Ljava/nio/ByteBuffer;
    .locals 9

    .line 89
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    sget-object v1, Lcom/badlogic/gdx/Files$FileType;->Internal:Lcom/badlogic/gdx/Files$FileType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 92
    :try_start_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->getAssetFileDescriptor()Landroid/content/res/AssetFileDescriptor;

    move-result-object v1

    .line 93
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v4

    .line 94
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getDeclaredLength()J

    move-result-wide v6

    .line 95
    new-instance v8, Ljava/io/FileInputStream;

    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-direct {v8, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 96
    :try_start_1
    invoke-virtual {v8}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v2

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object p1

    .line 97
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    invoke-static {v8}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-object p1

    :catchall_0
    move-exception p1

    move-object v0, v8

    goto :goto_1

    :catch_0
    move-exception p1

    move-object v0, v8

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 100
    :goto_0
    :try_start_2
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error memory mapping file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 102
    :goto_1
    invoke-static {v0}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw p1

    .line 105
    :cond_0
    invoke-super {p0, p1}, Lcom/badlogic/gdx/files/FileHandle;->map(Ljava/nio/channels/FileChannel$MapMode;)Ljava/nio/ByteBuffer;

    move-result-object p1

    return-object p1
.end method

.method public parent()Lcom/badlogic/gdx/files/FileHandle;
    .locals 4

    .line 67
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_1

    .line 69
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    sget-object v1, Lcom/badlogic/gdx/Files$FileType;->Absolute:Lcom/badlogic/gdx/Files$FileType;

    if-ne v0, v1, :cond_0

    .line 70
    new-instance v0, Ljava/io/File;

    const-string v1, "/"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 72
    :cond_0
    new-instance v0, Ljava/io/File;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 74
    :cond_1
    :goto_0
    new-instance v1, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-direct {v1, v2, v0, v3}, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;-><init>(Landroid/content/res/AssetManager;Ljava/io/File;Lcom/badlogic/gdx/Files$FileType;)V

    return-object v1
.end method

.method public read()Ljava/io/InputStream;
    .locals 4

    .line 78
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    sget-object v1, Lcom/badlogic/gdx/Files$FileType;->Internal:Lcom/badlogic/gdx/Files$FileType;

    if-ne v0, v1, :cond_0

    .line 80
    :try_start_0
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->assets:Landroid/content/res/AssetManager;

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 82
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error reading file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 85
    :cond_0
    invoke-super {p0}, Lcom/badlogic/gdx/files/FileHandle;->read()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public sibling(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;
    .locals 3

    const/16 v0, 0x5c

    const/16 v1, 0x2f

    .line 61
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    .line 62
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    sget-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidFileHandle;->type:Lcom/badlogic/gdx/Files$FileType;

    invoke-interface {v0, p1, v1}, Lcom/badlogic/gdx/Files;->getFileHandle(Ljava/lang/String;Lcom/badlogic/gdx/Files$FileType;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p1

    return-object p1

    .line 62
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Cannot get the sibling of the root."

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
