# Explore: explore_2505
# Auto-generated LookML Explore File

include: "/views/domain_16/view_07516.view.lkml"
include: "/views/domain_18/view_07518.view.lkml"
include: "/views/domain_19/view_07519.view.lkml"
include: "/views/domain_20/view_07520.view.lkml"

explore: explore_2505 {
  label: "Explore Explore 2505"
  description: "Comprehensive analytics explore joining base view_07516 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07516
  
  always_filter: {
    filters: [view_07516.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07516.created_at_date: "7 days"]
    unless: [view_07516.id, view_07516.status]
  }

  join: view_07518 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07516.user_id} = ${view_07518.id} ;;
    required_joins: []
  }

  join: view_07519 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07516.account_id} = ${view_07519.account_id} ;;
    required_joins: [view_07518]
  }

  join: view_07520 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07516.category} = ${view_07520.category} ;;
  }

  access_filter: {
    field: view_07516.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07516.is_deleted} = false ;;
}
