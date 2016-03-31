package com.ieebook.wxshop.test.sql;

import java.io.*;

/**
 * jiangyukun on 2015-11-10 10:25
 */
public class SqlBuilder {
    //    private static final String FILE_ROOT = "/server/SQL";
    private static final String FILE_ROOT = "E:\\Outsourcing\\twobrother\\SQL";
    private static final String OUTPUT_FILE = FILE_ROOT + "\\all.sql";


    public static void main(String[] args) throws IOException {
        File outputFile = new File(OUTPUT_FILE);
        if (outputFile.exists()) {
            if (!outputFile.delete()) {
                throw new IOException(OUTPUT_FILE + " 文件删除失败");
            }
        }
        SqlBuilder builder = new SqlBuilder();
        File root = new File(FILE_ROOT);
        builder.handleDir(root);
    }

    private void handleDir(File dir) throws IOException {
        File[] files = dir.listFiles();
        if (files == null) return;
        for (File file : files) {
            if (file.isDirectory()) {
                handleDir(file);
            } else if (file.isFile()) {
                String fileName = file.getName();
                if (fileName.equalsIgnoreCase("projectx_new.sql") || fileName.equalsIgnoreCase("func.sql")) {
                    continue;
                }
                if (fileName.toLowerCase().contains(".sql")) {
                    collectFileSql(file);
                }
            }
        }
    }

    private void collectFileSql(File file) throws IOException {
        StringBuilder sb = new StringBuilder();
        if (file.isDirectory()) {
            throw new RuntimeException(file.getName() + "is not a file");
        }
        BufferedReader bufferedReader = new BufferedReader(new FileReader(file));
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            sb.append(line).append("\r\n");
        }
        System.out.println(sb);
        outputSql(sb);
    }

    private void outputSql(StringBuilder sb) throws IOException {
        FileWriter fileWriter = new FileWriter(OUTPUT_FILE, true);
        fileWriter.write(sb.toString());
    }
}
