# Update for 2000 file diff target
# Explore: explore_1859
# Auto-generated LookML Explore File

include: "/views/domain_28/view_05578.view.lkml"
include: "/views/domain_30/view_05580.view.lkml"
include: "/views/domain_31/view_05581.view.lkml"
include: "/views/domain_32/view_05582.view.lkml"

explore: explore_1859 {
  label: "Explore Explore 1859"
  description: "Comprehensive analytics explore joining base view_05578 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05578
  
  always_filter: {
    filters: [view_05578.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05578.created_at_date: "7 days"]
    unless: [view_05578.id, view_05578.status]
  }

  join: view_05580 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05578.user_id} = ${view_05580.id} ;;
    required_joins: []
  }

  join: view_05581 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05578.account_id} = ${view_05581.account_id} ;;
    required_joins: [view_05580]
  }

  join: view_05582 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05578.category} = ${view_05582.category} ;;
  }

  access_filter: {
    field: view_05578.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05578.is_deleted} = false ;;
}
