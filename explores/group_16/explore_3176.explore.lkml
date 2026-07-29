# Explore: explore_3176
# Auto-generated LookML Explore File

include: "/views/domain_29/view_09529.view.lkml"
include: "/views/domain_31/view_09531.view.lkml"
include: "/views/domain_32/view_09532.view.lkml"
include: "/views/domain_33/view_09533.view.lkml"

explore: explore_3176 {
  label: "Explore Explore 3176"
  description: "Comprehensive analytics explore joining base view_09529 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09529
  
  always_filter: {
    filters: [view_09529.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09529.created_at_date: "7 days"]
    unless: [view_09529.id, view_09529.status]
  }

  join: view_09531 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09529.user_id} = ${view_09531.id} ;;
    required_joins: []
  }

  join: view_09532 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09529.account_id} = ${view_09532.account_id} ;;
    required_joins: [view_09531]
  }

  join: view_09533 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09529.category} = ${view_09533.category} ;;
  }

  access_filter: {
    field: view_09529.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09529.is_deleted} = false ;;
}
