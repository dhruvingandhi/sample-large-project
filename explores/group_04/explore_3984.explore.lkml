# Explore: explore_3984
# Auto-generated LookML Explore File

include: "/views/domain_03/view_11953.view.lkml"
include: "/views/domain_05/view_11955.view.lkml"
include: "/views/domain_06/view_11956.view.lkml"
include: "/views/domain_07/view_11957.view.lkml"

explore: explore_3984 {
  label: "Explore Explore 3984"
  description: "Comprehensive analytics explore joining base view_11953 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11953
  
  always_filter: {
    filters: [view_11953.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11953.created_at_date: "7 days"]
    unless: [view_11953.id, view_11953.status]
  }

  join: view_11955 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11953.user_id} = ${view_11955.id} ;;
    required_joins: []
  }

  join: view_11956 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11953.account_id} = ${view_11956.account_id} ;;
    required_joins: [view_11955]
  }

  join: view_11957 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11953.category} = ${view_11957.category} ;;
  }

  access_filter: {
    field: view_11953.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11953.is_deleted} = false ;;
}
