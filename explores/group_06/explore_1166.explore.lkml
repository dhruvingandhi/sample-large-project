# Explore: explore_1166
# Auto-generated LookML Explore File

include: "/views/domain_49/view_03499.view.lkml"
include: "/views/domain_01/view_03501.view.lkml"
include: "/views/domain_02/view_03502.view.lkml"
include: "/views/domain_03/view_03503.view.lkml"

explore: explore_1166 {
  label: "Explore Explore 1166"
  description: "Comprehensive analytics explore joining base view_03499 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03499
  
  always_filter: {
    filters: [view_03499.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03499.created_at_date: "7 days"]
    unless: [view_03499.id, view_03499.status]
  }

  join: view_03501 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03499.user_id} = ${view_03501.id} ;;
    required_joins: []
  }

  join: view_03502 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03499.account_id} = ${view_03502.account_id} ;;
    required_joins: [view_03501]
  }

  join: view_03503 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03499.category} = ${view_03503.category} ;;
  }

  access_filter: {
    field: view_03499.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03499.is_deleted} = false ;;
}
