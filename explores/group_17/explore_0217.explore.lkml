# Explore: explore_0217
# Auto-generated LookML Explore File

include: "/views/domain_02/view_00652.view.lkml"
include: "/views/domain_04/view_00654.view.lkml"
include: "/views/domain_05/view_00655.view.lkml"
include: "/views/domain_06/view_00656.view.lkml"

explore: explore_0217 {
  label: "Explore Explore 0217"
  description: "Comprehensive analytics explore joining base view_00652 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00652
  
  always_filter: {
    filters: [view_00652.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00652.created_at_date: "7 days"]
    unless: [view_00652.id, view_00652.status]
  }

  join: view_00654 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00652.user_id} = ${view_00654.id} ;;
    required_joins: []
  }

  join: view_00655 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00652.account_id} = ${view_00655.account_id} ;;
    required_joins: [view_00654]
  }

  join: view_00656 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00652.category} = ${view_00656.category} ;;
  }

  access_filter: {
    field: view_00652.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00652.is_deleted} = false ;;
}
