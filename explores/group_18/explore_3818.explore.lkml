# Explore: explore_3818
# Auto-generated LookML Explore File

include: "/views/domain_05/view_11455.view.lkml"
include: "/views/domain_07/view_11457.view.lkml"
include: "/views/domain_08/view_11458.view.lkml"
include: "/views/domain_09/view_11459.view.lkml"

explore: explore_3818 {
  label: "Explore Explore 3818"
  description: "Comprehensive analytics explore joining base view_11455 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11455
  
  always_filter: {
    filters: [view_11455.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11455.created_at_date: "7 days"]
    unless: [view_11455.id, view_11455.status]
  }

  join: view_11457 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11455.user_id} = ${view_11457.id} ;;
    required_joins: []
  }

  join: view_11458 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11455.account_id} = ${view_11458.account_id} ;;
    required_joins: [view_11457]
  }

  join: view_11459 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11455.category} = ${view_11459.category} ;;
  }

  access_filter: {
    field: view_11455.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11455.is_deleted} = false ;;
}
