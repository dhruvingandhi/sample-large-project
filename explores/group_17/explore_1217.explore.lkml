# Explore: explore_1217
# Auto-generated LookML Explore File

include: "/views/domain_02/view_03652.view.lkml"
include: "/views/domain_04/view_03654.view.lkml"
include: "/views/domain_05/view_03655.view.lkml"
include: "/views/domain_06/view_03656.view.lkml"

explore: explore_1217 {
  label: "Explore Explore 1217"
  description: "Comprehensive analytics explore joining base view_03652 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03652
  
  always_filter: {
    filters: [view_03652.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03652.created_at_date: "7 days"]
    unless: [view_03652.id, view_03652.status]
  }

  join: view_03654 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03652.user_id} = ${view_03654.id} ;;
    required_joins: []
  }

  join: view_03655 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03652.account_id} = ${view_03655.account_id} ;;
    required_joins: [view_03654]
  }

  join: view_03656 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03652.category} = ${view_03656.category} ;;
  }

  access_filter: {
    field: view_03652.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03652.is_deleted} = false ;;
}
