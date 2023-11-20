package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Part;

// common lib는 클래스 작성전에 미리 등록해야 아래와 같이 정상 import 된다.
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUtil {

    //파일 업로드
    public static FileItem uploadFile(HttpServletRequest req, String sDirectory)
            throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        String encoding = "utf-8";
        FileItem fileItem;

        File sDirectoryfile = new File(sDirectory);
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 파일 경로 설정
        factory.setRepository(sDirectoryfile);
        // 최대 업로드 가능한 파일 크기 설정
        factory.setSizeThreshold(1024*1024);
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            //request 객체에서 매개변수를 List로 가져옵니다.
            List<FileItem> items = upload.parseRequest(req);

            for(int i=0; i< items.size(); i++){
                // 파일 업로드에서 업로드된 항목을 하나씩 가져 옵니다.
                fileItem = items.get(i);
                if(fileItem.isFormField()){
                    System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
                }else{
                    System.out.println("파일이름: " + fileItem.getName());
                    System.out.println("파일크기: " + fileItem.getSize() + "bytes");
                    // 업로드한 파일 이름을 가져옵니다.
                    if(fileItem.getSize() > 0 ){
                        int idx = fileItem.getName().lastIndexOf(File.separator);
                        if(idx == -1){
                            idx = fileItem.getName().lastIndexOf("/");
                        }
                        String fileName = fileItem.getName().substring(idx+1);

                        //전송된 파일이 있다면 디렉토리에 저장
                        if (!fileName.isEmpty()) {
                            // 업로드된 파일 이름으로 저장소에 파일을 업로드 합니다.
                            File uploadFlie  = new File(sDirectoryfile+ File.separator + fileName);
                            fileItem.write(uploadFlie);
                        }
                    } // end if
                } // end if  폼 필드가 아니면 파일 업로드 기능을 수행합니다.
            } // end for

        } catch (Exception e) {
            e.printStackTrace();
        }
//
//        //Part 객체를 통해 서버로 전송된 파일명 읽어오기
//        Part part = req.getPart("ofile");
//
//        //Part 객체의 헤더값 중 content-disposition 읽어오기
//        String partHeader = part.getHeader("content-disposition");
//        //출력결과 => form-data; name="attachedFile"; filename="파일명.jpg"
//        System.out.println("partHeader="+ partHeader);
//
//        //헤더값에서 파일명 잘라내기
//        String[] phArr = partHeader.split("filename=");
//        String originalFileName = phArr[1].trim().replace("\"", "");
//
//        //전송된 파일이 있다면 디렉토리에 저장
//        if (!originalFileName.isEmpty()) {
//            part.write(sDirectory+ File.separator +originalFileName);
//        }
//
//        //원본 파일명 반환
//        return originalFileName;
        return fileItem;
    }

    //파일명 변경
    public static String renameFile(String sDirectory, String fileName) {
        //원본파일의 확장자 잘라내기
        String ext = fileName.substring(fileName.lastIndexOf("."));
        //날짜 및 시간을 통해 파일명 생성
        String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
        //"날짜_시간.확장자" 형태의 새로운 파일명 생성
        String newFileName = now + ext;

        //기존 파일명을 새로운 파일명으로 변경
        File oldFile = new File(sDirectory + File.separator + fileName);
        File newFile = new File(sDirectory + File.separator + newFileName);
        oldFile.renameTo(newFile);

        //변경된 파일명 반환
        return newFileName;
    }

    //multiple 속성 추가로 2개 이상의 파일 업로드
    public static ArrayList<String> multipleFile(HttpServletRequest req, String sDirectory)
            throws ServletException, IOException {
        //파일명 저장을 위한 컬렉션 생성
        ArrayList<String> listFileName = new ArrayList<>();

        //Part 객체를 통해 서버로 전송된 파일명 읽어오기 
        Collection<Part> parts = req.getParts();
        for(Part part : parts) {
            //파일이 아니라면 업로드의 대상이 아니므로 무시
            if(!part.getName().equals("ofile"))
                continue;

            //Part 객체의 헤더값 중 content-disposition 읽어오기 
            String partHeader = part.getHeader("content-disposition");
            //출력결과 => form-data; name="attachedFile"; filename="파일명.jpg"
            System.out.println("partHeader="+ partHeader);

            //헤더값에서 파일명 잘라내기
            String[] phArr = partHeader.split("filename=");
            String originalFileName = phArr[1].trim().replace("\"", "");

            //전송된 파일이 있다면 디렉토리에 저장
            if (!originalFileName.isEmpty()) {
                part.write(sDirectory+ File.separator +originalFileName);
            }

            //컬렉션에 추가
            listFileName.add(originalFileName);
        }

        //원본 파일명 반환
        return listFileName;
    }

    //파일 다운로드
    public static void download(HttpServletRequest req, HttpServletResponse resp,
                                String directory, String sfileName, String ofileName) {
        String sDirectory = req.getServletContext().getRealPath(directory);
        try {
            // 파일을 찾아 입력 스트림 생성
            File file = new File(sDirectory, sfileName);
            InputStream iStream = new FileInputStream(file);

            // 한글 파일명 깨짐 방지
            String client = req.getHeader("User-Agent");
            if (client.indexOf("WOW64") == -1) {
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            else {
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }

            // 파일 다운로드용 응답 헤더 설정
            resp.reset();
            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition",
                    "attachment; filename=\"" + ofileName + "\"");
            resp.setHeader("Content-Length", "" + file.length() );

            //out.clear();  // 출력 스트림 초기화

            // response 내장 객체로부터 새로운 출력 스트림 생성
            OutputStream oStream = resp.getOutputStream();

            // 출력 스트림에 파일 내용 출력
            byte b[] = new byte[(int)file.length()];
            int readBuffer = 0;
            while ( (readBuffer = iStream.read(b)) > 0 ) {
                oStream.write(b, 0, readBuffer);
            }

            // 입/출력 스트림 닫음
            iStream.close();
            oStream.close();
        }
        catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없습니다.");
            e.printStackTrace();
        }
        catch (Exception e) {
            System.out.println("예외가 발생하였습니다.");
            e.printStackTrace();
        }
    }

    //파일 삭제 
    public static void deleteFile(HttpServletRequest req,
                                  String directory, String filename) {
        String sDirectory = req.getServletContext().getRealPath(directory);
        File file = new File(sDirectory + File.separator + filename);
        if (file.exists()) {
            file.delete();
        }
    }
}