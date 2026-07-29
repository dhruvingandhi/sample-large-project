# Explore: explore_1826
# Auto-generated LookML Explore File

include: "/views/domain_29/view_05479.view.lkml"
include: "/views/domain_31/view_05481.view.lkml"
include: "/views/domain_32/view_05482.view.lkml"
include: "/views/domain_33/view_05483.view.lkml"

explore: explore_1826 {
  label: "Explore Explore 1826"
  description: "Comprehensive analytics explore joining base view_05479 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05479
  
  always_filter: {
    filters: [view_05479.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05479.created_at_date: "7 days"]
    unless: [view_05479.id, view_05479.status]
  }

  join: view_05481 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05479.user_id} = ${view_05481.id} ;;
    required_joins: []
  }

  join: view_05482 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05479.account_id} = ${view_05482.account_id} ;;
    required_joins: [view_05481]
  }

  join: view_05483 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05479.category} = ${view_05483.category} ;;
  }

  access_filter: {
    field: view_05479.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05479.is_deleted} = false ;;
}
