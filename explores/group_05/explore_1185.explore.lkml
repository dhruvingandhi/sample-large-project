# Antigravity modified: branch dg-3
# Explore: explore_1185
# Auto-generated LookML Explore File

include: "/views/domain_06/view_03556.view.lkml"
include: "/views/domain_08/view_03558.view.lkml"
include: "/views/domain_09/view_03559.view.lkml"
include: "/views/domain_10/view_03560.view.lkml"

explore: explore_1185 {
  label: "Explore Explore 1185"
  description: "Comprehensive analytics explore joining base view_03556 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03556
  
  always_filter: {
    filters: [view_03556.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03556.created_at_date: "7 days"]
    unless: [view_03556.id, view_03556.status]
  }

  join: view_03558 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03556.user_id} = ${view_03558.id} ;;
    required_joins: []
  }

  join: view_03559 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03556.account_id} = ${view_03559.account_id} ;;
    required_joins: [view_03558]
  }

  join: view_03560 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03556.category} = ${view_03560.category} ;;
  }

  access_filter: {
    field: view_03556.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03556.is_deleted} = false ;;
}
