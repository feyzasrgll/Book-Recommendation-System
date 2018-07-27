using System;
using System.Data;
using System.Data.SqlClient;

namespace BookRecommendationSystem
{
    public class DbManager
    {
        SqlConnection connection;
        SqlCommand command;
        SqlDataAdapter adapter;
        DataSet ds;

        public DbManager()
        {
            connection = new SqlConnection(@"Data Source=GRUNDıG;Initial Catalog=BookRecommendationSystem;Integrated Security=True");
            command = new SqlCommand();
            command.Connection = connection;

            adapter = new SqlDataAdapter();
            ds = new DataSet();
        }

        public int GetUserId(string UserName)
        {
            command.CommandText = "select Id from dbo.[User] where UserName=@username";
            command.Parameters.AddWithValue("@username", UserName);
            adapter.SelectCommand = command;
            DataSet dst = new DataSet();
            adapter.Fill(dst);
            int id = Convert.ToInt32(dst.Tables[0].Rows[0]["Id"]);
            return id;
        }

        public bool Signup(string name,string surname,string username, string password, string gender, DateTime dob, string picture)
        {
            command.CommandText = "SELECT * FROM dbo.[User] WHERE UserName=@userName";
            command.Parameters.Clear();
            command.Parameters.AddWithValue(@"userName", username);
            adapter.SelectCommand = command;

            adapter.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                return false;
            }
            else
            {
                connection.Open();
                command.CommandText = "insert into dbo.[User] (FirstName, Surname, UserName, UserPassword, UserGender, UserDob, UserPicture) values (@userfirstname, @usersurname, @username, @userpassword, @usergender, @userdob, @userpicture)";

               command.Parameters.Clear();
               command.Parameters.AddWithValue("@userfirstname",name);
               command.Parameters.AddWithValue("@usersurname", surname);
               command.Parameters.AddWithValue("@username", username);
               command.Parameters.AddWithValue("@userpassword", password);
               command.Parameters.AddWithValue("@usergender", gender);
               command.Parameters.AddWithValue("@userdob", dob);
               command.Parameters.AddWithValue("@userpicture", picture);

                command.ExecuteNonQuery();
                connection.Close();

                return true;
            }
        }

        public bool Login(string username, string password)
        {
            command.CommandText = "select * from dbo.[User] where UserName='"+ username + "'and UserPassword='" + password + "'";
            adapter.SelectCommand = command;

            adapter.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }
        
        public bool ManagerLogin(string username, string password)
        {
            command.CommandText = "select * from dbo.[Manager] where ManagerUserName=@musername and ManagerUserPassword=@muserpassword";
            command.Parameters.AddWithValue("@musername", username);
            command.Parameters.AddWithValue("@muserpassword", password);
            adapter.SelectCommand = command;

            adapter.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)

                return true;
            else
                return false;
            
        }
        
        public DataSet GetMyBooks()
        {
            DataSet dset = new DataSet();
            command.CommandText = "select Id,BookName from dbo.[Book]";
            adapter.SelectCommand = command;
            adapter.Fill(dset);
            return dset;
        }
        
        public void AddComment(int BookId, int val, string Comment, int UserId, int point)
        {
            connection.Open();
            command.CommandText = "insert into dbo.[BookOperations] (BookId,IsRead, UserComment, UserId,BookScore) values (@bookid,@isread,@usercomment,@userid,@bookscore)";
            command.Parameters.AddWithValue("@bookid", BookId);
            command.Parameters.AddWithValue("@isread", val);
            command.Parameters.AddWithValue("@usercomment", Comment);
            command.Parameters.AddWithValue("@userid", UserId);
            command.Parameters.AddWithValue("@bookscore", point);
            command.ExecuteNonQuery();
            connection.Close();
        }
        public void AddQuote(int BookId,int val, int PageNo, String Quote, int UserId,int point)
        {
            connection.Open();
            command.CommandText = "insert into dbo.[BookOperations] (BookId,IsRead, UserQuote, PageNo, UserId,BookScore) values (@bookid,@isread,@userquote,@pageno,@userid,@bookscore)";
            command.Parameters.AddWithValue("@bookid", BookId);
            command.Parameters.AddWithValue("@userquote", Quote);
            command.Parameters.AddWithValue("@pageno", PageNo);
            command.Parameters.AddWithValue("@userid", UserId);
            command.Parameters.AddWithValue("@userid", UserId);
            command.Parameters.AddWithValue("@bookscore", point);
            command.ExecuteNonQuery();
            connection.Close();
        }
        public DataSet GetMyPopularBooks()
        {
            connection.Open();
            command.CommandText = "SELECT TOP(3) Book.Id AS KitapId, Book.BookName as KitapAdi, (Writer.WriterName + ' ' + Writer.WriterSurname) as YazarAdSoyad, " +
                "(SELECT COUNT(IsRead) FROM BookOperations " +
                "WHERE BookId=Book.Id AND IsRead=1) AS OkunmaSayisi " +
                "FROM Book, Writer, Matches WHERE Book.Id = Matches.BookId AND Writer.Id = Matches.WriterId " +
                "ORDER BY OkunmaSayisi DESC";
            adapter.SelectCommand = command;
            adapter.Fill(ds);

            return ds;
        }
        public DataSet GetBookDetails(int bookId)
        {
            connection.Open();
            command.CommandText = "SELECT b.BookName AS KitapAdi, b.BookDetails AS KitapDetay, (w.WriterName + ' ' + w.WriterSurname) AS Yazar, b.BookPublisher AS Yayinevi, " +
                "(SELECT AVG(CAST(BookScore as float)) FROM BookOperations bo WHERE bo.BookId = b.Id) AS KitapPuani, " +
                "(SELECT COUNT(IsRead) FROM BookOperations bo WHERE bo.BookId=b.Id AND IsRead=1) AS OkunmaSayisi " +
                "FROM Book b, Writer w, Matches m " +
                "WHERE b.Id=m.BookId AND w.Id=m.WriterId AND b.Id=@bookId";
            command.Parameters.AddWithValue("@bookId", bookId);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public DataSet GetMyComments(int kId)
        {
            connection.Open();
            command.CommandText = "select dbo.[User].UserName, BookOperations.UserComment from dbo.[User],Book,BookOperations where @BookId=Book.Id and @BookId=BookOperations.BookId and dbo.[User].Id=BookOperations.UserId ";
            command.Parameters.AddWithValue("@BookId", kId);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public DataSet GetMyQuotes(int kId)
        {
            connection.Open();
            command.CommandText = "SELECT dbo.[User].UserName, BookOperations.PageNo, BookOperations.UserQuote FROM dbo.[User],Book,BookOperations WHERE Book.Id=@bookId and Book.Id=BookOperations.BookId and dbo.[User].Id=BookOperations.UserId";
            command.Parameters.AddWithValue("@bookId", kId);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public DataSet GetmyTopPointBooks()
        {
            connection.Open();
            command.CommandText = "select top(3) Book.Id as BId,Book.BookName, (select avg(cast(BookScore as float))from BookOperations " +
                "where Book.Id=BookOperations.BookId) as AverageScore from Book order by AverageScore Desc";
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public DataSet GetMyTopBookInfo(int BookId)
        {
            connection.Open();
            command.CommandText = "select Book.BookName as KitapAdi, (Writer.WriterName + ' ' + Writer.WriterSurname) as Yazar,Book.BookPublisher as Yayinevi,(select avg(cast(BookScore as float))" +
                " from BookOperations where @BookId=BookOperations.BookId) as KitapPuani,(select count(IsRead) from BookOperations where @BookId= BookOperations.BookId and IsRead=1)" +
                " as OkunmaSayisi, Book.BookDetail" +
                "" +
                "s as KitapDetay from Book,Writer,Matches where @BookId=Book.Id and @BookId = Matches.BookId and Writer.Id= Matches.WriterId";
            command.Parameters.AddWithValue("@BookId", BookId);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }

        public DataSet PopularWriters()
        {
            connection.Open();
            command.CommandText = "SELECT DISTINCT TOP(5) w.Id AS WriterId, b.Id AS BookId, (w.WriterName + ' ' + w.WriterSurname) AS WriterNameSurname, b.BookName, " +
                "(SELECT COUNT(IsRead) FROM BookOperations bo2 WHERE bo2.BookId=b.Id AND IsRead=1) AS WriterReadingCount " +
                "FROM Writer w, Matches m, Book b, dbo.[User] u " +
                "WHERE b.Id=m.BookId AND w.Id=m.WriterId " +
                "ORDER BY WriterReadingCount DESC";
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }

        public DataSet GetMyWriterInfo(int WriterId)
        {
            command.CommandText = "SELECT (Writer.WriterName + ' '+ Writer.WriterSurname) as WriterNameSurname,Writer.WriterDob, Writer.WriterDod " +
                " FROM Writer" +
                " WHERE Writer.Id=@pwriterid";
            command.Parameters.AddWithValue("@pwriterid", WriterId);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public DataSet WriterBooks(int WriterId)
        {
            command.CommandText = "SELECT b.Id AS BookId, b.BookName, b.BookDetails, b.BookPublisher " +
                "FROM Writer w, Book b, Matches m " +
                "WHERE w.Id=m.WriterId AND b.Id=m.BookId AND w.Id=@WriterId";
            command.Parameters.AddWithValue("@WriterId", WriterId);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public DataSet GetMyUserSearchResult(string text)
        {
            command.CommandText = "SELECT dbo.[User].Id,dbo.[User].UserName" +
                " from dbo.[User]" +
                " where dbo.[User].UserName like '%' + @ptext + '%'";
            command.Parameters.AddWithValue("@ptext", text);
            
            adapter.SelectCommand = command;
            
            adapter.Fill(ds);
            return ds;
        }
        public DataSet GetMyUserInfo(int UId)
        {
            command.CommandText = "SELECT U.Id, U.UserName, (U.FirstName+' '+U.Surname) AS NameSurname" +
                " FROM dbo.[User] U" +
                " WHERE U.Id=@UserId";
            command.Parameters.AddWithValue("@UserId", UId);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public DataSet GetMyBookSearchResult(string text)
        {
            command.CommandText = "SELECT Book.Id,Book.BookName" +
                " from Book" +
                " where Book.BookName like '%' + @ptext + '%'";
            command.Parameters.AddWithValue("@ptext", text);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public DataSet GetMyWriterSearchResult(string text)
        {
            command.CommandText = "SELECT Writer.Id, (Writer.WriterName+' '+Writer.WriterSurname) as WriterNameSurname" +
                " from Writer" +
                " where (Writer.WriterName+' '+Writer.WriterSurname) like '%' + @ptext + '%'" ;
            command.Parameters.AddWithValue("@ptext", text);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public void AddBookasManager(string name,string publisher, string detail)
        {
            command.CommandText = "INSERT INTO Book(BookName,BookPublisher,BookDetails)" +
                " VALUES (@pname,@ppublisher,@pdetail)";
            command.Parameters.AddWithValue("@pname",name);
            command.Parameters.AddWithValue("@ppublisher",publisher);
            command.Parameters.AddWithValue("@pdetail",detail);
            connection.Open();
            adapter.SelectCommand = command;   
            command.ExecuteNonQuery();
            connection.Close();
        }
        public DataSet GetMyUserQotesandComments(int Id)
        {
            command.CommandText = "SELECT b.BookName,bo.BookScore,bo.PageNo,bo.UserQuote,bo.UserComment " +
                "FROM dbo.[User] u, Book b,BookOperations bo " +
                "WHERE bo.BookId=b.Id AND bo.UserId=u.Id AND u.Id=@pId";
            command.Parameters.AddWithValue("@pId",Id);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public void SendMessage(int SenderId, int SendeeId,string Event, string Text,DateTime dt)
        {
            command.CommandText = "insert into dbo.Messaging(SenderId,SendeeId,Eventt,TextMessage,DeliveryTime) " +
                "values(@psender,@psendee ,@pevent,@ptext,@pdt)";
            command.Parameters.AddWithValue("@psender", SenderId);
            command.Parameters.AddWithValue("@psendee", SendeeId);
            command.Parameters.AddWithValue("@pevent",Event);
            command.Parameters.AddWithValue("@ptext", Text);
            command.Parameters.AddWithValue("@pdt", dt);
            connection.Open();
            adapter.SelectCommand = command;
            command.ExecuteNonQuery();
            connection.Close();
        }
        public DataSet CheckMyMessages(int Id)
        {
            command.CommandText = "SELECT m.SenderId, u.UserName,m.Eventt,m.TextMessage " +
                "FROM Messaging m,dbo.[User] u " +
                "WHERE m.SenderId=u.Id AND m.SendeeId=@pId";
            command.Parameters.AddWithValue("@pId", Id);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public DataSet RecommendedUserbyBookCount(int id)
        {
            command.CommandText = "SELECT DISTINCT TOP(2) u.UserName AS Person,  COUNT(*) AS BookCount " +
                " FROM dbo.[User] u" +
                " JOIN BookOperations bo ON u.Id = bo.UserId" +
                " JOIN BookOperations bo2 ON bo.BookId= bo2.BookId and bo.UserId <> bo2.UserId" +
                " JOIN dbo.[User] u2 ON bo2.UserId= u2.Id" +
                " WHERE u2.Id= @pId" +
                " GROUP BY u.UserName, u2.UserName";
            command.Parameters.AddWithValue("@pId", id);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        public DataSet RecommendedUserByBookScore(int id)
        {
            command.CommandText = "SELECT DISTINCT TOP(7) u.UserName AS Person" +
                " FROM dbo.[User] u" +
                " JOIN BookOperations bo ON u.Id = bo.UserId" +
                " JOIN BookOperations bo2 ON bo.BookId= bo2.BookId and bo.UserId = bo2.UserId" +
                " JOIN dbo.[User] u2 ON bo2.UserId= u2.Id" +
                " WHERE u2.Id= @pid" +
                " GROUP BY u.UserName, u2.UserName";
            command.Parameters.AddWithValue("@pid", id);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            return ds;
        }
        
    }

}