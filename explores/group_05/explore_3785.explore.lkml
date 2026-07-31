# Update for 500 file diff target
# Explore: explore_3785
# Auto-generated LookML Explore File

include: "/views/domain_06/view_11356.view.lkml"
include: "/views/domain_08/view_11358.view.lkml"
include: "/views/domain_09/view_11359.view.lkml"
include: "/views/domain_10/view_11360.view.lkml"

explore: explore_3785 {
  label: "Explore Explore 3785"
  description: "Comprehensive analytics explore joining base view_11356 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11356
  
  always_filter: {
    filters: [view_11356.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11356.created_at_date: "7 days"]
    unless: [view_11356.id, view_11356.status]
  }

  join: view_11358 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11356.user_id} = ${view_11358.id} ;;
    required_joins: []
  }

  join: view_11359 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11356.account_id} = ${view_11359.account_id} ;;
    required_joins: [view_11358]
  }

  join: view_11360 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11356.category} = ${view_11360.category} ;;
  }

  access_filter: {
    field: view_11356.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11356.is_deleted} = false ;;
}
