# Explore: explore_2111
# Auto-generated LookML Explore File

include: "/views/domain_34/view_06334.view.lkml"
include: "/views/domain_36/view_06336.view.lkml"
include: "/views/domain_37/view_06337.view.lkml"
include: "/views/domain_38/view_06338.view.lkml"

explore: explore_2111 {
  label: "Explore Explore 2111"
  description: "Comprehensive analytics explore joining base view_06334 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06334
  
  always_filter: {
    filters: [view_06334.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06334.created_at_date: "7 days"]
    unless: [view_06334.id, view_06334.status]
  }

  join: view_06336 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06334.user_id} = ${view_06336.id} ;;
    required_joins: []
  }

  join: view_06337 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06334.account_id} = ${view_06337.account_id} ;;
    required_joins: [view_06336]
  }

  join: view_06338 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06334.category} = ${view_06338.category} ;;
  }

  access_filter: {
    field: view_06334.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06334.is_deleted} = false ;;
}
