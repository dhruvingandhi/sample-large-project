# Explore: explore_0753
# Auto-generated LookML Explore File

include: "/views/domain_10/view_02260.view.lkml"
include: "/views/domain_12/view_02262.view.lkml"
include: "/views/domain_13/view_02263.view.lkml"
include: "/views/domain_14/view_02264.view.lkml"

explore: explore_0753 {
  label: "Explore Explore 0753"
  description: "Comprehensive analytics explore joining base view_02260 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02260
  
  always_filter: {
    filters: [view_02260.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02260.created_at_date: "7 days"]
    unless: [view_02260.id, view_02260.status]
  }

  join: view_02262 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02260.user_id} = ${view_02262.id} ;;
    required_joins: []
  }

  join: view_02263 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02260.account_id} = ${view_02263.account_id} ;;
    required_joins: [view_02262]
  }

  join: view_02264 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02260.category} = ${view_02264.category} ;;
  }

  access_filter: {
    field: view_02260.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02260.is_deleted} = false ;;
}
