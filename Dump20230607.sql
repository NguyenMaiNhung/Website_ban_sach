-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: qlbs
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS account;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  id int NOT NULL AUTO_INCREMENT,
  name_user varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  name_real varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  email varchar(45) NOT NULL,
  phone_number varchar(45) NOT NULL,
  address varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `role` int NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES account WRITE;
/*!40000 ALTER TABLE account DISABLE KEYS */;
INSERT INTO account VALUES (1,'admin','admin','Admin','ad@gmail.com','0988028768','19 Kim Liên, Hà Nội',0),(2,'phuong_nm','03042002','Nguyễn Mai Phương','nmp@gmail.com','0988027568','20 Ô Chợ Dừa, Hà Nội',1),(3,'yen_nh','12345','Nguyễn Hải Yến','yen.12@gmail.com','0988045768','số 19, ngõ 1 Ao Sen, Hà Đông',1),(4,'mai_th','12345','Trần Thị Mai','mai@gmail.com','0989786578','số 13, Khâm Thiên, Bắc Ninh',1),(5,'ha_th','12345','Trần Thu Hà','th@gmail.com','0978675090','số 19, ngõ 1 Ao Sen, Hà Đông',1),(8,'nhung_nm','10012002','Nguyễn Mai Nhung','nguyennhung.nmn10012002@gmail.com','0988028758','số 13, Khâm Thiên, Bắc Ninh',1),(9,'gam_vt','12345','Vũ Thị Gấm','gam@gmail.com','0335678786','xóm 18, Xuân Hòa, Xuân Trường, Nam Định',1),(10,'thuyen_tm','12345','Trần Thuyên','abc@gmail.com','0987678642','Tức mặc, Nam Định',1),(13,'yen_nh','12345','dfad','mai@gmail.com','3534654','fdasvszdbg',1),(22,'vuthu_thu','12345','Trần Thu Vũ','vuthu@gmail.com','0359584853','số 1, Nguyễn Văn Trỗi, Hà Đông, Hà Nội',1),(23,'433','12345','etfew','abc@gmail.com','353465','20 Ô Chợ Dừa, Nam Định',1);
/*!40000 ALTER TABLE account ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS book;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE book (
  id int NOT NULL AUTO_INCREMENT,
  title varchar(100) NOT NULL,
  author varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `describe` varchar(350) NOT NULL,
  amount int NOT NULL,
  `year` int NOT NULL,
  sotrang int NOT NULL,
  gia_goc int NOT NULL,
  gia_ban int NOT NULL,
  loai_bia varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  image varchar(45) NOT NULL,
  publisher varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES book WRITE;
/*!40000 ALTER TABLE book DISABLE KEYS */;
INSERT INTO book VALUES (1,'Những Vụ Kì Án Của Sherlock Holmes','Athur Conan Doyle ','Sherlock Holmes được xem là một trong những huyền thoại trinh thám trên nền văn học thế giới. Hình tượng của vị thám tử tài ba là khuôn mẫu mà các nhà văn hướng tới khi xây dựng các tác phẩm trinh thám, nổi tiếng đến mức độ độc giả quyên mất đây chỉ là một nhân vật hư cấu.',0,2015,256,180000,118000,'Bìa mềm','img/shlo.jpg','Đinh Tị'),(2,'Mật Mã Davinci','Dan Brown','Thời điểm tác phẩm này ra đời đã gây ra cuộc tranh cãi lớn trên văn đàn thế giới bởi việc sử dụng yếu tố thần học trong tác phẩm. Cuốn sách mang đậm phong cách cá nhân của Dan Brown khi có sự đan xen giữa yếu tố trinh thám và yếu tố thần thoại, hai chất liệu hoàn toàn trái ngược nhau.',300,2014,1000,250000,239000,'Bìa mềm','img/code.jpg','Văn Hóa - Thông Tin'),(3,'Án Mạng Trên Chuyến Tàu Tốc Hành Phương Đông','Agatha Christie','Một tên giết người trên chuyến tàu tốc hành Phương Đông được phát hiện đã bị giết chết bởi 12 nhát dao khác nhau. Phải chăng hung thủ là người ngoài hay chính 12 hành khách - vốn có mối thù với hắn - thông đồng với nhau để trả thù? Thám tử Poirot đã ra tay và vụ án dần dần được làm sáng tỏ.',146,2022,298,120000,102000,'Bìa mềm','img/east.jpg','NXB Trẻ'),(4,'Tuyển Tập Truyện Ngụ Ngôn Hay Nhất','Nguyễn Châu Nguyên','Tuyển Tập Truyện Ngụ Ngôn Hay Nhất - Ngắn gọn mà giản dị, sâu sắc mà dí dỏm, những câu chuyện ngụ ngôn luôn có sức sống trường tồn trong dòng chảy văn học.',150,2023,216,90000,63000,'Bìa mềm','img/tn1.jpg','Văn Học'),(5,'Giấc Mơ Buổi Sáng','Nguyễn Lãm Thắng','Sách Giấc Mơ Buổi Sáng - Tập Thơ Thiếu Nhi viết về nhiều đề tài nhưng tất cả đều gần gũi với trẻ thơ, trong đó là những hình ảnh của một tuổi thơ êm đềm, giản dị nhưng đầy tình yêu thương và sự hồn nhiên, trong trẻo.',199,2017,192,116000,93000,'Bìa mềm','img/tn2.jpg','NXB Hồng Đức'),(6,'Sói Già Phố Wall - Phần 3','Jordan Belfort','Sói Già Phố Wall - Phần 3 - Cuốn tự truyện không đơn giản chỉ là kể về cuộc đời của một gã \"lọc lừa\" với nhiều những mánh khóe tinh vi, mà sâu xa hơn nữa là toàn cảnh bức tranh về phố Wall và thị trường chứng khoán. Chân thực và lôi cuốn là hai từ có thể nói về cuốn hồi ký này.',96,2023,396,165000,132000,'Bìa mềm','img/kd1.jpg','Dân Trí'),(7,'Spotify Và Những Chuyện Chưa Kể','Jonas Leijonhufvud, Sven Carlsson','Spotify Và Những Chuyện Chưa Kể - Có thể coi Spotify và những câu chuyện chưa kể là một cuốn hồi kí dài với nhiều câu chuyện đan xen suốt dọc chiều dài phát triển của Spotify.',200,2022,412,175000,140000,'Bìa mềm','img/kd2.jpg','Dân Trí'),(8,'Napoleon Đại Đế','Andrew Roberts','NAPOLEON Đại Đế kể về nhân vật đặc biệt vĩ đại và hấp dẫn trong lịch sử Pháp cũng như lịch sử thế giới. Cuốn sách tái hiện cuộc đời oanh tạc anh hùng của lịch sử thế giới.',200,2023,1220,529000,465000,'Bìa cứng','img/ls1.jpg','NXB Thế Giới'),(9,'Những Nhà Lãnh Đạo Thay Đổi Lịch Sử','DK','Những Nhà Lãnh Đạo Thay Đổi Lịch Sử - là tập hợp các thông tin về cuộc đời, thân thế và ảnh hưởng… của 81 nhà lãnh đạo đã từng xuất hiện trong lịch sử, trên nhiều lĩnh vực.',100,2021,320,390000,331000,'Bìa mềm','img/ls2.jpg','Dân Trí'),(10,'Giết Con Chim Nhại','Harper Lee','Giết Con Chim Nhại là tác phẩm đầu tay và cũng là cuối cùng của nữ nhà văn Mỹ Harper Lee. Một tác phẩm đầy sức hút với độc giả ở nhiều lứa tuổi và mang lại nhiều thông điệp ý nghĩa.',200,2019,492,120000,102000,'Bìa mềm','img/cd1.jpg','Văn Học'),(11,'Kiêu Hãnh Và Định Kiến','Jane Austen','Kiêu Hãnh Và Định Kiến là câu chuyện tình yêu giàu cảm xúc của năm cô con gái nhà Bennett, đặc biệt là chuyện tình giữa Elizabeth Bennet - cô con gái thứ hai, và Fitzwilliam Darcy - một quý tộc giàu có và nhiều danh vọng.',100,2018,568,120000,96000,'Bìa mềm','img/cd2.jpg','Văn Học'),(12,'Đồi Gió Hú','Emily Bronte','Đồi Gió Hú là cuốn tiểu thuyết nổi tiếng của tác giả Emily Bronte đã tới tay công chúng với nhiều lời bình trái ngược vào năm 1847.',250,2020,482,120000,98000,'Bìa mềm','img/cd3.jpg','Văn Học'),(13,'Tiếng Chim Hót Trong Bụi Mận Gai','Colleen McCulough','Tiếng Chim Hót Trong Bụi Mận Gai của Colleen McCulough ngay khi vừa xuất bản (1977) đã được dịch ra nhiều thứ tiếng và được xếp ngang hàng với tác phẩm văn học kinh điển \"Cuốn theo chiều gió\". Nhưng ít ai biết được rằng, thời điểm tác phẩm ra đời, viết văn chỉ là nghề tay trái của Colleen McCollough, nhân viên y tế là nghề chính của bà.',150,2011,866,110000,88000,'Bìa cứng','img/lm1.jpg','Văn Học'),(14,'Lý Trí Và Tình Cảm','Jane Austen','Sách Lý Trí Và Tình Cảm của tác giả Jane Austen viết về cuộc sống và những chuyện tình cảm của hai chị em Elinor và Marianne, sẽ giúp độc giả rõ hơn về những biến động trong tâm tư và những nhu cầu thực tế cùng hạn chế của nữ giới trong xã hội thời đó.',247,2018,412,129000,109000,'Bìa mềm','img/lm2.jpg','Hội Nhà Văn'),(15,'Thao Túng Tâm Lý Trong Tình Yêu','Michelle Moore','Thao Túng Tâm Lý Trong Tình Yêu - Sẽ giúp bạn nhận ra các kiểu thao túng và lạm dụng tình cảm phổ biến nhất, thông qua câu chuyện đời thực của chính tác giả và những điều cô biết được khi gặp mặt những nạn nhân khác. Lời khuyên của các cá nhân đã trải qua tổn thương sẽ giúp bạn không còn lạc lối...',200,2023,272,159000,135000,'Bìa mềm','img/kn1.jpg','NXB Thanh Niên'),(16,'Trong Bộ Lông Cừu','Martha Stout PhD	','Trong Bộ Lông Cừu - Một người lương thiện lấy đâu ra cơ hội để chống lại một kẻ rối loạn nhân cách chống đối xã hội, một kẻ thù đội lốt, kẻ sở hữu những sức mạnh đặc biệt như khả năng sống hai mặt và sự trơ tráo tuyệt đối?',300,2023,420,209000,177000,'Bìa mềm','img/kn2.jpg','NXB Thanh Niên'),(17,'Tuyệt Kĩ Xóa Mù Tiếng Anh','Mizuno Yuka','Tuyệt Kỹ Xóa Mù Tiếng Anh - Tiếng Anh sẽ làm phong phú thêm cuộc sống của bạn, giúp bạn tiến tới thành công một cách dễ dàng hơn.',200,2022,358,139000,111000,'Bìa mềm','img/nn1.jpg','Dân Trí'),(18,'Sống Sót Nơi Công Sở','Gina Kim','Sống Sót Nơi Công Sở - Everyday English - Nói Đi Ngại Gì - Cung cấp các câu thông dụng tương ứng với các chủ đề khác nhau.',250,2022,260,169000,136000,'Bìa mềm','img/nn2.jpg','Dân Trí'),(19,'Khu Rừng Đom Đóm','Yuki Midorikawa','Khu Rừng Đom Đóm - ​Trong khi chạy vào khu rừng của thần linh và yêu quái ở quê nội, cô bé Hotaru đã bị lạc và ngồi khóc. May mắn thay, cô được một linh hồn của cậu thiếu niên đeo mặt nạ dẫn ra khỏi rừng...',25,2023,168,65000,61000,'Bìa mềm','img/mg.jpg','NXB Trẻ'),(20,'Doraemon Truyện Ngắn','Fujiko F Fujio','Doraemon là một bộ truyện tranh Nhật Bản của tác giả Fujiko Fujio được sáng tác từ năm 1969 với mục đích ban đầu dành cho lứa tuổi thiếu nhi. Doraemon được bình chọn là một trong 22 nhân vật truyện tranh ăn khách châu Á.',30,2019,192,18000,17000,'Bìa mềm','img/mg1.jpg','NXB Kim Đồng'),(21,'Giải Mã Hành Vi - Bắt Gọn Tâm Lý','Lộc Dã','Giải Mã Hành Vi - Bắt Gọn Tâm Lý - Tác giả đã chắt lọc những nội dung tinh túy và đúc rút 23 điểm then chốt giúp chúng ta dễ dàng “đọc vị” bất cứ ai trong quá trình giao tiếp hoặc đàm phán.',200,2020,300,139000,118000,'Bìa mềm','img/tl1.jpg','NXB Lao Động'),(22,'Phi Lý Trí','Dan Ariely','Phi Lý Trí - Cuốn sách đặc biệt hấp dẫn và đầy cảm hứng, buộc người đọc phải suy nghĩ kỹ hơn về tất cả những hành vi, những ai lầm của mình để sống hợp lý và tốt đẹp hơn.',250,2021,339,169000,136000,'Bìa mềm','img/tl2.jpg','NXB Lao Động'),(23,'Hoàng Tử Bé','Antoine De Saint-Exupéry ','\"Hoàng tử bé\" mông lung, dịu mát như làn gió thổi qua cánh đồng giới hạn bởi đường chân trời nửa thực nửa hư; mà nó vẫn lại sáng tỏ, ấm nóng như ngọn đuốc trong đêm.',100,2022,112,98000,78000,'Bìa mềm','img/tn3.jpg','Hội Nhà Văn'),(24,'Harry Potter Và Hội Phượng Hoàng','J.K.Rowling','Harry tức giận vì bị bỏ rơi ở nhà Dursley trong dịp hè, cậu ngờ rằng Chúa tể hắc ám Voldemort đang tập hợp lực lượng, và vì cậu có nguy cơ bị tấn công, những người Harry luôn coi là bạn đang cố che giấu tung tích cậu.',150,2017,1310,355000,301000,'Bìa cứng','img/tn4.jpg','NXB Trẻ'),(26,'Bước Vào Thế Giới Cảm Xúc Bé Nhỏ Của Trẻ','Cam Khai Toàn','Bước Vào Thế Giới Cảm Xúc Bé Nhỏ Của Trẻ - Cảm xúc được kiểm soát tốt có thể trở thành năng lượng tích cực hỗ trợ trẻ; cảm xúc không được kiểm soát tốt có thể ảnh hưởng đến sự phát triển lành mạnh của trẻ.',300,2023,184,70000,49000,'Bìa mềm','img/tn5.jpg','Phụ Nữ Việt Nam'),(27,'Hỏa Ngục','Dan Brown','\"Hoả ngục\" của Dan Brown là một cuốn tiểu thuyết trinh thám kì bí đầy hấp dẫn, Dan Brown trở lại với đúng sở trường của mình và tạo nên một \"Siêu phẩm được đặt cược\" nhiều nhất từ trước đến nay.',300,2020,694,219000,186000,'Bìa cứng','img/sach-hoa-nguc.jpg','Lao Động'),(29,'Danh Nhân Thế Giới: Fabrê','Han Kiên','Danh Nhân Thế Giới: Fabrê - là nhà côn trùng học đã khám phá rất nhiều tập tính kì bí của các loài công trùng.',300,2021,160,30000,25500,'Bìa mềm','img/tn6.jpg','Kim Đồng'),(34,'Amazon - Cuộc Chinh Phạt Của Jeff Bezos','Brad Stone','Amazon - Cuộc Chinh Phạt Của Jeff Bezos - Câu chuyện về một CEO cứng rắn, người đã tạo nên một nền tảng văn hóa doanh nghiệp phong phú đến mức, dù có quy định để đạt được, công ty đã liên tục loại bỏ những quan liêu trong bộ máy hoạt động của chính mình để phát minh ra những sản phẩm mới thú vị.',80,2023,532,350000,297500,'Bìa mềm','img/kd.jpg','Thế Giới '),(35,'Nghệ Thuật Đàm Phán','Tony Schwartz ,  Donald Trump','Nghệ Thuật Đàm Phán là cuốn sách được viết bởi tổng thống Donald Trump, cuốn sách sẽ cho bạn đọc thấy cách ông làm việc cũng như cách đàm phán để đến với thành công trong kinh doanh.',200,2020,328,109000,96000,'Bìa mềm','img/trump.jpg','NXB Trẻ'),(36,'Lập Chiến Lược Kinh Doanh Tối Giản','Vaughan Evans','Lập Chiến Lược Kinh Doanh Tối Giản đưa ra các giải pháp thực tế và cách tiếp cận dễ hiểu sẽ cho bạn thấy làm thế nào để phát triển nhanh chóng một chiến lược giúp cho doanh nghiệp của bạn tiến thẳng đến mục tiêu.',100,2019,224,108000,91800,'Bìa mềm','img/kd3.jpg','Thế Giới '),(37,'Lược Sử Thế Giới','E.H. Gombrich','Từ khi được viết ra bằng tiếng Đức năm 1935, Lược sử thế giới đã trở thành cuốn sách lịch sử bán chạy ở ba mươi ngôn ngữ. Năm 2005, cuốn sách được xuất bản bằng tiếng Anh với phần minh họa bổ sung, và phiên bản này bán được hơn nửa triệu bản trên toàn thế giới.',97,2019,426,320000,208000,'Bìa mềm','img/ls.jpg','Thế Giới '),(38,'Biến Động','Jared Diamond','Trong tác phẩm mới nhất vừa ra mắt năm 2019 – Biến động, Jared Diamond kể cho chúng ta câu chuyện các quốc gia đã vượt qua những biến cố lớn và hồi phục thành công như thế nào.',200,2022,576,319000,250000,'Bìa cứng','img/ls3.jpg','Dân Trí'),(39,'Súng, Vi Trùng Và Thép','Jared Diamond','Súng, Vi Trùng Và Thép - Sách là cả một quá trình cho sự tiến bộ của nhân loại, lịch sử loài người, có nhiều điều bổ ích và thú vị về thế giới mà bạn còn chưa biết.',200,2022,660,339000,298000,'Bìa mềm','img/ls4.jpg','Thế Giới '),(40,'Lịch Sử Thế Giới','Nguyễn Hiến Lê','Lịch sử thế giới hay còn gọi là lịch sử loài người, bắt đầu từ thời đại đồ đá cũ đến nay trong quá trình tiến hóa loài người. Đó là một hành trình lịch sử đem đến vĩ đại của loài người như hiện nay, rất đáng đọc và tìm hiểu. ',200,2023,848,195000,175000,'Bìa mềm','img/ls5.jpg','Văn Hóa Văn Nghệ'),(41,'Sự Im Lặng Của Bầy Cừu','Thomas Harris','Cuốn sách Sự Im Lặng Của Bầy Cừu (Tái Bản 2019) của tác giả Thomas Harris hội đủ yếu tố làm nên một cuốn tiểu thuyết trinh thám kinh dị xuất sắc với các tình tiết giật gân, cái chết luôn lơ lửng, với cuộc so găng của những bộ óc lớn mà không có chỗ cho kẻ ngu ngốc.',80,2019,359,115000,98000,'Bìa mềm','img/th.jpg','NXB Hội Nhà Văn'),(42,'Vòng Tròn Máu ','Edgar Wallace','Vòng Tròn Máu - TỔ CHỨC TỘI PHẠM CÓ THỂ KHIẾN CẢ LONDON PHẢI QUỲ XUỐNG.',200,2019,308,102000,81000,'Bìa mềm','img/th2.jpg','Văn Học'),(43,'Don Quixote','Miguel de Cervantes Saavedra','Một cuốn tiểu thuyết nổi tiếng mà cả người lớn và trẻ em đều biết đến. Những cuộc phiêu lưu liều lĩnh của Don Quixote gợi lên niềm vui và tiếng cười sảng khoái. Hiệp sĩ lang thang luôn tham gia vào những cuộc phiêu lưu khác nhau, mà từ đó không phải lúc nào cũng có thể chiến thắng.',200,2020,564,140000,119000,'Bìa mềm','img/cd.jpg','Văn Học'),(44,'Chủ Quyền','Niccolo Machiavelli','Nếu một người muốn biết ít nhất một phần nhỏ cách thức vận hành của bộ máy nhà nước, thì “Hoàng đế” bắt buộc phải đọc. Không thể gọi công việc sáng tạo này là nghệ thuật, mặc dù có những yếu tố tương ứng. Tác phẩm “Chủ quyền” bộc lộ tình cảm của tác giả về đất nước của mình, đất nước một thời có tính quyết định và không gì lay chuyển được.',200,2013,590,290000,250000,'Bìa cứng','img/cd5.jpg','Thế Giới '),(45,'Cuốn Theo Chiều Gió','Margaret Mitchell','Cuốn Theo Chiều Gió (Bìa Cứng) - Lấy bối cảnh từ cuộc nội chiến vô cùng khốc liệt giữa Bắc và Nam Mỹ, Cuốn Theo Chiều Gió với cốt truyện rõ ràng, logic, dễ hiểu, đã khắc họa một cách tài tình tâm trạng, tính cách và thân phận của nhiều lớp người trong chiến tranh và thời hậu chiến',200,2022,900,250000,200000,'Bìa cứng','img/lm.jpg','Văn Học'),(46,'Rừng Na Uy','Haruki Murakami','Cùng thoát thai từ nỗi buồn trong sáng về tồn tại, Rừng Na Uy, bài hát năm nào của Beatles, được lấy làm tên gọi cho cuốn tiểu thuyết tình yêu ngọt ngào sexy u sầu của Haruki Murakami. Bước vào Rừng Na Uy, để khám phá ra nỗi buồn Nhật Bản thời hiện đại.',200,2023,556,150000,127000,'Bìa mềm','img/lm3.jpg','Hội Nhà Văn'),(47,'Nhà Thờ Đức Bà Paris','Victor Hugo','Nhắc đến tiểu thuyết kinh điển “Nhà thờ Đức Bà Paris” chắc hẳn nhiều người sẽ phải ấn tượng với mối tình đầu khốn khổ của anh chàng gù Quasimodo đối với cô nàng Esmeralda ngây thơ, trong trắng. Chàng gù ấy là một kẻ mồ côi cha mẹ từ nhỏ, lớn lên trong sự ghẻ lạnh của mọi người bởi thân hình xấu xí không giống ai.',200,2018,126,159000,131000,'Bìa cứng','img/lm4.jpg','Văn Học'),(48,'Trà Hoa Nữ','Alexandre Dumas','Cuốn sách Trà Hoa Nữ là tiểu thuyết của Alexandre Dumas con.Cô kỹ nữ Marguerite rất yêu hoa trà, cô yêu chân thành chàng quý tộc trẻ tuổi Duval.',100,2018,312,190000,172000,'Bìa cứng','img/lm5.jpg','Văn Học'),(49,'Quẳng Gánh Ielts Đi Mà Sống','Lê Minh Hoàng ,  Lê Thanh Tùng','Cuốn sách Quẳng Gánh IELTS Đi Mà Vui Sống muốn đem lại một hướng đi cụ thể, rõ ràng, cùng những hành trang kỹ lưỡng nhất, cả về tri thức lẫn tâm lý, chiến thuật để bạn đọc tiến lên chinh phục môn tiếng Anh trong kì thi quốc tế IELTS và PTE.',200,2018,324,90000,76000,'Bìa mềm','img/nn3.jpg','Thế Giới '),(50,'Step Up To Ielts Academic - Writing','1980 Edu','Step Up To Ielts Academic Writing - sẽ là bộ cẩm nang không thể thiếu trên hành trình chinh phục và bứt phá điểm số nhanh chóng cho các thí sinh chinh phục kỳ thi IELTS Sắp tới!',200,2023,236,159000,135000,'Bìa mềm','img/image-3.jpg','Dân Trí'),(51,'Văn Phạm Pháp Văn','Nguyễn Kinh Đốc','Văn Phạm Pháp Văn - Grammaire Francaise (Có Phần Bài Tập Và Bài Sửa) - Sách biên soạn khá đầy đủ về các điểm ngữ pháp căn bản trong Tiếng Pháp. Với lối viết khá bình dị, đầy đủ, mãi mãi là người bạn đồng hành không thể thiếu của các bạn học sinh, sinh viên yêu mến môn Tiếng Pháp.',100,2023,442,130000,104000,'Bìa mềm','img/nn4.jpg','Đại Học Sư Phạm'),(52,'Sử Dụng Động Từ Tiếng Pháp','Lê Minh Cẩn','Sử Dụng Động Từ Tiếng Pháp được biên soạn nhằm mục đích giúp học sinh và học viên có được tài liệu tham khảo với phương pháp đơn giản, dễ hiểu và tra cứu nhanh.',100,2019,194,59000,47000,'Bìa mềm','img/nn5.jpg','Tổng Hợp TP.HCM'),(53,'Tuyển Tập Truyện Ngắn Koyoharu Gotouge','Koyoharu Gotouge','Tuyển Tập Truyện Ngắn Koyoharu Gotouge - Tập truyện này lưu giữ cả tác phẩm Săn người, người săn- tiền thân của series Thanh gươm diệt quỷ vừa được chuyển thể thành phim hoạt hình.',100,2021,200,25000,23000,'Bìa mềm','img/mg2.jpg','Kim Đồng'),(54,'A Box Of Siin - Hộp Truyện Siêu Ngắn','Đỗ Tiến','A Box Of Siin - Hộp Truyện Siêu Ngắn - Với những mẫu chuyện nhỏ xoay quanh nhân vật chính là anh chàng Siin cùng cô người yêu Nu và những người bạn của mình. Những câu chuyện được truyền tải rất “teen” đậm chất hài hước, châm biếm và cực kì bắt trend qua sự sáng tạo không kém phần “mặn” - “lầy” từ tác giả.',97,2022,184,98000,78000,'Bìa mềm','img/mg3.jpg','Dân Trí'),(55,'Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn','Huỳnh Thái Ngọc','Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn - Những mẩu chuyện được truyền tải rất “teen” đậm chất hài hước, châm biếm qua sự sáng tạo không kém phần “mặn mà” của tác giả càng trở nên độc đáo và thu hút.',150,2021,160,99000,80000,'Bìa mềm','img/mg4.jpg','Dân Trí');
/*!40000 ALTER TABLE book ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookhavecategory`
--

DROP TABLE IF EXISTS bookhavecategory;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE bookhavecategory (
  id_book int NOT NULL,
  id_cate int NOT NULL,
  KEY id_book (id_book),
  KEY id_cate (id_cate),
  CONSTRAINT bookhavecategory_ibfk_1 FOREIGN KEY (id_book) REFERENCES book (id),
  CONSTRAINT bookhavecategory_ibfk_2 FOREIGN KEY (id_cate) REFERENCES category (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookhavecategory`
--

LOCK TABLES bookhavecategory WRITE;
/*!40000 ALTER TABLE bookhavecategory DISABLE KEYS */;
INSERT INTO bookhavecategory VALUES (1,4),(2,4),(4,1),(5,1),(6,2),(7,2),(8,3),(9,3),(10,5),(11,5),(12,5),(13,6),(14,6),(15,7),(16,7),(17,8),(18,8),(19,9),(20,9),(21,10),(22,10),(23,1),(24,1),(20,1),(18,7),(15,10),(16,10),(26,10),(27,4),(29,1),(1,4),(1,4),(1,4),(1,4),(1,4),(1,4),(34,2),(35,2),(35,7),(36,2),(1,5),(37,3),(38,3),(39,3),(40,3),(29,9),(41,4),(42,4),(43,5),(44,5),(45,6),(46,6),(47,6),(48,6),(49,8),(50,8),(51,8),(52,8),(53,9),(54,9),(55,3),(55,3),(55,3),(55,3),(55,3),(55,3),(55,3),(55,3),(55,9);
/*!40000 ALTER TABLE bookhavecategory ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS category;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE category (
  id int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES category WRITE;
/*!40000 ALTER TABLE category DISABLE KEYS */;
INSERT INTO category VALUES (1,'Sách Thiếu Nhi'),(2,'Sách Kinh Doanh'),(3,'Sách Lịch Sử'),(4,'Sách Trinh Thám'),(5,'Văn Học Cổ Điển'),(6,'Tiểu Thuyết Lãng Mạn'),(7,'Sách Kĩ Năng Sống'),(8,'Sách Ngoại Ngữ'),(9,'Truyện Tranh, Manga'),(10,'Sách Tâm Lý');
/*!40000 ALTER TABLE category ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS comment;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  id int NOT NULL AUTO_INCREMENT,
  id_kh int NOT NULL,
  id_book int NOT NULL,
  number_star int NOT NULL,
  content varchar(300) DEFAULT NULL,
  time_post varchar(50) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY id_book (id_book),
  KEY id_kh (id_kh),
  CONSTRAINT comment_ibfk_1 FOREIGN KEY (id_book) REFERENCES book (id),
  CONSTRAINT comment_ibfk_2 FOREIGN KEY (id_kh) REFERENCES `account` (id)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES comment WRITE;
/*!40000 ALTER TABLE comment DISABLE KEYS */;
INSERT INTO comment VALUES (1,2,3,4,'hay','2023-05-05'),(2,2,4,5,'dở\r ','2023-05-05'),(3,2,4,5,'bad','2023-05-05'),(4,2,6,1,'fbef','2023-05-05'),(5,2,4,5,'ghe','2023-05-05'),(6,2,4,1,'rgtr','2023-05-05'),(7,2,7,1,'grgw','2023-05-05'),(8,2,7,5,'rgrwgwr','2023-05-05'),(9,2,7,4,'dfwe\r\n','2023-05-05'),(10,2,5,1,'egsr','2023-05-05'),(11,2,5,4,'rgeg','2023-05-05'),(12,2,5,3,'eegw','2023-05-05'),(13,2,5,2,'egweg','2023-05-05'),(14,2,1,0,'gnr','2023-05-05'),(15,2,1,1,'ukut','2023-05-05'),(16,2,1,2,'tfj5y','2023-05-05'),(17,2,1,3,'tjd','2023-05-05'),(18,2,1,4,'djtyhmtt','2023-05-05'),(19,2,1,5,'','2023-05-05'),(20,1,4,1,'','2023-05-05'),(21,2,8,0,'dở','2023-05-05'),(22,2,4,1,'teet','2023-05-06'),(23,2,9,1,'','2023-05-06'),(24,2,9,5,'','2023-05-06'),(25,9,4,5,'hello','2023-05-06'),(26,2,8,1,'fhdsbdg','2023-05-08'),(27,2,8,5,'','2023-05-08'),(28,2,20,1,'','2023-05-08'),(29,2,1,5,'hay','2023-05-09'),(30,3,7,0,'sách rất hay và thú vị','2023-05-09'),(31,3,7,2,'giá đắt\r\n','2023-05-09'),(32,2,18,4,'sách hay, hữu ích, tôi thật sự thích nó','2023-05-17'),(33,2,1,5,'awesome','2023-05-19'),(34,2,26,5,'Thật tuyệt, nó thật hữu ích.','2023-05-21'),(35,1,2,5,'Rất hay','2023-05-22'),(36,1,2,0,'hehe','2023-05-22'),(37,2,53,5,'rất là hay luôn á :3','2023-05-25'),(38,2,5,5,'thú vị','2023-10-10'),(39,2,3,5,'thú vị','2023-06-02'),(40,2,6,5,'hay','2023-06-03'),(41,2,6,5,'hay\r\n','2023-06-05'),(42,2,8,2,'gkl','2023-06-05');
/*!40000 ALTER TABLE comment ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `havebill`
--

DROP TABLE IF EXISTS havebill;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE havebill (
  id int NOT NULL AUTO_INCREMENT,
  id_kh int NOT NULL,
  id_book int NOT NULL,
  note varchar(100) DEFAULT NULL,
  pay_method varchar(45) NOT NULL,
  address varchar(45) NOT NULL,
  phone_number varchar(45) NOT NULL,
  ngay_dat date NOT NULL,
  amount int NOT NULL,
  sale int DEFAULT NULL,
  total int NOT NULL,
  status_bill int NOT NULL,
  PRIMARY KEY (id),
  KEY id_book (id_book),
  KEY id_kh (id_kh),
  CONSTRAINT havebill_ibfk_1 FOREIGN KEY (id_book) REFERENCES book (id),
  CONSTRAINT havebill_ibfk_2 FOREIGN KEY (id_kh) REFERENCES `account` (id)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `havebill`
--

LOCK TABLES havebill WRITE;
/*!40000 ALTER TABLE havebill DISABLE KEYS */;
INSERT INTO havebill VALUES (1,2,1,'gói cẩn thận','Thanh toán khi nhận hàng','Tức mặc, Nam Định','0988027568','2023-05-10',2,0,236000,0),(2,2,3,'gói cẩn thận','Thanh toán khi nhận hàng','Tức mặc, Nam Định','0988027568','2023-05-10',2,0,204000,0),(3,2,6,'gói cẩn thận','Thanh toán khi nhận hàng','Tức mặc, Nam Định','0988027568','2023-05-10',1,0,132000,0),(4,2,1,'Dto you ','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Nam Định','0988027568','2023-05-10',2,0,236000,0),(5,2,3,'Dto you ','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Nam Định','0988027568','2023-05-10',2,0,204000,0),(8,9,6,'gói cẩn thận','Thanh toán khi nhận hàng','xóm 17, Xuân Hòa, Xuân Trường, Nam Định','0335678786','2023-05-10',1,0,132000,0),(9,9,6,'uhdjv','Thanh toán khi nhận hàng','xóm 18, Xuân Hòa, Xuân Trường, Nam Định','0335678786','2023-05-10',1,0,132000,0),(10,9,3,'hubdf','Thanh toán khi nhận hàng','xóm 18, Xuân Vinh, Xuân Trường, Nam Định','0335678786','2023-05-11',1,0,102000,0),(11,9,3,'','Thanh toán khi nhận hàng','Tức mặc, Nam Định','0335678786','2023-05-11',1,0,102000,0),(12,9,4,'','Thanh toán khi nhận hàng','xóm 18, Xuân Hòa, Xuân Trường, Nam Định','0335678786','2023-05-11',1,0,63000,0),(13,9,1,'','Thanh toán khi nhận hàng','xóm 18, Xuân Hòa, Xuân Trường, Nam Định','0335678786','2023-05-11',1,0,118000,0),(14,9,8,'hello','Thanh toán khi nhận hàng','xóm 18, Xuân Hòa, Xuân Trường, Nam Định','0335678787','2023-05-11',1,0,465000,0),(15,9,5,'fgsv','Thanh toán khi nhận hàng','xóm 18, Xuân Hòa, Xuân Trường, Nam Định','0335678782','2023-05-11',1,0,93000,0),(16,9,5,'','Thanh toán khi nhận hàng','xóm 18, Xuân Hòa, Xuân Trường, Nam Định','0335678786','2023-05-11',1,0,93000,0),(17,2,1,'','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-05-18',2,0,236000,0),(18,2,3,'','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-05-18',2,0,204000,0),(19,2,4,'','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-05-18',1,0,63000,0),(21,2,4,'','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-05-19',1,0,63000,0),(22,2,3,'','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-05-19',2,0,204000,0),(24,2,3,'','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-05-19',2,0,204000,0),(26,9,5,'','Thanh toán khi nhận hàng','xóm 18, Xuân Hòa, Xuân Trường, Nam Định','0335678786','2023-05-24',1,0,93000,0),(27,9,37,'','Thanh toán khi nhận hàng','xóm 18, Xuân Hòa, Xuân Trường, Nam Định','0335678786','2023-05-24',3,0,624000,0),(28,22,1,'','Thanh toán khi nhận hàng','số 1, Nguyễn Văn Trỗi, Hà Đông, Hà Nội','0359584853','2023-05-24',1,0,118000,0),(29,22,54,'','Thanh toán khi nhận hàng','số 1, Nguyễn Văn Trỗi, Hà Đông, Hà Nội','0359584853','2023-05-24',1,0,78000,0),(30,2,6,'','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-05-25',1,0,132000,0),(33,2,6,'goi can than','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Nam Định','0988027568','2023-06-03',1,0,132000,0),(34,2,14,'goi can than','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Nam Định','0988027568','2023-06-03',1,0,109000,0),(36,2,14,'','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-06-05',1,0,109000,0),(37,2,54,'','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-06-05',1,0,78000,0),(38,2,6,'hgj,','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-06-05',3,0,396000,0),(39,2,14,'hgj,','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-06-05',1,0,109000,0),(40,2,54,'hgj,','Thanh toán khi nhận hàng','20 Ô Chợ Dừa, Hà Nội','0988027568','2023-06-05',1,0,78000,0);
/*!40000 ALTER TABLE havebill ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `havecart`
--

DROP TABLE IF EXISTS havecart;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE havecart (
  id_kh int NOT NULL,
  id_book int NOT NULL,
  amount int NOT NULL,
  total int NOT NULL,
  KEY id_kh (id_kh),
  KEY id_book (id_book),
  CONSTRAINT havecart_ibfk_1 FOREIGN KEY (id_kh) REFERENCES `account` (id),
  CONSTRAINT havecart_ibfk_2 FOREIGN KEY (id_book) REFERENCES book (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `havecart`
--

LOCK TABLES havecart WRITE;
/*!40000 ALTER TABLE havecart DISABLE KEYS */;
INSERT INTO havecart VALUES (3,5,3,279000),(9,5,1,93000),(1,2,3,717000),(2,6,3,396000),(9,37,3,624000),(22,1,1,118000),(22,54,1,78000),(2,14,1,109000),(1,3,2,204000),(9,1,4,472000),(2,54,1,78000);
/*!40000 ALTER TABLE havecart ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'qlbs'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-07 23:35:47
