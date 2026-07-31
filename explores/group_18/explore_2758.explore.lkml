# Update for 2000 file diff target
# Explore: explore_2758
# Auto-generated LookML Explore File

include: "/views/domain_25/view_08275.view.lkml"
include: "/views/domain_27/view_08277.view.lkml"
include: "/views/domain_28/view_08278.view.lkml"
include: "/views/domain_29/view_08279.view.lkml"

explore: explore_2758 {
  label: "Explore Explore 2758"
  description: "Comprehensive analytics explore joining base view_08275 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08275
  
  always_filter: {
    filters: [view_08275.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08275.created_at_date: "7 days"]
    unless: [view_08275.id, view_08275.status]
  }

  join: view_08277 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08275.user_id} = ${view_08277.id} ;;
    required_joins: []
  }

  join: view_08278 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08275.account_id} = ${view_08278.account_id} ;;
    required_joins: [view_08277]
  }

  join: view_08279 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08275.category} = ${view_08279.category} ;;
  }

  access_filter: {
    field: view_08275.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08275.is_deleted} = false ;;
}
