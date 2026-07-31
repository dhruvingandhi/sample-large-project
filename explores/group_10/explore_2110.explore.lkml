# Update for 2000 file diff target
# Explore: explore_2110
# Auto-generated LookML Explore File

include: "/views/domain_31/view_06331.view.lkml"
include: "/views/domain_33/view_06333.view.lkml"
include: "/views/domain_34/view_06334.view.lkml"
include: "/views/domain_35/view_06335.view.lkml"

explore: explore_2110 {
  label: "Explore Explore 2110"
  description: "Comprehensive analytics explore joining base view_06331 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06331
  
  always_filter: {
    filters: [view_06331.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06331.created_at_date: "7 days"]
    unless: [view_06331.id, view_06331.status]
  }

  join: view_06333 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06331.user_id} = ${view_06333.id} ;;
    required_joins: []
  }

  join: view_06334 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06331.account_id} = ${view_06334.account_id} ;;
    required_joins: [view_06333]
  }

  join: view_06335 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06331.category} = ${view_06335.category} ;;
  }

  access_filter: {
    field: view_06331.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06331.is_deleted} = false ;;
}
