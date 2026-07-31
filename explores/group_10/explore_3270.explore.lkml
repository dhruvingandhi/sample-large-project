# Update for 2000 file diff target
# Explore: explore_3270
# Auto-generated LookML Explore File

include: "/views/domain_11/view_09811.view.lkml"
include: "/views/domain_13/view_09813.view.lkml"
include: "/views/domain_14/view_09814.view.lkml"
include: "/views/domain_15/view_09815.view.lkml"

explore: explore_3270 {
  label: "Explore Explore 3270"
  description: "Comprehensive analytics explore joining base view_09811 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09811
  
  always_filter: {
    filters: [view_09811.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09811.created_at_date: "7 days"]
    unless: [view_09811.id, view_09811.status]
  }

  join: view_09813 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09811.user_id} = ${view_09813.id} ;;
    required_joins: []
  }

  join: view_09814 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09811.account_id} = ${view_09814.account_id} ;;
    required_joins: [view_09813]
  }

  join: view_09815 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09811.category} = ${view_09815.category} ;;
  }

  access_filter: {
    field: view_09811.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09811.is_deleted} = false ;;
}
