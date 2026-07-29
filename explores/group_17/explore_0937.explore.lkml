# Explore: explore_0937
# Auto-generated LookML Explore File

include: "/views/domain_12/view_02812.view.lkml"
include: "/views/domain_14/view_02814.view.lkml"
include: "/views/domain_15/view_02815.view.lkml"
include: "/views/domain_16/view_02816.view.lkml"

explore: explore_0937 {
  label: "Explore Explore 0937"
  description: "Comprehensive analytics explore joining base view_02812 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02812
  
  always_filter: {
    filters: [view_02812.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02812.created_at_date: "7 days"]
    unless: [view_02812.id, view_02812.status]
  }

  join: view_02814 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02812.user_id} = ${view_02814.id} ;;
    required_joins: []
  }

  join: view_02815 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02812.account_id} = ${view_02815.account_id} ;;
    required_joins: [view_02814]
  }

  join: view_02816 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02812.category} = ${view_02816.category} ;;
  }

  access_filter: {
    field: view_02812.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02812.is_deleted} = false ;;
}
