# Explore: explore_2177
# Auto-generated LookML Explore File

include: "/views/domain_32/view_06532.view.lkml"
include: "/views/domain_34/view_06534.view.lkml"
include: "/views/domain_35/view_06535.view.lkml"
include: "/views/domain_36/view_06536.view.lkml"

explore: explore_2177 {
  label: "Explore Explore 2177"
  description: "Comprehensive analytics explore joining base view_06532 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06532
  
  always_filter: {
    filters: [view_06532.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06532.created_at_date: "7 days"]
    unless: [view_06532.id, view_06532.status]
  }

  join: view_06534 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06532.user_id} = ${view_06534.id} ;;
    required_joins: []
  }

  join: view_06535 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06532.account_id} = ${view_06535.account_id} ;;
    required_joins: [view_06534]
  }

  join: view_06536 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06532.category} = ${view_06536.category} ;;
  }

  access_filter: {
    field: view_06532.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06532.is_deleted} = false ;;
}
