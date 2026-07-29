# Explore: explore_2859
# Auto-generated LookML Explore File

include: "/views/domain_28/view_08578.view.lkml"
include: "/views/domain_30/view_08580.view.lkml"
include: "/views/domain_31/view_08581.view.lkml"
include: "/views/domain_32/view_08582.view.lkml"

explore: explore_2859 {
  label: "Explore Explore 2859"
  description: "Comprehensive analytics explore joining base view_08578 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08578
  
  always_filter: {
    filters: [view_08578.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08578.created_at_date: "7 days"]
    unless: [view_08578.id, view_08578.status]
  }

  join: view_08580 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08578.user_id} = ${view_08580.id} ;;
    required_joins: []
  }

  join: view_08581 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08578.account_id} = ${view_08581.account_id} ;;
    required_joins: [view_08580]
  }

  join: view_08582 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08578.category} = ${view_08582.category} ;;
  }

  access_filter: {
    field: view_08578.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08578.is_deleted} = false ;;
}
