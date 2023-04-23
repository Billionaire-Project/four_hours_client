import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/providers/test_saving_provider.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_circular_progress_indicator.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_text_button.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:go_router/go_router.dart';

DateTime now = DateTime.now();

DateTime date = DateTime(now.year, now.month, now.day);
Map fakeData = {
  'date': '${date.year}. ${date.month}. ${date.day}',
  // 'content': '',
  'content':
      '오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 있는지를 배울 수 있게 만들어준다.그리고 어두운 순간에도 희망의 빛이 비치고 있다. 친구로부터 따뜻한 말, 낯선 사람의 미소, 그리고 우리가 혼자가 아님을 알리는 지식일 수도 있다. 그 어떤 것이든 우리를 앞으로 나아가게 하며, 싸우며, 힘을 내도록 만들어준다.그래서 이 모든 것을 포함한 인생의 모든 순간들에 건배하고자 한다. 웃음과 눈물, 기쁨과 고통, 사랑과 상실에 건배하며, 상승과 하락, 굴곡과 전환, 그리고 그 사이에 있는 모든 것에 건배하고자 한다. 왜냐하면 그것들은 모두 여행의 일부이며, 마침내 모든 것이 그 노력에 대해 가치가 있기 때문이다.오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. 언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.하지만 나에게 있어서 평온하고 조용한 순간들만큼이나 중요한 순간들이 있었다. 힘들고 어려운 순간, 아픔과 가슴 아픈 순간들이다. 왜냐하면 이러한 순간들이 우리를 성장시켜주고, 우리가 누구이며 우리가 무엇을 할 수 ',
};

class CreateWritingPage extends ConsumerStatefulWidget {
  const CreateWritingPage({Key? key}) : super(key: key);
  static const String path = 'create-writing';
  @override
  ConsumerState<CreateWritingPage> createState() => _CreateWritingPageState();
}

class _CreateWritingPageState extends ConsumerState<CreateWritingPage> {
  final TextEditingController textEditingController =
      TextEditingController(text: '');
  final FocusNode focusNode = FocusNode();
  Timer? savingTimer;
  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() => setState(() {}));
    textEditingController.text = fakeData['content'];
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return MainWrapper(
      appBar: CommonAppBar(
        title: '새 게시글',
        leadingHandler: () {
          showCommonDialogWithTwoButtons(
            context,
            iconData: CustomIcons.report_fill,
            title: '작성을 취소하시겠어요?',
            subtitle: '작성중인 내용이 사라지고 저장되지 않아요',
            onPressedRightButton: () {
              closeRootNavigator(context);
              context.pop();
            },
            rightButtonText: '작성 취소',
          );
        },
      ),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                        ),
                        child: Column(
                          children: [
                            CommonRowWithDivider(
                              header: CommonTitle(fakeData['date']),
                            ),
                            //* IntrinsicHeight를 사용하여 Gap이 실질적인 높이에 영향을 주지 않아 SizedBox사용
                            const SizedBox(height: 8),
                            Expanded(
                              child: TextField(
                                scrollPhysics:
                                    const NeverScrollableScrollPhysics(),
                                autofocus: true,
                                keyboardType: TextInputType.multiline,
                                expands: true,
                                controller: textEditingController,
                                style: customTextStyle.bodySmall,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '오늘 느꼈던 것들을 자유롭게 적어주세요!',
                                ),
                                maxLines: null,
                                focusNode: focusNode,
                                onChanged: (value) {
                                  if (savingTimer == null) {
                                    if (value.length < writingTextLimit) {
                                      savingTimer = Timer(
                                        const Duration(seconds: 2),
                                        () {
                                          ref
                                              .read(testSavingNotifierProvider
                                                  .notifier)
                                              .requestToSave();
                                        },
                                      );
                                    }
                                  } else {
                                    savingTimer!.cancel();
                                    savingTimer = null;
                                  }
                                },
                                onTap: () {
                                  if (focusNode.hasFocus) {
                                    focusNode.unfocus();
                                  } else {
                                    focusNode.requestFocus();
                                  }
                                },
                              ),
                            ),
                            //* IntrinsicHeight를 사용하여 Gap이 실질적인 높이에 영향을 주지 않아 SizedBox사용
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Bottom(textEditingController: textEditingController),
        ],
      ),
    );
  }
}

class Bottom extends ConsumerWidget {
  final TextEditingController textEditingController;
  const Bottom({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final isSavedProvider = ref.watch(testSavingNotifierProvider);

    int textLength = writingTextLimit - textEditingController.text.length;
    bool isOverLimit = textLength < 0;

    Row saveRow = isSavedProvider.when(
      data: (data) {
        return Row(
          children: [
            Icon(
              CustomIcons.save_fill,
              size: 16,
              color: customThemeColors.blue,
            ),
            const Gap(4),
            Text('Saved',
                style: customTextStyle.montLabelSmall
                    .copyWith(color: customThemeColors.blue)),
          ],
        );
      },
      error: (error, _) {
        return Row(
          children: [
            Icon(
              CustomIcons.warning_line,
              size: 16,
              color: customThemeColors.red,
            ),
            const Gap(4),
            Text('{error.toString()}',
                style: customTextStyle.montLabelSmall
                    .copyWith(color: customThemeColors.blue)),
          ],
        );
      },
      loading: () {
        return Row(
          children: [
            const CommonCircularProgressIndicator(size: 16, strokeWidth: 2),
            const Gap(4),
            Text(
              'Saving',
              style: customTextStyle.montLabelSmall.copyWith(
                color: customThemeColors.textSecondary,
              ),
            ),
          ],
        );
      },
    );

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: customThemeColors.strokeDivider,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            saveRow,
            const Spacer(),
            Text(
              '$textLength',
              style: customTextStyle.montLabelSmall.copyWith(
                  color: isOverLimit
                      ? customThemeColors.red
                      : customThemeColors.textDisabled),
            ),
            const Gap(16),
            CommonTextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
              ),
              onPressed: isOverLimit ? null : () {},
              child: Text(
                '게시',
                style: customTextStyle.titleMedium
                    .copyWith(color: customThemeColors.textInvert),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
