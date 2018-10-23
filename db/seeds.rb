User.create!(
  name: "AdminCo",
  email: "nguyen.co@gmail.com",
  password: "123123",
  phone: "7714490",
  password_confirmation: "123123",
  admin: true,
  activated: true
)

Category.create!(
  title: "Lịch sử Việt Nam",
  description: "Lịch sử là một khoa học luôn chỉnh sửa lại mình trên cơ
    sở những phát hiện mới của khảo cổ, hoặc từ những tư liệu lịch sử bị
    lãng quên, bị thất lạc, bị che giấu vì những lý do xã hội nào đó, tới
    nay mới có điều kiện lộ sáng. Với những quyển sách hay về lịch sử Việt Nam sau đây,
    chúng tôi mong rằng bạn sẽ thỏa niềm đam mê tìm tòi và
    thêm tự hào với những thăng trầm mà dân tộc Việt Nam đã kinh qua."
)
 Category.create!(
  title: "Lập trình",
  description: "Chúng ta có rất nhiều tài liệu lập trình
   có sẵn miễn phí trên internet. Tuy nhiên, khi bạn bắt đầu học từ internet,
   thì thông tin ở đó có thể khiến bạn đi chệch hướng và chúng không thể chứa
   tất cả các chủ đề chi tiết như những cuốn sách được. Khi học lập trình qua sách bạn
   cũng sẽ tập trung hơn và không gặp phải những yếu tố phân tâm sao lãng.."
)
 Category.create!(
  title: "Tiểu thuyết văn học",
  description: "Văn học là dòng sách có nhiều đọc giả nhất trên thế giới,
  nhiều giải thưởng lớn như Pulitzer , Goncourt, Nobel phần lớn là những tựa văn
  học đình đám từ nhiều tác gia trên thế giới. Điều này đủ thấy sức ảnh hưởng và giá
  trị truyền tải của những quyển sách văn học, đặc biệt văn học nước ngoài là vô cùng lớn."
)
User.create!(
  name: "UserCo",
  email: "huuco.@gmail.com",
  password: "123123",
  phone: "7714490",
  password_confirmation: "123123",
  admin: false,
  activated: true
)

Book.create!(
  name: "Davinci code",
  image: "public/uploads/book/image/davincecode.jpg",
  author: "Dan Brown",
  description: "The Da Vinci Code The record-breaking bestseller
  The race to uncover the oldest secret has begun . . . An eminent
  man is brutally murdered in the world’s most famous museum.
  Around his body are a ring of codes, hastily drawn in blood.
  He died to protect a long-kept secret which Professor Robert
  Langdon must now uncover. It will be a race against time to
  decipher this final message.
  Can he get there before the killers do?",
  price: 135000,
  category_id: 3,
  number_of_pages: 592
)
Book.create!(
  name: "Tào tháo thánh nhân đê tiện",
  image: "taothaothanhnhandetient1.jpg",
  author: "Vương Hiểu Lỗi",
  description: "Tào Tháo tự Mạnh Đức là nhà chính trị,
  quân sự kiệt xuất cuối thời Đông Hán trong lịch sử Trung Quốc.
  Ông là người đặt nền móng cho thế lực quân sự cát cứ ở miền Bắc Trung Hoa,
  lập nên chính quyền Tào Ngụy thời Tam Quốc. Là người có công lớn trong việc
  dẹp loạn khăn vàng và Đổng Trác. Tuy nhiên, hình ảnh về ông không được các nhà
  nho ưa thích và thường được mang ra làm biểu tượng cho sự dối trá, vô liêm sỉ.
  Tào Tháo còn là một nhà thơ xuất sắc. Ông và hai con trai Tào Phi, Tào Thực được
  đời sau gọi là Tam Tào, cùng với nhóm Kiến An thất tử và nữ sĩ Thái Diễm hình
  thànhnên trào lưu mới trong văn học thời Hán mạt, gọi chung là Kiến An phong cốt.
  Bộ tiểu thuyết gồm 10 tập này là một bức tranh đầy đủ và toàn diện nhất về cuộc
  đời và con người của Tào Tháo. Trong tập đầu của bộ tiểu thuyết Tào Tháo – Thánh nhân đê tiện,
  độc giả sẽ ngược dòng lịch sử, trở lại mấy ngàn năm trước, kể từ khi Tào Tháo chào đời tại huyện Tiều,
  nước Bái. Ông sinh ra trong một gia đình giàu có, từ bé là người thông minh, ít để ý đến những thứ nhỏ
  nhặt, tính tình phóng đãng nhưng rất ham đọc sách, đặc biệt là binh thư, là người có quyền biến, nhiều
  mưu mẹo. Hình ảnh Tào Tháo được thể hiện trong bộ sách là người có hai mặt khác nhau. Qua mỗi sự kiện,
  Tào Tháo thể hiện là một người đê hèn, gian xảo trong suy nghĩ và hiểm độc khi thu phục quần hùng tam
  quốc. Bên cạnh đó, ông lại là một bậc thánh nhân giàu tình cảm, thương yêu dân chúng và đau đáu cho nỗi
  lo của thiên hạ.
",
  price: 225000,
  category_id: 3,
  number_of_pages: 562
)
Book.create!(
  name: "Đừng nói chuyện với cô ấy",
  image: "/images/dungnoichuyenvoicoay.jpg",
  description: "Tuyệt vọng, sụp đổ, tự hủy hoại mình, tự vẫn…
  Điều đáng sợ không phải ở chỗ chúng ta đã làm ra những việc này.
  Mà ở chỗ chúng ta căn bản không biết tại sao mình lại làm như vậy.
  Dùng tâm lý để phạm tội, dùng ý nghĩ để giết người.
  Đó chính là sức mạnh đáng sợ của hành vi “ám thị giết người”.
  Những người tự kết liễu cuộc đời mình vì sự ám thị của một ai đó…
  Rốt cuộc đây là một sức mạnh thần kỳ và khiến người ta kinh sợ tới mức nào?
  Nó gần như đã làm đảo lộn mọi khái niệm về tâm lý học và tâm lý học tội phạm
  thông thường, hóa ra cao thủ thực sự chỉ cần dùng mấy câu nói, mấy động tác
  là đã có thể giết người trong vô hình; hóa ra tinh thần chỉ cần đủ mạnh là có
  thể đưa người khác vào chỗ chết. Thế giới nội tâm của con người rốt cuộc phức
  tạp tới mức độ nào? E rằng so với vũ trụ mênh mang còn bao la rộng lớn và sâu
  thẳm khó lường hơn! Đừng nói chuyện với cô ấy được xem là cuốn tiểu thuyết trinh
  thám tâm lý tội phạm “cân não nhất” trên văn đàn Trung Quốc. Những triết lý về phân
  tâm học của Sigmund Freud được tác giả vận dụng khá nhuần nhuyễn trong từng câu chữ,
  do đó, độc giả nhất định sẽ bị cuốn hút vào từng trang sách, sống cùng nhân vật với
  những cảm xúc hồi hộp, lo lắng và sợ hãi vô cùng ngoạn mục. Có thể nói, Đừng nói
  chuyện với cô ấy là một cuốn bách khoa toàn thư hữu ích cho người mới “nhập môn”
  thể loại tiểu thuyết trinh thám tâm lý tội phạm này.
  Tuy nhiên, tất cả những tình tiết được đưa ra trong truyện chỉ là những ví dụ nho nhỏ
  hư cấu nhằm giải nghĩa một bộ phận triết lý trong phân tâm học, không mang tính xác thực
  và chỉ có nhiệm vụ làm tăng thêm độ hấp dẫn cho tác phẩm. Thể theo nguyện vọng của đa số độc giả,
  Ban Biên tập xin được giữ nguyên các tình tiết và câu từ của tác giả, để bạn đọc có thể phần nào
  hiểu rõ hơn về các lý thuyết phân tâm học của Sigmund Freud.",
  author: "Ngộ Cẩn",
  category_id: 1,
  price: 95,
  number_of_pages: 1211
)
# Request.create!(
#   book_name: "Đừng nói chuyện với cô ấy",
#   user_id: 2,
#   content: "borrow",
#   status: "progress"
# )
# UserBook.create!(
#     read: true,
#     favorite: false,
#     reading: false,
#     request: false,
#     user_id: 1,
#     book_id: 1
#   )
