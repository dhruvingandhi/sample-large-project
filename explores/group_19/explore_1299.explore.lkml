# Update for 2000 file diff target
# Explore: explore_1299
# Auto-generated LookML Explore File

include: "/views/domain_48/view_03898.view.lkml"
include: "/views/domain_50/view_03900.view.lkml"
include: "/views/domain_01/view_03901.view.lkml"
include: "/views/domain_02/view_03902.view.lkml"

explore: explore_1299 {
  label: "Explore Explore 1299"
  description: "Comprehensive analytics explore joining base view_03898 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03898
  
  always_filter: {
    filters: [view_03898.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03898.created_at_date: "7 days"]
    unless: [view_03898.id, view_03898.status]
  }

  join: view_03900 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03898.user_id} = ${view_03900.id} ;;
    required_joins: []
  }

  join: view_03901 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03898.account_id} = ${view_03901.account_id} ;;
    required_joins: [view_03900]
  }

  join: view_03902 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03898.category} = ${view_03902.category} ;;
  }

  access_filter: {
    field: view_03898.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03898.is_deleted} = false ;;
}
