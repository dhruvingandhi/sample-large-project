# Update for 500 file diff target
# Explore: explore_2785
# Auto-generated LookML Explore File

include: "/views/domain_06/view_08356.view.lkml"
include: "/views/domain_08/view_08358.view.lkml"
include: "/views/domain_09/view_08359.view.lkml"
include: "/views/domain_10/view_08360.view.lkml"

explore: explore_2785 {
  label: "Explore Explore 2785"
  description: "Comprehensive analytics explore joining base view_08356 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08356
  
  always_filter: {
    filters: [view_08356.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08356.created_at_date: "7 days"]
    unless: [view_08356.id, view_08356.status]
  }

  join: view_08358 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08356.user_id} = ${view_08358.id} ;;
    required_joins: []
  }

  join: view_08359 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08356.account_id} = ${view_08359.account_id} ;;
    required_joins: [view_08358]
  }

  join: view_08360 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08356.category} = ${view_08360.category} ;;
  }

  access_filter: {
    field: view_08356.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08356.is_deleted} = false ;;
}
