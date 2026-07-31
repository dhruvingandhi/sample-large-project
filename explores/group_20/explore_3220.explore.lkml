# Update for 2000 file diff target
# Explore: explore_3220
# Auto-generated LookML Explore File

include: "/views/domain_11/view_09661.view.lkml"
include: "/views/domain_13/view_09663.view.lkml"
include: "/views/domain_14/view_09664.view.lkml"
include: "/views/domain_15/view_09665.view.lkml"

explore: explore_3220 {
  label: "Explore Explore 3220"
  description: "Comprehensive analytics explore joining base view_09661 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09661
  
  always_filter: {
    filters: [view_09661.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09661.created_at_date: "7 days"]
    unless: [view_09661.id, view_09661.status]
  }

  join: view_09663 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09661.user_id} = ${view_09663.id} ;;
    required_joins: []
  }

  join: view_09664 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09661.account_id} = ${view_09664.account_id} ;;
    required_joins: [view_09663]
  }

  join: view_09665 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09661.category} = ${view_09665.category} ;;
  }

  access_filter: {
    field: view_09661.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09661.is_deleted} = false ;;
}
