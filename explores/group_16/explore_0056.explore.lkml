# Explore: explore_0056
# Auto-generated LookML Explore File

include: "/views/domain_19/view_00169.view.lkml"
include: "/views/domain_21/view_00171.view.lkml"
include: "/views/domain_22/view_00172.view.lkml"
include: "/views/domain_23/view_00173.view.lkml"

explore: explore_0056 {
  label: "Explore Explore 0056"
  description: "Comprehensive analytics explore joining base view_00169 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00169
  
  always_filter: {
    filters: [view_00169.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00169.created_at_date: "7 days"]
    unless: [view_00169.id, view_00169.status]
  }

  join: view_00171 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00169.user_id} = ${view_00171.id} ;;
    required_joins: []
  }

  join: view_00172 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00169.account_id} = ${view_00172.account_id} ;;
    required_joins: [view_00171]
  }

  join: view_00173 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00169.category} = ${view_00173.category} ;;
  }

  access_filter: {
    field: view_00169.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00169.is_deleted} = false ;;
}
