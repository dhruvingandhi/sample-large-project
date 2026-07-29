# Explore: explore_2504
# Auto-generated LookML Explore File

include: "/views/domain_13/view_07513.view.lkml"
include: "/views/domain_15/view_07515.view.lkml"
include: "/views/domain_16/view_07516.view.lkml"
include: "/views/domain_17/view_07517.view.lkml"

explore: explore_2504 {
  label: "Explore Explore 2504"
  description: "Comprehensive analytics explore joining base view_07513 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07513
  
  always_filter: {
    filters: [view_07513.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07513.created_at_date: "7 days"]
    unless: [view_07513.id, view_07513.status]
  }

  join: view_07515 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07513.user_id} = ${view_07515.id} ;;
    required_joins: []
  }

  join: view_07516 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07513.account_id} = ${view_07516.account_id} ;;
    required_joins: [view_07515]
  }

  join: view_07517 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07513.category} = ${view_07517.category} ;;
  }

  access_filter: {
    field: view_07513.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07513.is_deleted} = false ;;
}
