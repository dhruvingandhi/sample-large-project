# Explore: explore_3466
# Auto-generated LookML Explore File

include: "/views/domain_49/view_10399.view.lkml"
include: "/views/domain_01/view_10401.view.lkml"
include: "/views/domain_02/view_10402.view.lkml"
include: "/views/domain_03/view_10403.view.lkml"

explore: explore_3466 {
  label: "Explore Explore 3466"
  description: "Comprehensive analytics explore joining base view_10399 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10399
  
  always_filter: {
    filters: [view_10399.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10399.created_at_date: "7 days"]
    unless: [view_10399.id, view_10399.status]
  }

  join: view_10401 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10399.user_id} = ${view_10401.id} ;;
    required_joins: []
  }

  join: view_10402 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10399.account_id} = ${view_10402.account_id} ;;
    required_joins: [view_10401]
  }

  join: view_10403 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10399.category} = ${view_10403.category} ;;
  }

  access_filter: {
    field: view_10399.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10399.is_deleted} = false ;;
}
