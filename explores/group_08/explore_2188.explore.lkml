# Explore: explore_2188
# Auto-generated LookML Explore File

include: "/views/domain_15/view_06565.view.lkml"
include: "/views/domain_17/view_06567.view.lkml"
include: "/views/domain_18/view_06568.view.lkml"
include: "/views/domain_19/view_06569.view.lkml"

explore: explore_2188 {
  label: "Explore Explore 2188"
  description: "Comprehensive analytics explore joining base view_06565 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06565
  
  always_filter: {
    filters: [view_06565.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06565.created_at_date: "7 days"]
    unless: [view_06565.id, view_06565.status]
  }

  join: view_06567 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06565.user_id} = ${view_06567.id} ;;
    required_joins: []
  }

  join: view_06568 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06565.account_id} = ${view_06568.account_id} ;;
    required_joins: [view_06567]
  }

  join: view_06569 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06565.category} = ${view_06569.category} ;;
  }

  access_filter: {
    field: view_06565.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06565.is_deleted} = false ;;
}
