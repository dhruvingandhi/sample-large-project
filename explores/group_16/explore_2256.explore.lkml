# Explore: explore_2256
# Auto-generated LookML Explore File

include: "/views/domain_19/view_06769.view.lkml"
include: "/views/domain_21/view_06771.view.lkml"
include: "/views/domain_22/view_06772.view.lkml"
include: "/views/domain_23/view_06773.view.lkml"

explore: explore_2256 {
  label: "Explore Explore 2256"
  description: "Comprehensive analytics explore joining base view_06769 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06769
  
  always_filter: {
    filters: [view_06769.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06769.created_at_date: "7 days"]
    unless: [view_06769.id, view_06769.status]
  }

  join: view_06771 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06769.user_id} = ${view_06771.id} ;;
    required_joins: []
  }

  join: view_06772 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06769.account_id} = ${view_06772.account_id} ;;
    required_joins: [view_06771]
  }

  join: view_06773 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06769.category} = ${view_06773.category} ;;
  }

  access_filter: {
    field: view_06769.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06769.is_deleted} = false ;;
}
