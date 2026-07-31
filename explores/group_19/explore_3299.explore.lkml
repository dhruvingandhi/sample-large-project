# Update for 2000 file diff target
# Explore: explore_3299
# Auto-generated LookML Explore File

include: "/views/domain_48/view_09898.view.lkml"
include: "/views/domain_50/view_09900.view.lkml"
include: "/views/domain_01/view_09901.view.lkml"
include: "/views/domain_02/view_09902.view.lkml"

explore: explore_3299 {
  label: "Explore Explore 3299"
  description: "Comprehensive analytics explore joining base view_09898 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09898
  
  always_filter: {
    filters: [view_09898.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09898.created_at_date: "7 days"]
    unless: [view_09898.id, view_09898.status]
  }

  join: view_09900 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09898.user_id} = ${view_09900.id} ;;
    required_joins: []
  }

  join: view_09901 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09898.account_id} = ${view_09901.account_id} ;;
    required_joins: [view_09900]
  }

  join: view_09902 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09898.category} = ${view_09902.category} ;;
  }

  access_filter: {
    field: view_09898.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09898.is_deleted} = false ;;
}
