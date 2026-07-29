# Explore: explore_2624
# Auto-generated LookML Explore File

include: "/views/domain_23/view_07873.view.lkml"
include: "/views/domain_25/view_07875.view.lkml"
include: "/views/domain_26/view_07876.view.lkml"
include: "/views/domain_27/view_07877.view.lkml"

explore: explore_2624 {
  label: "Explore Explore 2624"
  description: "Comprehensive analytics explore joining base view_07873 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07873
  
  always_filter: {
    filters: [view_07873.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07873.created_at_date: "7 days"]
    unless: [view_07873.id, view_07873.status]
  }

  join: view_07875 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07873.user_id} = ${view_07875.id} ;;
    required_joins: []
  }

  join: view_07876 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07873.account_id} = ${view_07876.account_id} ;;
    required_joins: [view_07875]
  }

  join: view_07877 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07873.category} = ${view_07877.category} ;;
  }

  access_filter: {
    field: view_07873.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07873.is_deleted} = false ;;
}
