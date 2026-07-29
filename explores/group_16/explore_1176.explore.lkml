# Explore: explore_1176
# Auto-generated LookML Explore File

include: "/views/domain_29/view_03529.view.lkml"
include: "/views/domain_31/view_03531.view.lkml"
include: "/views/domain_32/view_03532.view.lkml"
include: "/views/domain_33/view_03533.view.lkml"

explore: explore_1176 {
  label: "Explore Explore 1176"
  description: "Comprehensive analytics explore joining base view_03529 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03529
  
  always_filter: {
    filters: [view_03529.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03529.created_at_date: "7 days"]
    unless: [view_03529.id, view_03529.status]
  }

  join: view_03531 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03529.user_id} = ${view_03531.id} ;;
    required_joins: []
  }

  join: view_03532 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03529.account_id} = ${view_03532.account_id} ;;
    required_joins: [view_03531]
  }

  join: view_03533 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03529.category} = ${view_03533.category} ;;
  }

  access_filter: {
    field: view_03529.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03529.is_deleted} = false ;;
}
