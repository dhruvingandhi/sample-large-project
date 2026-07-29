# Explore: explore_0792
# Auto-generated LookML Explore File

include: "/views/domain_27/view_02377.view.lkml"
include: "/views/domain_29/view_02379.view.lkml"
include: "/views/domain_30/view_02380.view.lkml"
include: "/views/domain_31/view_02381.view.lkml"

explore: explore_0792 {
  label: "Explore Explore 0792"
  description: "Comprehensive analytics explore joining base view_02377 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02377
  
  always_filter: {
    filters: [view_02377.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02377.created_at_date: "7 days"]
    unless: [view_02377.id, view_02377.status]
  }

  join: view_02379 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02377.user_id} = ${view_02379.id} ;;
    required_joins: []
  }

  join: view_02380 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02377.account_id} = ${view_02380.account_id} ;;
    required_joins: [view_02379]
  }

  join: view_02381 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02377.category} = ${view_02381.category} ;;
  }

  access_filter: {
    field: view_02377.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02377.is_deleted} = false ;;
}
