import 'package:flutter/foundation.dart';
import 'bookmark_service.dart';

class Article {
  final String id;
  final String title;
  final String snippet;
  final String content;
  final String imageUrl;
  final String category;
  final String author;

  Article({
    required this.id,
    required this.title,
    required this.snippet,
    required this.content,
    required this.imageUrl,
    required this.category,
    required this.author,
  });
}

class ArticleService extends ChangeNotifier {
  List<Article> _articles = [];
  String _searchQuery = '';
  String _selectedCategory = '';
  final BookmarkService _bookmarkService;

  ArticleService(this._bookmarkService);

  String get selectedCategory => _selectedCategory;

  List<Article> get articles {
    return _articles
        .where((article) =>
            article.title.toLowerCase().contains(_searchQuery.toLowerCase()) &&
            (_selectedCategory.isEmpty ||
                article.category == _selectedCategory))
        .toList();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Future<void> fetchArticles() async {
    // Simulated API call
    await Future.delayed(const Duration(seconds: 1));
    _articles = [
      Article(
        id: '1',
        title: 'Understanding Mental Health',
        snippet:
            "The term \"mental health\" encompasses our social, psychological and emotional well-being and impacts the way we feel, think and behave. It influences how we connect with others, how we make decisions and many other aspects of daily life. Poor mental health can impact physical health, increasing the risk for health conditions such as diabetes, heart disease and stroke. How we handle challenges and stressful situations also can affect our overall well-being.",
        content:
            ''' The term "mental health" encompasses our social, psychological and emotional well-being and impacts the way we feel, think and behave. It influences how we connect with others, how we make decisions and many other aspects of daily life. Poor mental health can impact physical health, increasing the risk for health conditions such as diabetes, heart disease and stroke. How we handle challenges and stressful situations also can affect our overall well-being. At the University of Chicago Medicine, the mission to provide superior healthcare to patients and communities starts with a healthy staff who feel they are supported and have access to the resources they need. To bring increased attention to the topic and better define and understand the many facets of Royce Lee, MD, Associate Professor of Psychiatry and Behavioral Neuroscience, for an in-depth look into this very important topic 
                
Can you please define mental health?

Mental health is the state you are in when your body and mind are collectively working together. A helpful way to think of it is that your brain working in a way to serve you well. The brain is always doing as much as it can with very few resources. And there is a limit. When your mental health is doing poorly, you can begin to feel as if you’re spiraling or experiencing some type of disconnection in your world. That can ultimately lead to mental illnesses and leave an individual feeling stuck. I think it’s easy to remember that, just as your car will need a tune-up, your brain will need to restore its resources as well.    

How do you know it’s time to seek help?

Sometimes we don’t know ourselves, but somebody close to us is aware that we need help. Sometimes, there’s a colleague, a friend or a family member who sees you struggling. Other times, we can know it’s time to seek help when daily life becomes challenging, even when stressors haven’t changed. So, changes in eating habits, sleeping patterns and having intense emotions, such as anxiety or despair, are some key signs for people to watch for.

What are some barriers?

I think that it’s also important to acknowledge the stigma associated with mental health. We need to normalize seeking counseling and help, and be comfortable with speaking out about our struggles.

There’s also the issue of access and the difficulties in getting care. Your primary doctor is always a great resource. They can begin treatment with you or begin the referral process. It is also important to be aware that, while it can be difficult to get an appointment, the emergence of telehealth has made it much easier to see a provider.

Can your mental health change over time?

For all of us, our mental health changes to help us adapt to the world around us. We can think of mental health as the sum total of mental, emotional and social resources available to meet the challenges the world throws at us. When our resources run low, we start to have symptoms or difficulties. Thus, the state of our mental health is always changing depending on the balance of resources and challenges. Research shows that most people will have mental health problems at some point in their lives; this is often not acknowledged when we try to think in terms of normal versus abnormal. The pandemic has made this clear to most of us. New research about mental health also reveals how tied our mental health is to our body.

For example, inflammation caused by activation of the immune system is very closely tied to what happens in our brain. Our inflammatory load changes from day to day depending on many factors: nutrition, pollution, stress, viral illness. Our mental health can follow along these ups and downs. This adds a new twist to the conversation that makes it clearer that sometimes the cause of mental health problems has nothing to do with the choices that we make or the values we may hold.

Is there a difference between mental health and mental illness?

There is an important difference between the concepts of mental health and mental illness. We increasingly think of mental health as a spectrum of mental and emotional wellbeing. Where we are on that spectrum is dynamic; it changes over time. It is entirely normal to have challenges at some point in our life. On the other hand, mental illness is a medical and scientific understanding of things like depression, post-traumatic stress disorder, manic depression and other disorders treated with psychotherapy or medications. It is helpful here to think of medical illness as an example. If a person has a history of high blood pressure that is controlled with medications or diet and they feel healthy, are they “ill?" Most people would say no, that person is not medically ill. In other words, disorders are mental illnesses. However, people are not “mentally ill” really. It is more accurate to say there are people who may have a mental illness.

It is understandable that these terms are confusing. As with most ideas, we inherit ideas from the ages that came before our own. Historically, ideas of demonic possession and really catastrophic psychiatric problems were shaped by issues such as neurosyphilis. Our cultural or instinctive view of even milder problems like depression, known previously as melancholia, were shaped by cultural experiences of these states as untreatable. And many problems that we now consider to be “mental illnesses” were not recognized at all.

So, in summary, mental illness is a term used for clinicians to guide therapy and scientists to study disorders. As people and as a society though, thinking of mental health as a dynamic state with ups and downs is much closer to the truth of how things actually work.

How common are mental illnesses?

According to the CDC, more than 50% of people will be diagnosed with a mental illness or disorder at some point in their lifetime, and 1 in 5 people in the U.S. will experience mental illness in a given year. In addition, 1 in 5 children have had or will have a seriously debilitating mental illness.

What is something that you would especially want people to understand and know about mental health?
Mental health problems are normal and not a sign of abnormality. It is not a sign of a moral flaw. And how we cope or learn to cope with the resources given to us looks different for everyone. It is really important that we decrease the stigma around asking for help.


''',
        imageUrl:
            'https://media.licdn.com/dms/image/D5612AQFSxufBgwgbsg/article-cover_image-shrink_720_1280/0/1685665846020?e=2147483647&v=beta&t=AL0pX6-7FBud64l-QiHPt8oGAYKDbyO8e3uMJ4xgEAw',
        category: 'Mental Health',
        author: 'Chelsea Johnson, 2022',
      ),
      Article(
        id: '2',
        title: 'HIV Prevention Strategies',
        snippet:
            'The best way to prevent HIV is to understand how the virus is transmitted and take steps to reduce your risk. If you’re living with HIV, understanding these practices can help prevent transmission to others.',
        content: '''
The best way to prevent HIV is to understand how the virus is transmitted and take steps to reduce your risk. If you’re living with HIV, understanding these practices can help prevent transmission to others.

HIV can’t be transmitted through saliva or skin-to-skin contact, such as hugging or shaking hands. The virus can only be transmitted by exchanging certain bodily fluids, including genital secretions and blood.

As a result, transmission most frequently occurs during condomless sex or shared use of syringes and other drug injection equipment.

Adopting certain harm reduction strategies, including safer sex and safer substance use, can help reduce the risk of contracting or transmitting the virus.


https://www.healthline.com/health/hiv-aids/hiv-prevention/hiv-prevention
''',
        imageUrl:
            'https://images.everydayhealth.com/images/stds/hiv-aids/cs-hiv-facts-about-hiv-aids-know-1440x810.jpg?sfvrsn=a288f66e_1',
        category: 'HIV and STD',
        author: 'Tess Catlett, 2024',
      ),
      Article(
        id: '3',
        title: 'Ending discrimination and building SOGIESC-inclusive societies',
        snippet:
            'June has commemorated the lesbian, gay, bisexual, transgender, queer and/or questioning, and other sexual identities (LGBTQ+) community’s history and ongoing pursuit of equal rights. ',
        content: '''
June has commemorated the lesbian, gay, bisexual, transgender, queer and/or questioning, and other sexual identities (LGBTQ+) community’s history and ongoing pursuit of equal rights. Globally, people with diverse sexual orientations, gender identities, gender expressions, and sex characteristics (SOGIESC), an umbrella term that encompasses the LGBTQ+ community, continue to experience stigma and discrimination stemming from cultural and societal norms. Developing Asia and the Pacific is no exception, with large disparities in LGBTQ+ rights detrimental to economies in the region.

Legal and social barriers and their impact on sustainable development

People with diverse SOGIESC face discrimination in public spaces and barriers that limit their access to basic human rights. They are sometimes denied access to comprehensive health coverage because their gender identities do not fall within societal norms (Mizra and Rooney 2018). Additionally, in developing Asia, many people with diverse SOGIESC work in the informal sector, where access to quality and affordable health care is often limited, and such exclusion leads to poorer health and increased vulnerabilities to catastrophic events.

Education and employment are often exclusive, lacking equitable opportunities and little to no protection from discrimination and harassment in the workplace and school settings (Thoreson 2017). For access to housing, people with diverse SOGIESC encounter numerous challenges with approval for loans, qualifying for government-subsidized housing, and other eligibility issues. Globally, 109 countries do not have any protection against SOGIESC-based discrimination when it comes to housing, such as discrimination when applying for housing or by landlords and property owners (Equaldex 2023).

People with diverse SOGIESC also encounter discrimination when it comes to social protection, which was particularly evident during the recent pandemic as many work in the informal sector and were the first to be let go by their employers.  Moreover, some were denied access to social safety nets and cash transfers as these programs often do not have substantiative guidance on working with people with diverse SOGIESC (Edge Effect 2021). Policies often do not include any mention of this group of people, and current instruments to measure social protection do not fully capture their exclusion, so they continue to be left out.

These barriers disproportionately expose people with diverse SOGIESC to risks of poverty and mental and physical health problems, further exacerbating the current inequality and poverty challenges many countries are facing.

Beyond moral and human rights issues, excluding people with diverse SOGIESC from equitable opportunities to participate in the economy and society also impacts economic productivity. Studies have put a monetary value on this exclusion in the region and beyond, estimating that lower quality of education and years of education combined with inefficiency and lower productivity in the labor market and disparities in health lead to a loss of human capital through untapped potential and a reduction of gross domestic product by up to 1% (Badgett 2021).

Additionally, the social and economic impacts of SOGIESC-based exclusion and discrimination impede progress toward achieving more than half of the Sustainable Development Goals (SDGs), most notably SDG 5 (gender equality) but also SDG 1 (no poverty), SDG 3 (good health and well-being), SDG 4 (quality education), SDG 8 (decent work and economic growth), SDG 10 (reduced inequalities), SDG 11 (sustainable cities and communities), and SDG 16 (peace, justice and strong institutions).

What can be done?

Building SOGIESC-inclusive societies requires a multisectoral approach, where different actors work together to ensure the rights and well-being of everyone, regardless of how they identify, to benefit the whole of society.

Governments can play a critical role in advancing the rights of people with diverse SOGIESC through designing inclusive policies that specifically mention these people and removing discriminatory policies. By recognizing that exclusionary social norms and laws will inhibit development, governments are in a position to lead their countries toward more prosperous growth. Another key component is building understanding of sexual diversity, human rights, and non-discrimination among civil servants and the rest of society through educational training programs and curricula in schools and encouraging leaders to support the cause, even amid deep cultural and societal barriers.

Multilateral development banks, international organizations, academic institutions, and think tanks are important drivers of change and promote inclusive and sustainable development. Through improving data collection and assessment, they can provide a better understanding of the impacts of SOGIESC-based discrimination and work closely with governments to promote evidence-based policies. It is also important for these institutions to align their workforce and operations with this inclusive development agenda.

The private sector needs to work toward providing more equitable opportunities for people with diverse SOGIESC across all stages of employment, from the hiring process to performance evaluations, merit increases, and career advancement opportunities. The private sector must also create more inclusive working environments by developing policies that protect people from SOGIESC-based discrimination in the workplace and providing the necessary resources for all staff through education, training, and other supporting services. It is also important for companies to work together, bridging the LGBTQ+ community for stronger corporate allyship and economic empowerment.

Finally, civil society must continue to put pressure on policy makers to act on this issue beyond advocacy and spreading awareness. Civil society organizations have the platform to bring people together to challenge the status quo, where their voices are amplified, and they have a stronger chance at convincing policy makers that those with diverse SOGIESC matter and that these issues need to be addressed.

By ensuring equitable opportunities and rights for people with diverse SOGIESC, countries will fare better at securing a prosperous future for all with inclusive and sustainable development. Beyond the month of June, everyone must do their part in “walking the talk,” and this can only be done through adopting actual policies for both the public and private sectors.

https://www.asiapathways-adbi.org/2023/06/ending-discrimination-and-building-sogiesc-inclusive-societies/
''',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/3/31/SOGIE_LGBT_rally_at_People_Power_Monument.jpg',
        category: 'SOGIESC',
        author: 'Derek Honda, 2023',
      ),
      Article(
        id: '4',
        title: 'Seven Self-care Tips for College Students',
        snippet:
            'As summer comes to a close and you make your way back to your (online or in-person) campus, it can be challenging to refocus your energy and get back into the swing of academic life. College can be an incredibly exciting time for young adults – and it comes with potential stressors like financial burdens, academic pressure, homesickness and pandemic-related hardships like social isolation, any or all of which can lead to mental health challenges.',
        content: '''
As summer comes to a close and you make your way back to your (online or in-person) campus, it can be challenging to refocus your energy and get back into the swing of academic life. College can be an incredibly exciting time for young adults – and it comes with potential stressors like financial burdens, academic pressure, homesickness and pandemic-related hardships like social isolation, any or all of which can lead to mental health challenges.

In 2021, a study by the American College Health Association found that 48% of college students reported moderate or severe psychological stress, 53% reported being lonely, and 26% had considered suicide. It’s important for students to practice self-care to reduce stress, avoid burnout and maintain and enhance overall health and wellbeing. According to the Mental Health First Aid (MHFA) curriculum, practicing self-care helps you be able to adapt to changes, build strong relationships and recover from setbacks.

Keep these tips in mind to help you or someone you know practice self-care and take care of their mental wellbeing while in college.*

1.Set a routine – and keep it.
In high school, students tend to have the same schedule every day – something along the lines of breakfast, school, extracurricular activities, dinner, homework, repeat. This structure isn’t a given in college; classes will be at different times, clubs might meet at night and students might find themselves sleeping in regularly when they don’t have morning classes. But having a routine has been shown to lower people’s stress levels and help them feel more productive and focused. Consider planning to wake up, eat, study and exercise around the same times every day. This will help give you a sense of control, lower your stress levels and even improves focus.

2. Get enough sleep.
An article published by Harvard states that over 50% of college students get less than seven hours of sleep per night (the minimum number of hours recommended for healthy adults by The National Sleep Foundation). Sleep deprivation can lead to symptoms of depression, but college students who prioritize sleep are likely to see positive effects like improvements in academic performance, their ability to concentrate while studying and less daytime sleepiness. Need more inspiration? Check out the American Academy of Sleep Medicine’s tips for a good night’s sleep.

3. Exercise.
The U.S. Department of Health and Human Services recommends adults exercise at least 2.5 hours each week – that’s only about 20 minutes per day! In addition to staying physically fit, exercise has many proven health benefits, such as making people happier, improving functional capacity, lowering risk of diseases and decreasing depression and anxiety. Taking a walk around campus, going to the gym or participating in an organized fitness class are all things students can do to get a little exercise in. For exercise to truly feel like self-care, MHFA recommends you choose a form of exercise that you like.

4. Eat nutritious meals.
Of course a well-balanced diet is good for physical health, but it is also crucial to mental wellbeing. A nutritious, balanced diet can help you think clearly and improve your attention span, whereas eating lots of processed foods can lead to inflammation, which may contribute to mood disorders like anxiety and depression. Stress and depression can cause people to either undereat or overeat, triggering a vicious cycle. Check out this Sutter Health article for more healthy eating tips.

5. Drink plenty of water.
Your brain is 73% water, so drinking lots of water is also important to healthy brain functioning. Without enough water, the brain starts to shut down, which can lead to symptoms of depression and anxiety. If you’re not sure how much water you need to stay healthy, try out this Hydration Calculator from Everyday Health.

6. Practice mindfulness, meditation and gratitude.
According to Medical News Today, mindfulness is a practice that increases awareness of the present moment by focusing on thoughts, feelings and sensations. One way to do this is through meditation, which has a laundry list of benefits including increased ability to manage stress, increased self-awareness, increased patience and tolerance and even improved sleep quality. If you’re new to meditation and don’t know where to start, try out a guided meditation– all you have to do is listen. These can be found in meditation apps like Headspace or Calm, websites like Mindful.com and even YouTube.
To practice gratitude, focus your attention on things you are grateful for. Benefits include improved relationships with others, experiencing more joy and pleasure and even strengthening your immune system. There are many ways to practice gratitude like keeping a gratitude journal, thanking others and asking yourself questions that promote grateful thoughts such as, “How do other people make me happy?”

7. Clean up.
According to Verywell Mind, cleaning and decluttering helps people gain a sense of control, improve their mood and even reduce levels of anxiety. College students often live in a small dorm with roommates, and it’s easy for things to get cluttered. Creating a chore list can help hold you and your roommates accountable for maintaining a clean living space that can be a sanctuary during stressful times.
Creating a self-care plan can be helpful in keeping yourself on track. To get started on your plan, ask yourself these three questions from the MHFA curriculum: Have I decided what I will do for self-care? Who can I speak with now? Who can I call if I feel upset or distressed later?

https://www.mentalhealthfirstaid.org/2022/08/seven-self-care-tips-for-college-students/
''',
        imageUrl:
            'https://images.squarespace-cdn.com/content/v1/64959c1091617327d9ef78bf/cce3b8a5-dda1-4a4a-9178-3d81e159f368/Image+Post+Template+%2863%29.png',
        category: 'Mental Health',
        author: 'Mental Health First Aid USA, August 15, 2022',
      ),
      Article(
        id: '5',
        title: 'Your Sexual Health Matters',
        snippet:
            'Sex is a pleasurable part of an intimate relationship. The American Sexual Health Association states that sexual relationships are crucial even for seniors, because intimacy can result in a higher quality of life and an increase in longevity.',
        content: '''
It’s important to have a healthy sex life. Your sex life can influence your heart health, energy levels, your ability to sleep soundly, and many other areas of your life. Even the World Health Organization states that sexual health is fundamental for health and well-being.

At Holistic OB/GYN & Midwifery in Passaic Park, New Jersey, we know that sexual health is a private matter. We understand the need for confidentiality when dealing with such concerns. We can discuss any sexual health problems you may be dealing with, and we can create an individualized treatment plan to help.

Benefits of a healthy sex life
Sex is a pleasurable part of an intimate relationship. The American Sexual Health Association states that sexual relationships are crucial even for seniors, because intimacy can result in a higher quality of life and an increase in longevity.

Sex can make you feel connected to your partner, and it can offer lots of surprising benefits, such as:

Pain relief
Sex can provide pain relief. This is because your body releases endorphins during touch and sex. Endorphins are powerful, natural pain killers.

Cardiovascular fitness
There are many physical benefits to having a healthy and robust sex life. In fact, it’s excellent exercise and good for heart health. A vigorous romp can burn calories, strengthen your muscles, reduce your risk of stroke and hypertension, and increase your libido. Additionally, people with active sex lives tend to keep healthy dietary habits, which can improve your overall health.

Energy boost
A healthy sex life can improve sleep, which can give you more energy throughout the day. Your body releases oxytocin and endorphins during sexual climax. These two hormones have a sedative effect, which can help you sleep soundly. A healthy sleep schedule has its own benefits as well. It can enable you to live longer, boost your immune system, and help you feel more rested the next day.

Learn more about a healthy sex life
If you weren’t aware of the health benefits of having a healthy sex life, you need to learn more about it. Here at Holistic OB/GYN & Midwifery, we can tell you everything to know about the benefits.

Furthermore, we can tell you about sexually transmitted diseases (STDs), the types of contraception available, and other important matters regarding your sexual health. Furthermore, if you have sexual health problems, we can help with that, too. We can discuss your issues, give you a thorough exam, and put you on the path to health.


To learn more about the benefits of a healthy sex life or to get help with sexual health problems, book an appointment online or over the phone with Holistic OB/GYN & Midwifery today.

https://www.holisticobgyn.com/blog/your-sexual-health-matters
''',
        imageUrl:
            'https://www.piedmont.org/media/BlogImages/Sexually%20transmitted%20diseases.jpg',
        category: 'HIV and STD',
        author: 'Holistic OB/GYN & Midwifery',
      ),
      Article(
        id: '6',
        title: 'Pride Month: LGBTQIA+ Young Adults Share Inspiring Stories',
        snippet:
            'June is Pride Month in the United States. You may see various versions of rainbow flags displayed around your town, support for #PrideMonth and the LGBTQIA+ community on social media, and celebrations like parades and festivals popping up in person and virtually. But why do we celebrate, and what does it all mean?',
        content: '''
June is Pride Month in the United States. 

You may see various versions of rainbow flags displayed around your town, support for #PrideMonth and the LGBTQIA+ community on social media, and celebrations like parades and festivals popping up in person and virtually.

But why do we celebrate, and what does it all mean?

Initially inspired over 50 years ago by the 1969 Stonewall Uprising in New York City following the police raid of a gay bar, Pride Month recognizes the impact that LGBTQIA+ individuals have had on our society — locally, nationally, and internationally. It also highlights the work of the LGBTQIA+ community, and the supporters and allies who work alongside them, to achieve equal justice and opportunity for LGBTQIA+ Americans.

Inspiring stories from teens and young adults in the LGBTQIA+ community (that everyone needs to hear)
One of my favorite organizations to get involved with as an ally of the LGBTQIA+ community is Free Mom Hugs (if you haven't heard of it, you should check it out!). As a mom myself, I feel strongly compelled to support and fight for LGBTQIA+ individuals in the same way that I would fight for my own kids. I'm thrilled to be able to share some of their inspiring words that I believe everyone should hear.

Kyle Rayfield's story has been shared almost 2,000 times on Facebook. I guess that's why it popped up in my Newsfeed while I was searching for inspiration for my article. I took a chance and reached out to Kyle to request permission to use his story and photo, but I figured that my random message would go unanswered. 

Boy, was I wrong! Kyle answered with an "of course!" almost immediately. I can't tell you how grateful l am that he said yes, because it is a story and photo that both parents and kids should experience. Thank YOU, Kyle. Your photo makes me tear up with joy repeatedly, despite the fact that I have looked at it about 27 times. Your words will inspire many — I just know it.

Kyle's story
When your dad buys his first pride flag and asks you to help him hang it, you cherish that moment.

My dad and I have always had a complicated relationship and it became even more complicated after coming out 10 years ago to him.

It was never his wish and he struggled with how all of this would impact my life. Knowing now and looking back, he was scared, so was I. I didn’t completely understand what being gay even meant, I just knew I was.

I’m happy to say that our relationship has done nothing but get stronger and I am so happy and proud to have a father that accepts me completely for who I am.

If you’re reading this and have struggled with the fear of coming out based on other’s opinions, let it be known that even if it is hard at first, it truly does get better. Don’t live a life that is ruled by fear. Be proud of who you are because at the end of the day there is no better you than you.

Thank you dad.

https://bowie.macaronikid.com/articles/6479f824c25dfe2ad67f54d7/pride-month-lgbtqia-young-adults-share-inspiring-stories

''',
        imageUrl:
            'https://static.vecteezy.com/system/resources/previews/013/481/612/non_2x/lgbtqia-text-banner-lgbtqia-lesbian-gay-bisexual-transgender-queer-intersex-asexual-vector.jpg',
        category: 'SOGIESC',
        author: 'Christen Reiner, 2023',
      ),
      Article(
        id: '7',
        title: 'The Art of Not Knowing',
        snippet:
            'The quicker you embrace the fact that you don’t know everything about anything, the better off you and those around you will be. You will unburden yourself of undue stress at work and you shift your brain into a continuous state of learning.',
        content: '''
The fear of saying “I don’t know” started long ago. In the past, a person’s ability to gain employment was based on their depth of knowledge and aptitude at a particular trade.[1] Workers received intense training and usually performed an apprenticeship before they were considered a “professional” and respected as such. Saying the words, “I don’t know” was an indictment of incompetence.

But the work landscape has changed.

In today’s workforce, having in depth expertise is less valuable and has become a distant second behind potential. A person’s potential and capacity to learn is more important and far more valuable than encyclopedic knowledge on a particular topic.

The Beauty of Not Knowing
The birth of the internet created a huge shift in the information paradigm. Now, information, data and knowledge are literally at your finger tips. The impact of the information sharing on every level and subject, which is readily available 24/7, is a remarkably wonderful double-edged sword.

Things that were privy only to certain people and shared within closed circles is now accessible to all. If you want to know —you can.

The amount and magnitude of information available is overwhelming and incomprehensible. It has become almost impossible to be a true “subject matter expert.” The paradox is that both everyone and no one is an expert.

The shift in information sharing has also impacted workplace norms. Where it used to be frowned upon and taboo to use the words, “I don’t know” in a professional environment, it now has become acceptable and expected. Today people are hired based on their ability to process information not to memorize it — which is a far more remarkable and better use of the brain.

Our brains have gone from being storage containers to multifaceted microprocessors. Your ability to gather, comprehend, evaluate, synthesize, apply and create new information is your most attractive attribute — not your current knowledge base.[2]

Embracing “I Don’t Know”
The quicker you embrace the fact that you don’t know everything about anything, the better off you and those around you will be. You will unburden yourself of undue stress at work and you shift your brain into a continuous state of learning.

The value in embracing and saying “I don’t know” lets you off the hook and helps reduce all of the misinformation pervading our information system. The truth is, your boss doesn’t care whether or not you can produce information on the spot, he or she is more interested in whether or not you can find the correct information quickly and apply it properly.

Chasing “I don’t know,” with “but I’ll get back to you shortly,” is the recipe for continued growth, humility, and opportunities.

How to Know What You Don’t Know
Now that you understand now knowing everything is totally okay in the workplace, it’s time to understand how to complete the process and close the loop. Not knowing is acceptable; but failure to rectify the knowledge gap is not.

Find out What’s Missing
The first step (after admitting your ignorance on the subject) is to ensure that you understand exactly what information you are being asked to provide.

Nothing is worse than misunderstanding what it is the other person needs and chasing your tail down rabbit holes. Make sure what information you are being asked to gather and synthesize and then find out how it should be presented. This is a simple yet critical first step.


https://www.lifehack.org/620152/the-art-of-not-knowing
''',
        imageUrl:
            'https://i1.pickpik.com/photos/640/821/241/flowers-camp-sunset-in-the-evening-preview.jpg',
        category: 'Mental Health',
        author: 'Leon Ho, 2023',
      ),
      Article(
        id: '8',
        title: 'HIV and AIDS aren’t over—and here is how you can help',
        snippet:
            'Stigma surrounding HIV and AIDS directly damages people’s health. We covered the facts about HIV transmission and prevention—now here’s a look at the discrimination caused by HIV stigma, and what people are doing to end it.',
        content: '''
Stigma surrounding HIV and AIDS directly damages people’s health. We covered the facts about HIV transmission and prevention—now here’s a look at the discrimination caused by HIV stigma, and what people are doing to end it.

HIV-related stigma exists worldwide, although it manifests itself differently across countries, communities, religious groups, and individuals. In the USA, men who have sex with men account for up to 67% of new HIV transmission cases (1), and stigma is often linked with homophobia. In sub-Saharan Africa, heterosexual sex is the main route of HIV transmission (2), and HIV-related stigma in this region is mainly focused on infidelity and sex work (3).

Stigma comes from misinformation
Many people still believe myths which date back to the emergence of the AIDS epidemic in the 1980s. Some common misconceptions include:

“HIV and AIDS are no longer an important issue”
False: HIV and AIDS are still very present in the lives of many people. The World Health Organization (WHO) estimates that 36.9 million people around the world are HIV positive, with 1.8 million new infections in 2017 alone. Up to one quarter of these people don’t know that they have HIV. Even with improved medications, the WHO estimates that in 2017 almost a million people died of HIV-related causes (4).

In the US, 38,281 people were diagnosed with HIV in 2017 (5). In 2015 it was estimated that around 1.1 million people total in the US were living with HIV, and 1 in 7 of these people didn’t know that they were HIV positive (6).

“HIV and AIDS are always associated with death”
False: With advances in treatment and preventive care, rates of HIV infection, AIDS, and related deaths are decreasing overall (4). There is no cure for HIV, but improved medications are helping more people to live longer. Even when comparing antiretroviral therapy (ART) medications from the mid-1990s with ARTs from 2010, life expectancy is continuing to increase. From the mid 1990s to 2010, 9 to 10 years has been added to the life expectancy of people who started to take ARTs in their 20s, so their estimated life expectancy is now only slightly below the general population (7).

“I shouldn’t have sex with someone who has HIV”
That’s up to you: There have been vast improvements in treatment and prevention options for HIV. HIV positive people who consistently and properly take their ART medications can lower their viral loads so much that HIV may not even be detectable on a blood test—this is called an undetectable viral load. These medications help to keep a person with HIV healthy, and reduce the chance of transmitting HIV to another person (8).

When someone with HIV has an undetectable viral load, there’s no risk of transmitting the virus to someone who is HIV negative. However, if medication is taken incorrectly or stopped, HIV viral loads will increase again and transmission can occur (8).

Discussing risks with any sexual partner and practising safer sex (using condoms and other barrier methods) is the most reliable way to protect against STI and HIV infection (8). For people who don’t have HIV but are planning to have sex with an HIV positive person, there are medications available called Pre-exposure prophylaxis (PrEP), which can be taken daily to decrease the risk of contracting HIV from a partner (8).

“HIV only affects certain groups of people”
False: HIV doesn’t discriminate. People can contract HIV as babies during birth or breastfeeding, as well as through blood transfusions, sex, or sharing needles. No one deserves to be judged, shamed, praised or pitied, because of how they contracted HIV. There’s no reason to ask people living with HIV about how they contracted the virus—that’s personal information which everyone has the right to keep private.

“HIV can be transmitted via sneezing, toilet seats, or shaking hands”
False: HIV is transmitted through the exchange of certain types of bodily fluids including: blood, semen, breast milk, and vaginal fluids. Saliva, tears, sneezing, hugging, or touching shared objects like cutlery or toilet seats, cannot transmit HIV (9,10).

For more facts, check out our article about HIV transmission and prevention.

Stigma is bad for everyone
Stigma might come from myths, but the effects are real. People with HIV face poor treatment in educational, healthcare, and work settings, the erosion of their rights, and psychological damage. Some are shunned by their community, which may mean losing their home and livelihood. Stereotypes about who is at risk of HIV affect people who don’t even have the virus.

Fear of stigma and discrimination is the main reason why people are reluctant to seek healthcare services, disclose their HIV status, and take antiretroviral drugs (11). An unwillingness to take an HIV test means that more people are diagnosed late, when the virus may have already progressed to AIDS. This makes treatment less effective, increases the likelihood of transmitting HIV to others, and can cause early death.

How we can end stigma
Many individuals and organizations are fighting to end HIV-related stigma and improve the lives of people with HIV and AIDS. Here are a few things they’ve already achieved, and how you can help.

Educate healthcare workers
In Bangladesh, healthcare workers undertook a training program focusing on reducing stigma and discrimination against young people who access sexual health services. A 2016 study found that after the training program they changed their attitudes significantly and made less moral judgements about sexually active young people, young pregnant women, men who have sex with men, and sex workers. The attitudes of the healthcare workers improved towards people with HIV, but still some biases did remain. In the same study, young people using these sexual health services also reported an improvement in the quality of healthcare they received (12).

Protect the privacy of people who are HIV positive
Laws that criminalize HIV non-disclosure, exposure, and transmission deter people from HIV testing, and put the responsibility of HIV prevention solely on the partner living with HIV (13). In March 2015, a Kenyan law that demanded that people living with HIV to disclose their HIV status and criminalized HIV exposure was declared unconstitutional (14). In May of the same year, the Australian state of Victoria repealed the country’s only HIV-specific law, which had criminalized the intentional transmission of HIV. The repealed law carried a maximum penalty of 25 years imprisonment, more than the maximum 20 years for manslaughter (15).

Remove travel restrictions
Between 2008 and 2015, around the world, 24 laws restricting travel and residency for people with HIV were removed (16). But there is still more work to be done: Brunei, Equatorial Guinea, Iran, Iraq, Jordan, Papua New Guinea, Qatar, Russia, Solomon Islands, United Arab Emirates, and Yemen still categorically refuse entry to people with HIV (17).

Support people living with HIV to work through internalized stigma
In India, a training program was created where women living with HIV could learn coping and stigma-reduction strategies. In addition to training, some of the women were provided with an Asha—a local woman trained in HIV issues, or an accredited social health activist. The Ashas accompanied the women to health appointments, and gave them advice on how to cope with and address HIV-related discrimination. Six months after the training sessions, the women who had been supported by an Asha reported greater reductions in internalized stigma, were more likely to follow their treatment protocol, and had fewer depressive symptoms than those who did not have an Asha assisting them (18).

Improve the status of women
Women living with HIV are often harshly judged, due to HIV being associated with promiscuity and the gendered double-standard that a “good woman” would not engage in activities that could lead to HIV acquisition (19). Women living with HIV not only experience stigma and discrimination from their friends, family, and community, but also from healthcare workers (20). They also experience more HIV related stigma than men, including more feelings of negative self image, and more public stigma surrounding how their community views them (21). A lot needs to be done to improve the status of women worldwide. In the meantime, support groups for women with HIV can help individual women to navigate these challenges (20).

Fight inequality and discrimination
People who are marginalized—including trans women, men who have sex with men, sex workers, and drug users—face legal and social inequities which put them at higher risk of HIV infection (22). Discrimination against these groups negatively affects their health, and reduces access to healthcare—including HIV testing and treatment (22). Many people experience multiple forms of discrimination—not just that related to their HIV status, but also with respect to gender, sexual orientation, race, etc. This can affect people across many components of their lives (23).

Law changes can help to improve people’s health and reduce stigma. Portugal decriminalized personal drug use in 2001, and this has played a part in falling HIV rates among IV drug users there (24,25). Both UNAIDS and WHO advocate for the decriminalization of sex work to prevent the spread of HIV, and it’s predicted that this could reduce new HIV infections in female sex workers by 33-46% over the next 10 years (26,27,28).

But legal advances are not enough, cultural norms also need to change. How can we make this happen? By looking to the leadership of the people with the most knowledge and expertise—people with HIV themselves.

Listen to people living with HIV
People with lived experience of a disease or social reality deserve a voice in decisions that affect them. This means that people with HIV must be at the forefront of the movement to end HIV and AIDS stigma.

Start with yourself
There’s a lot to be done to end HIV stigma, but you can help make a difference. Educate yourself and your friends: get the facts about HIV transmission and prevention.

https://helloclue.com/articles/sex/hiv-and-aids-aren't-over-and-here-is-how-you-can-help
''',
        imageUrl:
            'https://images.ctfassets.net/juauvlea4rbf/5go9G9i0eL2zhutYqfamMc/01242b7b9391c74a30859e4138dfe3e1/HIV_Stigma_fb_2x.png',
        category: 'HIV and STD',
        author: 'Nicole Telfer, and Jen Bell, PhD, 2019',
      ),
      Article(
        id: '9',
        title:
            'MORE EQUAL, MORE HAPPY: THE ROAD TO LGBTQ+ RIGHTS IN THE PHILIPPINES',
        snippet:
            'The Philippines is home to a vibrant and proud LGBTQ+ community. But for more than 20 years, they have been fighting to pass a landmark anti-discrimination law that would enshrine their fundamental rights to dignity, respect, and freedom from prejudice.',
        content: '''

The Fund for Global Human Rights presents a new short film on the inspiring LGBTQ+ activists campaigning to pass a landmark national anti-discrimination law in the Philipp

The Philippines is home to a vibrant and proud LGBTQ+ community. But for more than 20 years, they have been fighting to pass a landmark anti-discrimination law that would enshrine their fundamental rights to dignity, respect, and freedom from prejudice.

The SOGIE Equality Bill, sometimes referred to by activists as SOGIE or SOGIESC, was first introduced in the Philippine Congress in 2002. This progressive piece of legislation would protect everyone from discrimination on the grounds of sexual orientation, gender identity, and gender expression (SOGIE) as well as sex characteristics (SC)—attributes that every individual has. Today, grassroots LGBTQ+ activists in the Philippines are still fighting to pass the bill—and their hope-led campaign has inspired many others to join the movement for equality.

Our new short film, More Equal, More Happy: The Road to LGBTQ+ Rights in the Philippines, shares these activists’ life-changing work through their own words and stories. Filmed in the Philippines, More Equal, More Happy offers a closer look at the impact the law would have for LGBTQ+ people, particularly those from poorer and more rural communities.

The activists featured in the film represent different backgrounds, perspectives, motivations, and strategies for change. But they all share one thing: unwavering commitment to a world that respects and protects the rights of LGBTQ+ people. With support from allies like the Fund for Global Human Rights, these courageous local leaders are mobilizing their communities and building momentum to pass the SOGIE Equality Bill.

The Fund has supported the LGBTQ+ movement in the Philippines for more than a decade, providing long-term flexible funding to help bolster their campaign for equality. At a time when LGBTQ+ rights are under attack around the world, we’re proud to support LGBTQ+ rights activists in every region where we work with trust-based grantmaking and strategic partnership. The support of our community of donors is helping activists across the globe counter divisive anti-LGBTQ+ narratives and build a fairer, more equal future.

https://globalhumanrights.org/videos/more-equal-more-happy-the-road-to-lgbtq-rights-in-the-philippines/
''',
        imageUrl:
            'https://cdn.dribbble.com/userupload/3718662/file/original-07b762b4f99692e333894c4024b05c75.png?resize=400x300&vertical=center',
        category: 'SOGIESC',
        author: 'Fund for Global Human Rights, 2024',
      ),

      Article(
        id: '10',
        title: 'Our emotions are meant to be felt',
        snippet:
            'I used to ignore my emotions. Like many people, I thought that only happiness and positivity were worth feeling. I believed that by ignoring sadness, anger, or fear, I could somehow make them disappear. But over time, I learned that this approach only led to more stress and confusion. It wasn’t until I embraced the full range of my emotions that I truly began to understand myself and live more authentically.',
        content: '''
I used to ignore my emotions. Like many people, I thought that only happiness and positivity were worth feeling. I believed that by ignoring sadness, anger, or fear, I could somehow make them disappear. But over time, I learned that this approach only led to more stress and confusion. It wasn’t until I embraced the full range of my emotions that I truly began to understand myself and live more authentically.

The movie perfectly illustrates how our emotions are meant to be felt, even the hard ones. The introduction of new emotions in the story reminded me of my own journey, where unexpected feelings often caught me off guard. It’s a powerful reminder that it’s okay to feel what we need to feel. Emotions are not there to be controlled or ignored. They exist to be acknowledged and understood.

For so long, I bought into the idea that only positive emotions were valid. Society often tells us to be happy and stay positive, but the truth is, it’s just as important to embrace our sadness, our anger, and our fears. These emotions are a part of our human experience, and acknowledging them is a crucial step toward healing and growth.

I remember times when I tried to suppress my feelings. I thought that by not acknowledging my sadness or anger, I could somehow avoid pain. But in reality, those emotions only grew stronger and began to control me. When I finally allowed myself to experience these feelings fully, I found that I could navigate through them and come out stronger on the other side.

“You are not the voice in your head; you’re the one who listens to it.” This distinction was a game-changer for me. I often mistook my inner voice — those critical, doubting, or fearful thoughts — as my true self. But the real me is the one who hears these thoughts, the observer of my life.

When I reflected on this idea, it transformed my perspective. I realized that by not questioning the validity of my inner voice, I was giving it power over my emotions and actions. Recognizing that I am the listener, not the voice, allowed me to reclaim my power. I began to choose how to respond to my thoughts and emotions, rather than being ruled by them.

This lesson became especially important during difficult times. When I faced hardships, my inner voice often became loud with negativity and fear. But by remembering that I am the listener, I could step back, observe my emotions, and allow myself to feel without judgment. This new perspective helped me move through my challenges with greater resilience and compassion for myself.

It teaches us that all our emotions are essential parts of who we are. They guide us, teach us, and make us human. By embracing every emotion, we honor our true selves and live more authentically. So, the next time you feel overwhelmed by your feelings, remember: that it’s okay to feel what you need to feel. You are not your inner voice; you are the one who listens, the observer of your beautiful, complex life. Embrace every emotion and let them guide you through your journey.

Each day brings its own set of emotions. Some days, joy fills our hearts with light and laughter. Other days, sadness might take over, making us feel heavy and introspective. Then there are days filled with anger, fear, or even a mix of emotions that we can’t quite untangle. It’s in these moments that we must remind ourselves that it’s okay to feel whatever comes our way.

I’ve found that when I let myself feel deeply, whether it’s joy, sadness, or anger, I learn something new about myself. Those moments of deep sadness, for instance, have often led to profound personal growth and understanding. Anger, when acknowledged and expressed healthily, has helped me stand up for myself or make necessary changes in my life.

Fear, too, has its place. It can protect us from harm and push us to prepare for challenges. Even feelings of shame or guilt can lead us to reflect on our actions and strive to do better. Every emotion has a role, and by embracing them all, we become more in tune with ourselves.

“You are not the voice in your head; you’re the one who listens to it.” This idea encourages us to be kind to ourselves. Our inner voice can often be harsh and critical, but we have the power to listen with compassion and understanding. By doing so, we can transform our relationship with our emotions and ourselves.

Life is a journey filled with a wide range of emotions, and each one contributes to our growth and understanding. Embrace your emotions, feel them fully, and let them guide you. Remember, you are the listener, the observer of your life’s story. And in this role, you have the power to navigate your emotions with grace, creating a life that’s authentically and beautifully yours.

https://siopau.medium.com/our-emotions-are-meant-to-be-felt-a7941915fb80
''',
        imageUrl:
            'https://i.redd.it/new-posters-for-inside-out-2-v0-fv4yu3japf0d1.jpg?width=1086&format=pjpg&auto=webp&s=e87dd07d7d0c8fea8ad062d75a1df2c204ac8d98',
        category: 'Mental Health',
        author: 'pau, 2024',
      ),

      Article(
        id: '11',
        title: 'To be loved is to be seen.',
        snippet:
            'Imagine being loved the way you love. To be loved, seen, known, acknowledged, welcomed, valued, and supported without asking for it. It seems easy to love someone yet difficult to be loved.',
        content: '''
Imagine being loved the way you love. To be loved, seen, known, acknowledged, welcomed, valued, and supported without asking for it. It seems easy to love someone yet difficult to be loved.

my favorite flower is the daisy.

my favorite color is purple, sometimes black.

my favorite food is pizza.

my favorite desserts are brownies and cookies.

my favorite drinks are coffee and matcha.

my favorite groups are Treasure and Seventeen.

My dream is to be loved, to be seen, and to be known, more than I do so myself. Knowing I hate doing it myself, I want someone to peel shrimp for me. I don’t mind receiving roses on our date as I appreciate the kind gesture, but I secretly hope you brought daisies. I think that it’s cute when one brings an extra jacket knowing that the other easily gets cold but forgets to bring it. Situations like them knowing my allergies or saying, “She doesn’t drink tea.” is a simple yet meaningful reminder that I am known.

To be loved is to be seen. To have someone know your likes and dislikes, favorites, or allergies. All from constant observation and curiosity. I get butterflies when they pull out the “I remember you like this.” card. Sometimes I would wonder when I told them about it, how they remember such things and the like. Was I that special to them? or was it just simply a kind gesture?

To be loved is to be known. To receive something you didn’t expect. To get some “just because” flowers. To be given your favorite drink after a tiring day. To have someone sit beside you in silence because they know the solace you find in their presence. Small gestures require great effort that only a few people manage to show you. But these small gestures leave a lasting impression. To show that they truly love you.

Love me to the extent that you understand me more than I do.

After all, my favorite flower, color, food, drinks, and music, reflect my true self and what makes me happy. Yet the real essence is found in the profound bonds we create with others — their capacity to love, perceive, and comprehend us on a deeper level. It is in these gestures of care and mindfulness that we feel truly acknowledged, valued, and cherished.

Dear readers, I pray that we all be with someone who understands us in and out. I hope you get to experience how it feels to be loved and treated right. And lastly, be with someone who makes it easy to be yourself. Someone proud and accepts you fully, despite your flaws and insecurities.


https://medium.com/@solelysolace/to-be-loved-is-to-be-seen-b299757db05d

''',
        imageUrl:
            'https://blenderartists.org/uploads/default/original/4X/3/0/f/30f1e13b157f19a73eb8bc144936bf268ff1b467.jpg',
        category: 'Mental Health',
        author: 'solace, 2024',
      ),

      Article(
        id: '12',
        title: 'We accept the love we think we deserve',
        snippet:
            'I’m no stranger to neglect. Ever since I was a child, I was used to receiving less affection than others. We don’t come into this world knowing what love is. We are shaped by our experiences, both positive and negative. We are influenced by what we see in movies, TV shows, and social media. We learn about love from our families and friends, sometimes in toxic ways.',
        content: '''
I’m no stranger to neglect. Ever since I was a child, I was used to receiving less affection than others. We don’t come into this world knowing what love is. We are shaped by our experiences, both positive and negative. We are influenced by what we see in movies, TV shows, and social media. We learn about love from our families and friends, sometimes in toxic ways.

Our traumas and journeys have a major impact on our perspective of love. But amidst all the confusion, one thing remains true: love is a complex and ever-changing emotion.

As I scroll through forums filled with heartbreak stories, I notice a common thread. Regardless of whether you’re the one ending the relationship or the one being left behind, the stories seem eerily similar. Lack of communication, unmet expectations, and fear of vulnerability seem to be recurring themes.

People often compare their new relationships to their past ones, believing that they have found someone better. But do we really know everything about our new partners? The truth is, that we are all complex beings with many layers to uncover.

Why is it that the one ending the relationship seems to have all the answers, while the one being left behind appears indifferent? Are we all just regurgitating the same patterns and reactions? Is media playing a major role in shaping our understanding of love? Why do we all share our stories and our loved ones say the same things? When did this start becoming a thing?

I reflect on my own experiences, as well as those of my friends, family, and past lovers. I realize that love is not easily defined. It cannot be classified into a few categories or terms. Love is a spectrum, with countless shades and variations.

We often find ourselves using terms like “limerence” to explain intense feelings. Did you know that psychologist Dorothy Tennov coined the term limerence in the early 1970s after conducting over 300 interviews to gather qualitative data on the experience of romantic love? Over 7 billion people in the world and only 300 people participated in this study. Does that mean you’re now in limerence or could it be borderline obsession? How can we accurately portray what we feel isn’t love? Who can dictate the definition of that feeling?

The once-envisioned power of love is stripped away. Why can’t one have intense feelings? Should they feel ashamed for loving so deeply? One will always love the other more in the relationship.

But do these labels truly capture the essence of love? Love is a feeling that requires effort and commitment. It cannot be reduced to a single term or concept.

In the midst of heartbreak, the one being left behind is often made to feel ashamed of their emotions. Meanwhile, the one ending the relationship claims to have tried everything before giving up. The cycle continues, with both parties hurting and repeating toxic patterns. Roles might be switched but the damage continues. The patterns continue.

This feeling makes me laugh, especially when someone says they don’t feel it anymore. Butterflies? Nervousness. Excitement. Stepping outside of your comfort zone.

The feeling of finding someone new who is attractive to you, and the feeling being mutual, the spark. Love has become dissected and analyzed, but do any of us truly know what it is? Love is a feeling that comes and goes, just like happiness. To some, there is no such thing as love at first sight, and saying “I love you” too soon and often is labeled as love bombing.

We often try to put love into boxes, categorizing it as either true love, in love, unconditional love, obsession, infatuation, or limerence. Then come the negative feelings: avoidance, abandonment, cheating, breadcrumbing, and emotional and physical abuse. But love is not black and white. It is a complex and multifaceted emotion that cannot be easily defined.

Could it be that our definition of love is based on what we know love to be, shaped by our environment? Is cheating shown as a norm on social media? Marriages turned into trash TV competitions? Jumping to someone new instead of committing to fix what may be a little damaged but not beyond repair?

We all come from different backgrounds, cultures, and experiences. We interact with diverse individuals and face unique challenges. Yet, we often judge others based on our own limited perspectives and experiences.

In online forums, I see people jumping to conclusions and diagnosing others based on a few sentences. We believe in strangers and try to influence them based on our own past experiences. But everyone’s journey is different, and we must remember that we are not experts in each other’s lives.

Mental illness has become a focal point in our society, with pharmaceutical companies holding immense power. A time to capitalize on the weak. Everyone wants to be a better version of themselves. But we must remember that not everyone is mentally ill. We all have our struggles, but we also have the capacity to change and grow.

In the midst of all this confusion, one thing remains constant: we must take care of ourselves. We must communicate our needs and boundaries, and treat others with kindness and respect. Let’s break the cycle of toxic love and strive for healthier relationships. It’s in your control who you allow in your life. It’s not in your control what people do, so it’s better to cut them off and move on; don’t linger on it.

If you know you deserve better, you won’t entertain the people who give you half-hearted responses, who flake, who keep you as their backup, who ghost and then come back, and all the other multitude of disappointing behaviors. The quicker you cut them off, the less time you waste on them and the closer you are to finding someone you deserve.

There are many people who forget or don’t realize that you don’t need to keep low-effort people in your life. You have control over that.

How do you learn to deserve better? By loving yourself. Truly loving yourself. Along with this, you teach people how to treat you. If you accept poor behavior from your friends, family, or partners, they will continue to treat you that way because they will believe that is what you want, expect, and deserve. You’ve got to have some self-respect and ask for, even demand, the treatment you want.

We have all the control over the quality of the people in our lives. Often, we are the creators of our own misery. Many people believe that they will gain respect by letting others disrespect them. But this is far from the truth.

We tend to always have people around who want us, but maybe it’s not the type of love we think we deserve. We deserve more because we are full of love and have so much more to give.

https://siopau.medium.com/we-accept-the-love-we-think-we-deserve-9b509a2d9ecb
''',
        imageUrl: 'https://pbs.twimg.com/media/DRt6MKrVAAADTxP.jpg:large',
        category: 'Mental Health',
        author: 'pau, 2024',
      ),
      // Add more articles here
    ];
    _bookmarkService.setAllArticles(_articles);
    notifyListeners();
  }
}