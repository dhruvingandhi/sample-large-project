# Update for 2000 file diff target
# Explore: explore_2118
# Auto-generated LookML Explore File

include: "/views/domain_05/view_06355.view.lkml"
include: "/views/domain_07/view_06357.view.lkml"
include: "/views/domain_08/view_06358.view.lkml"
include: "/views/domain_09/view_06359.view.lkml"

explore: explore_2118 {
  label: "Explore Explore 2118"
  description: "Comprehensive analytics explore joining base view_06355 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06355
  
  always_filter: {
    filters: [view_06355.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06355.created_at_date: "7 days"]
    unless: [view_06355.id, view_06355.status]
  }

  join: view_06357 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06355.user_id} = ${view_06357.id} ;;
    required_joins: []
  }

  join: view_06358 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06355.account_id} = ${view_06358.account_id} ;;
    required_joins: [view_06357]
  }

  join: view_06359 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06355.category} = ${view_06359.category} ;;
  }

  access_filter: {
    field: view_06355.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06355.is_deleted} = false ;;
}
